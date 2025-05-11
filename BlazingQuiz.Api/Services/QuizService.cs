using BlazingQuiz.Api.Data;
using BlazingQuiz.Api.Data.Entities;
using BlazingQuiz.Shared.DTOs;
using Microsoft.EntityFrameworkCore;

namespace BlazingQuiz.Api.Services
{
    public class QuizService
    {
        private readonly QuizContext _context;
        public QuizService(QuizContext context)
        {
            _context = context;
        }

        // Задача на редактирвание и добавление теста
        public async Task<QuizApiResponse> SaveQuizAsync(QuizSaveDto dto)
        {
            // Создание нового теста
            var questions = dto.Questions
                    .Select(q =>
                    new Question
                    {
                        Id = q.Id,
                        Text = q.Text,
                        Options = q.Options.Select(o => new Option
                        {
                            Id = o.Id,
                            Text = o.Text,
                            IsCorrect = o.IsCorrect
                        }).ToArray()

                    }).ToArray();

            if (dto.Id == Guid.Empty)
            {
                var quiz = new Quiz
                {
                    CategoryId = dto.CategoryId,
                    IsActive = dto.IsActive,
                    Name = dto.Name,
                    TimeInMinutes = dto.TimeInMinutes,
                    TotalQuestions = dto.TotalQuestions,
                    Questions = questions
                };

                _context.Quizzes.Add(quiz);
            }
            else
            {
                // Обновление существующего теста
                var dbQuiz = await _context.Quizzes.FirstOrDefaultAsync(q=> q.Id == dto.Id);
                if (dbQuiz == null) 
                {
                    return QuizApiResponse.Fail("Теста не существует");
                }
                
                dbQuiz.CategoryId = dto.CategoryId;
                dbQuiz.IsActive = dto.IsActive;
                dbQuiz.Name = dto.Name;
                dbQuiz.TotalQuestions = dto.TotalQuestions;
                dbQuiz.TimeInMinutes = dto.TimeInMinutes;
                dbQuiz.Questions = questions;

                // Обновление базы данных но EntityFramework делает это по умолчанию
                //_context.Quizzes.Update(dbQuiz);
            }

            try
            {
                await _context.SaveChangesAsync();
                return QuizApiResponse.Success();
            }
            catch (Exception ex) 
            {
                return QuizApiResponse.Fail(ex.Message);
            }
        }

        public async Task<QuizListDto[]> GetQuizesAsync() 
        {
            //Нужно добавить постарничную навигацтию и фильтр по категориям

            return await _context.Quizzes.Select(q=> new QuizListDto
                {
                    Id = q.Id,
                    Name = q.Name,
                    TimeInMinutes = q.TimeInMinutes,
                    TotalQuestions = q.TotalQuestions,
                    IsActive = q.IsActive,
                    CategoryId = q.CategoryId,
                    CategoryName = q.Category.Name,
                })
                .ToArrayAsync();
        }

        public async Task<QuestionDto[]> GetQuizQuestionsAsync(Guid quizId) =>
            await _context.Questions.Where(q=> q.QuizId == quizId)
            .Select(q=> new QuestionDto 
            {
                Id= q.Id,
                Text = q.Text
            })
            .ToArrayAsync();

        public async Task<QuizSaveDto?> GetQuizToEditAsync(Guid quizId)
        {
            var quiz = await _context.Quizzes
                .Where(q => q.Id == quizId)
                .Select(qz => new QuizSaveDto
                {
                    Id = qz.Id,
                    CategoryId = qz.CategoryId,
                    IsActive = qz.IsActive,
                    Name = qz.Name,
                    TimeInMinutes = qz.TimeInMinutes,
                    TotalQuestions = qz.TotalQuestions,
                    Questions = qz.Questions
                        .Select(q =>  new QuestionDto 
                        {
                            Id = q.Id,
                            Text = q.Text,
                            Options = q.Options
                                .Select(o => new OptionDto
                                {
                                    Text = o.Text,
                                    Id = o.Id,
                                    IsCorrect = o.IsCorrect
                                }).ToList()
                        }).ToList()
                }).FirstOrDefaultAsync();
            return quiz;
        }

        public async Task DeleteQuizAsync(Guid quizId)
        {
            using var transaction = await _context.Database.BeginTransactionAsync();

            try
            {
                // Удаление связанных записей
                await _context.StudentQuizQuestion
                    .Where(sqq => _context.StudentQuizzes
                        .Any(sq => sq.QuizId == quizId && sq.Id == sqq.StudentQuizId))
                    .ExecuteDeleteAsync();

                await _context.Options
                    .Where(sqq => _context.Questions
                        .Any(sq => sq.QuizId == quizId && sq.Id == sqq.QuestionId))
                    .ExecuteDeleteAsync();

                await _context.StudentQuizzes
                    .Where(sq => sq.QuizId == quizId)
                    .ExecuteDeleteAsync();

                await _context.Questions
                    .Where(sq => sq.QuizId == quizId)
                    .ExecuteDeleteAsync();

                await _context.Quizzes
                    .Where(u => u.Id == quizId)
                    .ExecuteDeleteAsync();

                await transaction.CommitAsync();
            }
            catch
            {
                await transaction.RollbackAsync();
                throw;
            }
        }
    }
}
