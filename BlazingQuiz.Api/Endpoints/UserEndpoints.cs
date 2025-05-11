using BlazingQuiz.Api.Services;
using BlazingQuiz.Shared;
using System.Security.Claims;

namespace BlazingQuiz.Api.Endpoints
{
    public static class UserEndpoints 
    {
        public static IEndpointRouteBuilder MapUserEndpoints(this IEndpointRouteBuilder app)
        {
            var group = app.MapGroup("/api/users")
                        .RequireAuthorization(p => p.RequireRole(nameof(UserRole.Admin)));

            group.MapGet("", async(UserApprovedFilter approvedType, int StartIndex, int pageSize, UserService service) =>
            {
                //var approvedFilter = Enum.Parse<UserApprovedFilter>(filter);
                return Results.Ok(await service.GetUsersAsync(approvedType, StartIndex, pageSize));
            });

            group.MapPatch("{userId:int}/toggle-status", async (int userId, string name, string email, UserService service) =>
            {
                await service.ToggleUserApprovedStatusAsync(userId, name, email);
                Results.Ok();
            });

            group.MapDelete("{userId:int}", async (int userId, UserService service) =>
            {
                await service.DeleteUserAsync(userId);
                Results.Ok();
            });

            group.MapGet("/student-quizes", async (int studentId, int startIndex, int pageSize, UserService service) =>
            {
                var result = await service.GetViewStudentQuizesAsync(studentId, startIndex, pageSize);
                return Results.Ok(result);
            });

            group.MapGet("/export-student-results", async (UserService service) =>
            {
                var excelBytes = await service.ExportStudentResultsAsync();
                return Results.File(excelBytes,
                                  "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                                  $"StudentResults_{DateTime.Now:yyyyMMdd_HHmmss}.xlsx");
            });

            return app;
        }
    }
}
