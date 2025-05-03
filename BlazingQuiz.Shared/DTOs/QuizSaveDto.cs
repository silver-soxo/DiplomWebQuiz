using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlazingQuiz.Shared.DTOs
{
    public class QuizSaveDto
    {
        public Guid Id { get; set; }
        [Required, MaxLength(100)]
        public string Name { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "Категория обязательна")]
        public int CategoryId { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "Укажите допустимое количество вопросов")]
        public int TotalQuestions { get; set; }

        [Range(1, 120, ErrorMessage = "Укажите допустимое время в минутах")]
        public int TimeInMinutes { get; set; }
        public bool IsActive { get; set; }
        public List<QuestionDto> Questions { get; set; } = [];
    }
    public class OptionDto
    {
        public int Id { get; set; }
        [Required, MaxLength(200)]
        public string Text { get; set; }
        public bool IsCorrect { get; set; }
    }

    public class QuestionDto
    {
        public int Id { get; set; }
        [Required, MaxLength(250)]
        public string Text { get; set; }
        public List<OptionDto> Options { get; set; } = [];
    }
}
