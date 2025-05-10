using BlazingQuiz.Api.Services;
using BlazingQuiz.Shared;

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

            group.MapPatch("{userId:int}/toggle-status", async (int userId, UserService service) =>
            {
                await service.ToggleUserApprovedStatusAsync(userId);
                Results.Ok();
            });

            group.MapDelete("{userId:int}", async (int userId, UserService service) =>
            {
                await service.DeleteUserAsync(userId);
                Results.Ok();
            });
            return app;
        }
    }
}
