using BlazingQuiz.Shared;
using BlazingQuiz.Shared.DTOs;
using Refit;


namespace BlazingQuiz.Web.Apis
{
    [Headers("Authorization: Bearer ")]
    public interface IUserApi
    {
        [Get("/api/users")]
        Task<PagedResult<UserDto>> GetUsersAsync(UserApprovedFilter approvedType, int StartIndex, int pageSize);

        [Patch("/api/users/{userId}/toggle-status")]
        Task ToggleUserApprovedStatusAsync(int userId);

        [Delete("/api/users/{userId}")]
        Task DeleteUserAsync(int userId); // Добавьте этот метод

        [Get("/api/users/student-quizes")]
        Task<PagedResult<StudentQuizDto>> GetViewStudentQuizesAsync(int studentId, int startIndex, int pageSize);

        // IUserApi.cs
        [Get("/api/users/export-student-results")]
        Task<HttpResponseMessage> ExportStudentResultsAsync();

        [Get("/api/users/{userId}")]
        Task<UserUpdateDto> GetStudentIdData(int userId);

        [Patch("/api/users/update-user")]
        Task UpdateUserData(UserUpdateDto user);
    }
}
