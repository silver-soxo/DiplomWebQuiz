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

            group.MapGet("", async (UserApprovedFilter filter, int StartIndex, int pageSize, UserService service) =>
                Results.Ok(await service.GetUsersAsync(filter, StartIndex, pageSize)));

            group.MapPatch("{userId:int}/toggle-status", async (int userId, UserService service) =>
            {
                await service.ToggleUserApprovedStatusAsync(userId);
                Results.Ok();
            });
            return app;
        }
    }
}
