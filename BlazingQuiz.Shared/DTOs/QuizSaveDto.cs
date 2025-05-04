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

        //Обработчик ошибок при сохранении теста

        public string? Validate()
        {
            if (TotalQuestions != Questions.Count)
                return "Количество вопросов не совпадает с числом указанном в поле 'Количество вопросов'";

            if (Questions.Any(q => string.IsNullOrWhiteSpace(q.Text)))
                return "Отсутвует текст вопроса";

            if (Questions.Any(q => q.Options.Count < 2))
                return "Для вопросов требуется минимум 2 варианта ответа";

            if (Questions.Any(q => !q.Options.Any(o => o.IsCorrect)))
                return "Для каждого вопроса необходимо указать правильный вариант ответа";

            if (Questions.Any(q => q.Options.Any(o => string.IsNullOrWhiteSpace(o.Text))))
                return "Отсутвует текст вопроса";

            return null;
        }
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
