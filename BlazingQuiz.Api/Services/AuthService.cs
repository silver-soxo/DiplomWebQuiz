using BlazingQuiz.Api.Data;
using BlazingQuiz.Api.Data.Entities;
using BlazingQuiz.Shared;
using BlazingQuiz.Shared.DTOs;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage.Json;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;

namespace BlazingQuiz.Api.Services
{
    public class AuthService
    {
        private readonly QuizContext _context;
        private readonly IPasswordHasher<User> _passwordHasher;
        private readonly IConfiguration _configuration;

        public AuthService(QuizContext context, IPasswordHasher<User> passwordHasher, IConfiguration configuration)
        {
            _context = context;
            _passwordHasher = passwordHasher;
            _configuration = configuration;
        }

        public async Task<AuthResponseDto> LoginAsync(LoginDto dto)
        {
            var user = await _context.Users
                .AsNoTracking()
                .FirstOrDefaultAsync(u => u.Email == dto.Username);

            var test = new User
            {
                Email = user.Email
            };

            if (user == null)
            {
                // Неверное имя пользователя
                return new AuthResponseDto(default, "Неверный логин");
            }

            if (!user.IsApproved)
                return new AuthResponseDto(default, "Ваша учетная запись пока не одобрена");

            var passwordResult = _passwordHasher.VerifyHashedPassword(test, user.PasswordHash, dto.Password);
            if (passwordResult == PasswordVerificationResult.Failed)
            {
                // Неверный пароль
                return new AuthResponseDto(default, "Неверный Пароль");
            }

            //Генерирукм JWT токен и отправляем его клиенту
            var jwt = GenerateJwtToken(user);
            var loggedInUser = new LoggedInUser(user.Id, user.Name, user.Role, jwt);
            return new AuthResponseDto(loggedInUser);
        }

        public async Task<QuizApiResponse> RegisterAsync(RegisterDto dto)
        {
            if (await _context.Users.AnyAsync(u => u.Email == dto.Email))
            {
                return QuizApiResponse.Fail("Пользователь с такой почтой уже существует");
            }

            var user = new User
            {
                Email = dto.Email,
                Name = dto.Name,
                Phone = dto.Phone,
                Role = nameof(UserRole.Student),
                IsApproved = false
            };

            var test = new User
            {
                Email = dto.Email
            };

            user.PasswordHash = _passwordHasher.HashPassword(test, dto.Password);
            _context.Users.Add(user);
            try
            {
                await _context.SaveChangesAsync();
                return QuizApiResponse.Success();
            }
            catch (Exception ex) 
            {
                return QuizApiResponse.Fail(ex.Message);
            }
        }

        private string GenerateJwtToken(User user)
        {
            Claim[] claims =
                [
                   new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
                   new Claim(ClaimTypes.Name, user.Name),
                   new Claim(ClaimTypes.Role, user.Role)
                ];

            var secretKey = _configuration.GetValue<string>("Jwt:Secret"); //Получаем в AppSettings
            var symmetricKey = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(secretKey));
            var signingCred = new SigningCredentials(symmetricKey, SecurityAlgorithms.HmacSha256);


            var jwtSecurityToken = new JwtSecurityToken(
                issuer: _configuration.GetValue<string>("Jwt:Issuer"),
                audience: _configuration.GetValue<string>("Jwt:Audience"),
                claims: claims,
                expires: DateTime.UtcNow.AddMinutes(_configuration.GetValue<int>("Jwt:ExpireInMinutes")),
                signingCredentials: signingCred
                );

            var token = new JwtSecurityTokenHandler().WriteToken(jwtSecurityToken);

            return token;
        }
    }
}
