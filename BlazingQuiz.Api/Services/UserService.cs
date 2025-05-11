using BlazingQuiz.Api.Data;
using BlazingQuiz.Shared;
using BlazingQuiz.Shared.DTOs;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using ClosedXML.Excel;
using System.IO;
using System.Net.Mail;
using System.Net;
using DocumentFormat.OpenXml.Spreadsheet;
using Microsoft.AspNetCore.Identity;
using BlazingQuiz.Api.Data.Entities;


namespace BlazingQuiz.Api.Services
{
    public class UserService
    {
        private readonly QuizContext _context;
        private readonly IPasswordHasher<User> _passwordHasher;
        public UserService(QuizContext context) 
        {
            _context = context;
        }

        public async Task<PagedResult<UserDto>> GetUsersAsync(UserApprovedFilter approvedType, int StartIndex, int pageSize) 
        {
            var query = _context.Users.Where(u => u.Role != nameof(UserRole.Admin)).AsQueryable();

            if (approvedType != UserApprovedFilter.All) 
            {
                if (approvedType == UserApprovedFilter.ApprovedOnly)
                    query = query.Where(u => u.IsApproved);
                else
                    query = query.Where(u => !u.IsApproved);
            }

            var total = await query.CountAsync();
            var users = await query.OrderByDescending(u=> u.Id)
                    .Skip(StartIndex)
                    .Take(pageSize)
                    .Select(u => new UserDto(u.Id, u.Name, u.Email, u.Phone, u.IsApproved))
                    .ToArrayAsync();

            return new PagedResult<UserDto>(users, total);
        }

        public async Task ToggleUserApprovedStatusAsync(int userId) 
        {
            var dbUser = await _context.Users.FirstOrDefaultAsync(u => u.Id == userId);
            if (dbUser != null) 
            {
                dbUser.IsApproved = !dbUser.IsApproved;
                //try
                //{
                //    await SendApprovalEmail(email, name);
                //}
                //catch (Exception ex)
                //{

                //}
                await _context.SaveChangesAsync();
            }
        }

        public async Task DeleteUserAsync(int userId)
        {
            using var transaction = await _context.Database.BeginTransactionAsync();

            try
            {
                // Удаление связанных записей
                await _context.StudentQuizQuestion
                    .Where(sqq => _context.StudentQuizzes
                        .Any(sq => sq.StudentId == userId && sq.Id == sqq.StudentQuizId))
                    .ExecuteDeleteAsync();

                await _context.StudentQuizzes
                    .Where(sq => sq.StudentId == userId)
                    .ExecuteDeleteAsync();

                await _context.Users
                    .Where(u => u.Id == userId)
                    .ExecuteDeleteAsync();

                await transaction.CommitAsync();
            }
            catch
            {
                await transaction.RollbackAsync();
                throw;
            }
        }

        public async Task<PagedResult<StudentQuizDto>> GetViewStudentQuizesAsync(int studentId, int startIndex, int pageSize)
        {
            var query = _context.StudentQuizzes.Where(q => q.StudentId == studentId);

            var count = await query.CountAsync();

            var quizes = await query.OrderByDescending(q => q.StartedOn)
                .Skip(startIndex)
                .Take(pageSize)
                .Select(q => new StudentQuizDto
                {
                    Id = q.Id,
                    QuizId = q.QuizId,
                    QuizName = q.Quiz.Name,
                    CategoryName = q.Quiz.Category.Name,
                    Status = q.Status,
                    Score = q.Score,
                    StartedOn = q.StartedOn,
                    CompletedOn = q.CompletedOn,
                    TotalQuestions = q.Quiz.TotalQuestions
                })
                .ToArrayAsync();

            return new PagedResult<StudentQuizDto>(quizes, count);
        }

