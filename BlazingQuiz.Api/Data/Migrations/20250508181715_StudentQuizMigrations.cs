using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace BlazingQuiz.Api.Data.Migrations
{
    /// <inheritdoc />
    public partial class StudentQuizMigrations : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<DateTime>(
                name: "CompletedOn",
                table: "StudentQuizzes",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2");

            migrationBuilder.AddColumn<string>(
                name: "Status",
                table: "StudentQuizzes",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.CreateTable(
                name: "StudentQuizQuestion",
                columns: table => new
                {
                    StudentQuizId = table.Column<int>(type: "int", nullable: false),
                    QuestionId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StudentQuizQuestion", x => new { x.StudentQuizId, x.QuestionId });
                    table.ForeignKey(
                        name: "FK_StudentQuizQuestion_Questions_QuestionId",
                        column: x => x.QuestionId,
                        principalTable: "Questions",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_StudentQuizQuestion_StudentQuizzes_StudentQuizId",
                        column: x => x.StudentQuizId,
                        principalTable: "StudentQuizzes",
                        principalColumn: "Id");
                });

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "Email", "PasswordHash" },
                values: new object[] { "admin@bk.ru", "AQAAAAIAAYagAAAAEFC0+fmiNapsfvOAvUpKZeg66Wa4+7BvrfN+GvZtJpXs7iH13l56+IBnIFU8Puu+Yg==" });

            migrationBuilder.CreateIndex(
                name: "IX_StudentQuizQuestion_QuestionId",
                table: "StudentQuizQuestion",
                column: "QuestionId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "StudentQuizQuestion");

            migrationBuilder.DropColumn(
                name: "Status",
                table: "StudentQuizzes");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CompletedOn",
                table: "StudentQuizzes",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "Email", "PasswordHash" },
                values: new object[] { "adbmin@bk.ru", "AQAAAAIAAYagAAAAEMtjqm5sgG6l/3ka1BFaaiQwJi9rYXb+HSNo/jrUueQRYimBYzF0VeEO967e4eVwZA==" });
        }
    }
}
