using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace BlazingQuiz.Api.Data.Migrations
{
    /// <inheritdoc />
    public partial class User2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
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
                value: "AQAAAAIAAYagAAAAEID6F2qbMMbxIk8RLajBXT92eCSbVMVdJodHoEqRNAAMZJXpycT9dr+DLghIWU+GUg==");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
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
    }
}