        public async Task<byte[]> ExportStudentResultsAsync()
        {
            var results = await _context.StudentQuizzes
                .Include(q => q.Quiz).ThenInclude(q => q.Category)
                .Include(q => q.Student)
                .OrderByDescending(q => q.StartedOn)
                .ToListAsync();

            using var workbook = new XLWorkbook();
            var worksheet = workbook.Worksheets.Add("Результаты тестов");

            // Стиль для заголовков
            var headerStyle = workbook.Style;
            headerStyle.Font.Bold = true;
            headerStyle.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;
            headerStyle.Fill.BackgroundColor = XLColor.LightGray;
            headerStyle.Font.FontColor = XLColor.Black;
            headerStyle.Border.OutsideBorder = XLBorderStyleValues.Thin;

            // Заголовки
            worksheet.Cell(1, 1).Value = "Студент";
            worksheet.Cell(1, 2).Value = "Email";
            worksheet.Cell(1, 3).Value = "Тест";
            worksheet.Cell(1, 4).Value = "Категория";
            worksheet.Cell(1, 5).Value = "Статус";
            worksheet.Cell(1, 6).Value = "Оценка";
            worksheet.Cell(1, 7).Value = "Дата начала";
            worksheet.Cell(1, 8).Value = "Дата завершения";

            // Применяем стиль к заголовкам
            worksheet.Range(1, 1, 1, 8).Style = headerStyle;

            // Заполнение данных
            for (int i = 0; i < results.Count; i++)
            {
                var row = i + 2;
                var result = results[i];

                // Чередование цвета строк
                var rowStyle = workbook.Style;
                rowStyle.Fill.BackgroundColor = i % 2 == 0 ? XLColor.White : XLColor.WhiteSmoke;

                worksheet.Cell(row, 1).Value = result.Student.Name;
                worksheet.Cell(row, 2).Value = result.Student.Email;
                worksheet.Cell(row, 3).Value = result.Quiz.Name;
                worksheet.Cell(row, 4).Value = result.Quiz.Category.Name;
                worksheet.Cell(row, 5).Value = TranslateStatus(result.Status);
                worksheet.Cell(row, 6).Value = $"{result.Score}/{result.Quiz.TotalQuestions}";

                // Для ячейки с датой начала
                worksheet.Cell(row, 7).Value = result.StartedOn.ToString("dd.MM.yyyy HH:mm");
                worksheet.Cell(row, 8).Value = result.StartedOn.ToString("dd.MM.yyyy HH:mm");

                // Выравнивание оценок по центру
                worksheet.Cell(row, 6).Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;

                // Применяем стиль строки
                worksheet.Range(row, 1, row, 8).Style = rowStyle;
            }

            // Включаем фильтрацию
            worksheet.Range(1, 1, 1, 8).SetAutoFilter();

            // Автоподбор ширины столбцов
            worksheet.Columns().AdjustToContents();

            // Фиксируем заголовки при прокрутке
            worksheet.SheetView.FreezeRows(1);

            // Границы для всей таблицы
            worksheet.RangeUsed().Style.Border.OutsideBorder = XLBorderStyleValues.Medium;
            worksheet.RangeUsed().Style.Border.InsideBorder = XLBorderStyleValues.Thin;

            using var stream = new MemoryStream();
            workbook.SaveAs(stream);
            return stream.ToArray();
        }

        private string TranslateStatus(string status)
        {
            return status switch
            {
                "Started" => "Начат",
                "Completed" => "Завершён",
                "Exited" => "Прерван",
                "AutoSubmitted" => "Завершён автоматически",
                _ => status
            };
        }

        //private async Task SendApprovalEmail(string email, string name) 
        //{
        //    var a = email;
        //    var b = name;
        //    MailAddress from = new MailAddress("allahu_akbar200@mail.ru", "Tom");
        //    MailAddress to = new MailAddress("rukorko@yandex.ru");
        //    MailMessage m = new MailMessage(from, to);
        //    m.Subject = "Тест";
        //    m.Body = "Письмо-тест 2 работы smtp-клиента";
        //    SmtpClient smtp = new SmtpClient("smtp.mail.ru", 465);
        //    smtp.Credentials = new NetworkCredential("allahu_akbar200@mail.ru", "w6YfKYT1tHJTxrTxycvc");
        //    smtp.EnableSsl = true;
        //    await smtp.SendMailAsync(m);
        //}

        public async Task<UserUpdateDto> GetStudentIdData(int studentId)
        {
            var query = await _context.Users.Where(q => q.Id == studentId)
                .Select(u => new UserUpdateDto(u.Id, u.Name, u.Email, u.Phone, u.PasswordHash)).FirstOrDefaultAsync();
            return query;
            
        }

        //Метод обновления данных пользователя
        public async Task UpdateUserData(UserUpdateDto user)
        {
            var dbUser = await _context.Users.FirstOrDefaultAsync(q => q.Id == user.Id);

            dbUser.Id = user.Id;
            dbUser.Name = user.Name;
            dbUser.Email = user.Email;
            dbUser.Phone = user.Phone;

            var prof = new User
            {
                Email = user.Email,
                Name = user.Name,
                Phone = user.Phone,
                Role = nameof(UserRole.Student),
                IsApproved = false
            };
            dbUser.PasswordHash = _passwordHasher.HashPassword(prof, user.Password);
            await _context.SaveChangesAsync();
        }
    }
}
