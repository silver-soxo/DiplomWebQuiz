using System.Net;
using BlazingQuiz.Api.Data;
using BlazingQuiz.Api.Data.Entities;
using BlazingQuiz.Shared.DTOs;
using Microsoft.EntityFrameworkCore;

namespace BlazingQuiz.Api.Services
{
    public class CategoryService
    {
        private readonly QuizContext _context;

        public CategoryService(QuizContext context) 
        {
            _context = context;
        }

        //Метод для сохраниния категорий
        public async Task<QuizApiResponse> SaveCategoryAsync(CategoryDto dto) 
        {
            //Проверка существования категории
            if (await _context.Categories
                         .AsNoTracking()
                         .AnyAsync(c => c.Name == dto.Name && c.Id != dto.Id))
            {
                //Вывод ошибка о существовании категории с таким же названием
                return QuizApiResponse.Fail("Категория с таким же названием уже существует");
            }
            if (dto.Id == 0)
            {
                //Создаём новую категорию
                    //Создаём объект категории
                var category = new Category 
                {
                    Name = dto.Name
                };
                _context.Categories.Add(category);
            }
            else
            {
                //Обноляем категорию
                    //Получаем категории из бд
                var dbCategory = await _context.Categories
                    .FirstOrDefaultAsync(c => c.Id == dto.Id); 
                if (dbCategory == null)
                {
                    //Категори не существует => вывод сообщения об ошибке
                    return QuizApiResponse.Fail("Категории с таким названием не существует");
                }
                //Обновление имени категории
                dbCategory.Name = dto.Name; 
                _context.Categories.Update(dbCategory);
            }
            //Сохрание изменений
            await _context.SaveChangesAsync(); 
            return QuizApiResponse.Success();
        }

        //Метод вывода всех категорий
        public async Task<CategoryDto[]> GetCategoriesAsync() => 
            await _context.Categories.AsNoTracking()
            .Select(c=> new CategoryDto
            {
                Name=c.Name,
                Id=c.Id
            })
            .ToArrayAsync();

        public async Task DeleteCategoryAsync(int categoryId)
        {
            using var transaction = await _context.Database.BeginTransactionAsync();

            try
            {
                // Проверяем существование категории
                var category = await _context.Categories.FindAsync(categoryId);
                if (category == null)
                    throw new ArgumentException("Категория не найдена");

                // Получаем ID всех тестов этой категории
                var quizIds = await _context.Quizzes
                    .Where(q => q.CategoryId == categoryId)
                    .Select(q => q.Id)
                    .ToListAsync();

                // Удаляем связанные данные для каждого теста
                foreach (var quizId in quizIds)
                {
                    // Получаем ID вопросов для этого теста
                    var questionIds = await _context.Questions
                        .Where(q => q.QuizId == quizId)
                        .Select(q => q.Id)
                        .ToListAsync();

                    // Удаляем варианты ответов для вопросов
                    await _context.Options
                        .Where(o => questionIds.Contains(o.QuestionId))
                        .ExecuteDeleteAsync();

                    // Удаляем связи вопросов с результатами тестов
                    await _context.StudentQuizQuestion
                        .Where(sqq => questionIds.Contains(sqq.QuestionId))
                        .ExecuteDeleteAsync();

                    // Удаляем сами вопросы
                    await _context.Questions
                        .Where(q => q.QuizId == quizId)
                        .ExecuteDeleteAsync();

                    // Удаляем результаты тестирований
                    await _context.StudentQuizQuestion
                        .Where(sqq => _context.StudentQuizzes
                            .Any(sq => sq.QuizId == quizId && sq.Id == sqq.StudentQuizId))
                        .ExecuteDeleteAsync();

                    await _context.StudentQuizzes
                        .Where(sq => sq.QuizId == quizId)
                        .ExecuteDeleteAsync();
                }

                // Удаляем сами тесты
                await _context.Quizzes
                    .Where(q => q.CategoryId == categoryId)
                    .ExecuteDeleteAsync();

                // Удаляем категорию
                _context.Categories.Remove(category);
                await _context.SaveChangesAsync();

                await transaction.CommitAsync();
            }
            catch
            {
                await transaction.RollbackAsync();
                throw; // Пробрасываем исключение дальше
            }
        }
    }
}
