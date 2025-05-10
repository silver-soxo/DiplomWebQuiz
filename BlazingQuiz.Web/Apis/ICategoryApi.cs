using BlazingQuiz.Shared.DTOs;
using Refit;
using System.Runtime;

namespace BlazingQuiz.Web.Apis
{
    //Добавление токена в качестве заголовка авторизации
    [Headers("Authorization: Bearer ")]
    public interface ICategoryApi
    {
        [Post("/api/categories")]
        Task<QuizApiResponse> SaveCategoryAsync(CategoryDto categoryDto);

        [Get("/api/categories")]
        Task<CategoryDto[]> GetCategoriesAsync();
    }
}
