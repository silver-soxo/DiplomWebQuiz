﻿using BlazingQuiz.Shared.DTOs;
using Refit;

namespace BlazingQuiz.Web.Apis
{
    [Headers("Authorization: Bearer ")]
    public interface IStudentQuizApi
    {
        [Get("/api/student/avaliable-quizes")]
        Task<QuizListDto[]> GetActiveQuizesAsync(int categoryId);

        [Get("/api/student/my-quizes")]
        Task<PagedResult<StudentQuizDto>> GetStudentQuizesAsync(int startIndex, int pageSize);

        [Post("/api/student/quiz/{quizId}/start")]
        Task<QuizApiResponse<int>> StartQuizAsync(Guid quizId);

        [Get("/api/student/quiz/{studentQuizId}/next-question")]
        Task<QuizApiResponse<QuestionDto?>> GetNextQuestionForQuizAsync(int studentQuizId);

        [Post("/api/student/quiz/{studentQuizId}/save-response")]
        Task<QuizApiResponse> SaveQuestionResponseAsync(int studentQuizId, StudentQuizQuestionResponseDto dto);

        [Post("/api/student/quiz/{studentQuizId}/submit")]
        Task<QuizApiResponse> SubmitQuizAsync(int studentQuizId);

        [Post("/api/student/quiz/{studentQuizId}/auto-submit")]
        Task<QuizApiResponse> AutoSubmitQuizAsync(int studentQuizId);

        [Post("/api/student/quiz/{studentQuizId}/exit")]
        Task<QuizApiResponse> ExitQuizAsync(int studentQuizId);
    }
}
