﻿using BlazingQuiz.Shared.DTOs;

namespace BlazingQuiz.Web
{
    public class QuizState
    {
        public int StudentQuizId { get; private set; }

        public QuizListDto? Quiz { get; private set; }
        public void StartQuiz(QuizListDto? quiz, int studentQuizId) => 
            (Quiz, StudentQuizId) = (quiz, studentQuizId);
    }
}
