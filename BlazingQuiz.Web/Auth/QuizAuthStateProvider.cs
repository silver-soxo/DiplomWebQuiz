using BlazingQuiz.Shared;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.JSInterop;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography.X509Certificates;
using System.Text.Json;

namespace BlazingQuiz.Web.Auth
{
    public class QuizAuthStateProvider : AuthenticationStateProvider
    {
        private const string AuthType = "quiz-auth";
        // Установка пользовательского ключа
        private const string UserDataKey = "udata";

        private Task<AuthenticationState> _authStateTask;
        private readonly IJSRuntime _jsRuntime;
        private readonly NavigationManager _navigationManager;

        // Служба хранения данных о сессии
        public QuizAuthStateProvider(IJSRuntime jSRuntime, NavigationManager navigationManager)
        {
            _jsRuntime = jSRuntime;
            _navigationManager = navigationManager;
            SetAuthStateTask();
        }
        public override Task<AuthenticationState> GetAuthenticationStateAsync() => 
            _authStateTask;

        // Информация о вошедшем в систему пользователе
        public LoggedInUser User { get; private set; }
        // Обработка случаев с нулевым значением
        public bool IsLoggedIn => User?.Id > 0;

        public IJSRuntime JSRuntime { get; set; }

        // Сохранение текущего состояния входа в систему
        public async Task SetLoginAsync(LoggedInUser user)
        {
            User = user;
            
            SetAuthStateTask();
            // Проверка задачи подлинности
            NotifyAuthenticationStateChanged(_authStateTask);
            // Сохраняем точку в Json файл
            await _jsRuntime.InvokeVoidAsync("localStorage.setItem", UserDataKey, user.ToJson());
        }
        // Устанвока задачи выхода из системы
        public async Task SetLogoutAsync()
        {
            User = null;
            SetAuthStateTask();
            NotifyAuthenticationStateChanged(_authStateTask);
            // Удаление ключа пользователя из локального хранилища
            await _jsRuntime.InvokeVoidAsync("localStorage.removeItem", UserDataKey);

        }

        public bool IsInitializing { get; private set; } = true;
        public async Task InitializeAsync()
        {
            try
            {
                var udata = await _jsRuntime.InvokeAsync<string?>("localStorage.getItem", UserDataKey);
                if (string.IsNullOrWhiteSpace(udata))
                {
                    // Пользовательских данных нет в хранилище браузера
                    RedirectToLogin();
                    return;
                }

                var user = LoggedInUser.LoadFrom(udata);
                if (user == null || user.Id == 0)
                {
                    // Состояние пользовательских данных не соответствуед действительности
                    RedirectToLogin();
                    return;
                }

                // Проверка JWT токена
                if (!IsTokenValid(user.Token))
                {
                    RedirectToLogin();
                    return;
                }

                await SetLoginAsync(user);
            }
            finally
            {
                IsInitializing = false;
            }
        }

        private void RedirectToLogin() 
        {
            _navigationManager.NavigateTo("auth/login");
        }

        // Проверка действительности токена
        private static bool IsTokenValid(string token)
        {
            if (string.IsNullOrWhiteSpace(token))
                return false;

            var jwtHandler = new JwtSecurityTokenHandler();
            if (!jwtHandler.CanReadToken(token)) // Формат токена не действителен
                return false;

            var jwt = jwtHandler.ReadJwtToken(token);
            var expClaim = jwt.Claims.FirstOrDefault(c => c.Type == JwtRegisteredClaimNames.Exp);
            if (expClaim == null)
                return false;

            var expTime = long.Parse(expClaim.Value);

            var expDatetimeUtc = DateTimeOffset.FromUnixTimeSeconds(expTime).UtcDateTime;

            return expDatetimeUtc > DateTime.UtcNow;
        }

        private void SetAuthStateTask()
        {
            if (IsLoggedIn)
            {
                var identity = new ClaimsIdentity(User.ToClaims(), AuthType);
                var principal = new ClaimsPrincipal(identity);
                var authState = new AuthenticationState(principal);

                _authStateTask = Task.FromResult(authState);
            }
            else
            {
                var identity = new ClaimsIdentity();
                var principal = new ClaimsPrincipal(identity);
                var authState = new AuthenticationState(principal);

                _authStateTask = Task.FromResult(authState);
            }
        }

    }
}
