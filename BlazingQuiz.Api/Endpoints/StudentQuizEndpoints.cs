﻿using BlazingQuiz.Api.Services;
using BlazingQuiz.Shared;
using BlazingQuiz.Shared.DTOs;
using System.Security.Claims;

namespace BlazingQuiz.Api.Endpoints
{
    public static class StudentQuizEndpoints
    {
        public static int GetStudentId(this ClaimsPrincipal principal) =>
            Convert.ToInt32(principal.FindFirstValue(ClaimTypes.NameIdentifier));

        public static IEndpointRouteBuilder MapStudentQuizEndpoints(this IEndpointRouteBuilder app)
        {
            var group = app.MapGroup("/api/student").
                RequireAuthorization(p => p.RequireRole(nameof(UserRole.Student)));

            group.MapGet("/avaliable-quizes", async (int categoryId, StudentQuizService service) =>
                Results.Ok(await service.GetActiveQuizesAsync(categoryId)));

            group.MapGet("/my-quizes", async (int startIndex, int pageSize, StudentQuizService service, ClaimsPrincipal principal) =>
                Results.Ok(await service.GetStudentQuizesAsync(principal.GetStudentId(), startIndex, pageSize)));

            var quizGroup = group.MapGroup("/quiz");

            quizGroup.MapPost("/{quizId:guid}/start", async (Guid quizId,ClaimsPrincipal principal, StudentQuizService service) =>
                Results.Ok(await service.StartQuizAsync(principal.GetStudentId(), quizId)));

            quizGroup.MapGet("/{studentQuizId:int}/next-question", async (int studentQuizId, ClaimsPrincipal principal, StudentQuizService service) =>
                Results.Ok(await service.GetNextQuestionForQuizAsync(studentQuizId, principal.GetStudentId())));

            quizGroup.MapPost("/{studentQuizId:int}/save-response", async (int studentQuizId, StudentQuizQuestionResponseDto dto, ClaimsPrincipal principal, StudentQuizService service) =>
            {
                if (studentQuizId != dto.StudentQuizId)
                    return Results.Unauthorized();
                return Results.Ok(await service.SaveQuestionResponseAsync(dto, principal.GetStudentId()));
            });

            quizGroup.MapPost("/{studentQuizId:int}/submit", async (int studentQuizId, ClaimsPrincipal principal, StudentQuizService service) =>
                Results.Ok(await service.SubmitQuizAsync(studentQuizId, principal.GetStudentId())));

            quizGroup.MapPost("/{studentQuizId:int}/auto-submit", async (int studentQuizId, ClaimsPrincipal principal, StudentQuizService service) =>
                Results.Ok(await service.AutoSubmitQuizAsync(studentQuizId, principal.GetStudentId())));

            quizGroup.MapPost("/{studentQuizId:int}/exit", async (int studentQuizId, ClaimsPrincipal principal, StudentQuizService service) =>
                Results.Ok(await service.ExitQuizAsync(studentQuizId, principal.GetStudentId())));

            return app;
        }
    }
}
