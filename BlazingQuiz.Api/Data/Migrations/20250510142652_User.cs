using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace BlazingQuiz.Api.Data.Migrations
{
    /// <inheritdoc />
    public partial class User : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "UserId",
                table: "StudentQuizQuestion",
                type: "int",
                nullable: true);

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "Id",
                keyValue: 1,
                column: "PasswordHash",
                value: "AQAAAAIAAYagAAAAENol+yMgvN+++qOOnQ8szUJWEjGXMEfRmIbciBNQrCBY/xygB0UVeLcrw6DHMgTNvQ==");

            migrationBuilder.CreateIndex(
                name: "IX_StudentQuizQuestion_UserId",
                table: "StudentQuizQuestion",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_StudentQuizQuestion_Users_UserId",
                table: "StudentQuizQuestion",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_StudentQuizQuestion_Users_UserId",
                table: "StudentQuizQuestion");

            migrationBuilder.DropIndex(
                name: "IX_StudentQuizQuestion_UserId",
                table: "StudentQuizQuestion");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "StudentQuizQuestion");

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "Id",
                keyValue: 1,
                column: "PasswordHash",
                value: "AQAAAAIAAYagAAAAEFC0+fmiNapsfvOAvUpKZeg66Wa4+7BvrfN+GvZtJpXs7iH13l56+IBnIFU8Puu+Yg==");
        }
    }
}
