using BlazingQuiz.Api.Data;
using BlazingQuiz.Shared.DTOs;
using Microsoft.EntityFrameworkCore;

namespace BlazingQuiz.Api.Services
{
    public class StudentQuizService
    {
        private readonly QuizContext _context;

        public StudentQuizService(QuizContext quizContext)
        {
            _context = quizContext;
        }

        public async Task<QuizListDto[]> GetActiveQuizesAsync(int categoryId)
        {
            var query = _context.Quizzes.Where(q => q.IsActive);

            if (categoryId > 0)
            {
                query = query.Where(q => q.CategoryId == categoryId);
            }
            var quizes = await query.Select(q => new QuizListDto
            {
                CategoryId = q.CategoryId,
                CategoryName = q.Category.Name,
                Name = q.Category.Name,
                TimeInMinutes = q.TimeInMinutes,
                TotalQuestions = q.TotalQuestions,
                Id = q.Id
            }).ToArrayAsync();
            return quizes;
        }
    }
}
