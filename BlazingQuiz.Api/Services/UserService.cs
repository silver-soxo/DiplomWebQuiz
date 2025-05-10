using BlazingQuiz.Api.Data;
using BlazingQuiz.Shared;
using BlazingQuiz.Shared.DTOs;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace BlazingQuiz.Api.Services
{
    public class UserService
    {
        private readonly QuizContext _context;

        public UserService(QuizContext context) 
        {
            _context = context;
        }

        public async Task<PagedResult<UserDto>> GetUsersAsync(UserApprovedFilter approvedType, int StartIndex, int pageSize) 
        {
            var query = _context.Users.Where(u => u.Role != nameof(UserRole.Admin)).AsQueryable();

            if (approvedType != UserApprovedFilter.All) 
            {
                if (approvedType == UserApprovedFilter.ApprovedOnly)
                    query = query.Where(u => u.IsApproved);
                else
                    query = query.Where(u => !u.IsApproved);
            }

            var total = await query.CountAsync();
            var users = await query.OrderByDescending(u=> u.Id)
                    .Skip(StartIndex)
                    .Take(pageSize)
                    .Select(u => new UserDto(u.Id, u.Name, u.Email, u.Phone, u.IsApproved))
                    .ToArrayAsync();

            return new PagedResult<UserDto>(users, total);
        }

        public async Task ToggleUserApprovedStatusAsync(int userId) 
        {
            var dbUser = await _context.Users.FirstOrDefaultAsync(u => u.Id == userId);
            if (dbUser != null) 
            {
                dbUser.IsApproved = !dbUser.IsApproved;
                await _context.SaveChangesAsync();
            }
        }

        public async Task DeleteUserAsync(int userId)
        {
            using var transaction = await _context.Database.BeginTransactionAsync();

            try
            {
                // Удаление связанных записей
                await _context.StudentQuizQuestion
                    .Where(sqq => _context.StudentQuizzes
                        .Any(sq => sq.StudentId == userId && sq.Id == sqq.StudentQuizId))
                    .ExecuteDeleteAsync();

                await _context.StudentQuizzes
                    .Where(sq => sq.StudentId == userId)
                    .ExecuteDeleteAsync();

                await _context.Users
                    .Where(u => u.Id == userId)
                    .ExecuteDeleteAsync();

                await transaction.CommitAsync();
            }
            catch
            {
                await transaction.RollbackAsync();
                throw;
            }
        }

    }
}
