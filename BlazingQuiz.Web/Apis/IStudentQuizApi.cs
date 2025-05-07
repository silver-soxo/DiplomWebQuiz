using BlazingQuiz.Shared.DTOs;
using Refit;

namespace BlazingQuiz.Web.Apis
{
    [Headers("Authorization: Bearer ")]
    public interface IStudentQuizApi
    {
        [Get("/api/student/avaliable-quizes")]
        Task<QuizListDto[]> GetActiveQuizesAsync(int categoryId);
    }
}
