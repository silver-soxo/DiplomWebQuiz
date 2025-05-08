using BlazingQuiz.Api.Data.Entities;
using BlazingQuiz.Shared;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace BlazingQuiz.Api.Data
{
    public class QuizContext : DbContext
    {
        protected readonly IPasswordHasher<User> _passwordHasher;
        public QuizContext(DbContextOptions<QuizContext> options, IPasswordHasher<User> passwordHasher) : base(options)
        {
            _passwordHasher = passwordHasher;
        }

        public DbSet<Category> Categories { get; set; }
        public DbSet<Option> Options { get; set; }
        public DbSet<Question> Questions { get; set; }
        public DbSet<Quiz> Quizzes { get; set; }
        public DbSet<StudentQuiz> StudentQuizzes { get; set; }
        public DbSet<User> Users { get; set; }

        public DbSet<StudentQuizQuestion> StudentQuizQuestion { get; set; }
        public IPasswordHasher<User> PasswordHasher { get; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<StudentQuizQuestion>().HasKey(s=> new { s.StudentQuizId, s.QuestionId});

            //ДОБАВЛЕННО ИНДУСОМ В ПОПЫТКЕ ИСПРАИВТЬ ОШИБКУ В МИГРАЦИИ
            modelBuilder.Entity<StudentQuizQuestion>()
                .HasOne(s => s.StudentQuiz)
                .WithMany(s => s.StudentQuizQuestion)
                .OnDelete(DeleteBehavior.NoAction);

            //ДОБАВЛЕННО ИНДУСОМ В ПОПЫТКЕ ИСПРАИВТЬ ОШИБКУ В МИГРАЦИИ
            modelBuilder.Entity<StudentQuizQuestion>()
                .HasOne(s => s.Question)
                .WithMany(s => s.StudentQuizQuestion)
                .OnDelete(DeleteBehavior.NoAction);

            base.OnModelCreating(modelBuilder);

            var adminUser = new User
            {
                Id = 1,
                Name = "Andrey",
                Email = "admin@bk.ru",
                Phone = "89777441323",
                Role = nameof(UserRole.Admin),
                IsApproved = true
            };
            adminUser.PasswordHash = _passwordHasher.HashPassword(adminUser, "12345");

            modelBuilder.Entity<User>()
                .HasData(adminUser);
        }

    }
}
