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
    }
}
