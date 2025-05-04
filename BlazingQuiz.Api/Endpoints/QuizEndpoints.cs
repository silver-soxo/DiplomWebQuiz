using BlazingQuiz.Api.Services;
using BlazingQuiz.Shared.DTOs;
using System.Reflection.Metadata.Ecma335;

namespace BlazingQuiz.Api.Endpoints
{
    public static class QuizEndpoints
    {
        public static IEndpointRouteBuilder MapQuizEndpoints(this IEndpointRouteBuilder app)
        {
            var quizGroup = app.MapGroup("/api/quizes").RequireAuthorization();

            quizGroup.MapPost("", async (QuizSaveDto dto, QuizService service) =>
            {
                if (dto.Questions.Count == 0)
                    return Results.BadRequest("Пожалуйста укажите вопросы");

                if (dto.Questions.Count != dto.TotalQuestions)
                    return Results.BadRequest("Количество вопросов не совпадает с количеством предоставленных");

                return Results.Ok(await service.SaveQuizAsync(dto));
            });

            quizGroup.MapGet("", async (QuizService service) =>
                Results.Ok(await service.GetQuizesAsync()));

            quizGroup.MapGet("{quizId:guid}/questions", async (Guid quizId, QuizService service) =>
            {
                return Results.Ok(await service.GetQuizQuestionsAsync(quizId));
            });

            return app;
        }
    }
}
