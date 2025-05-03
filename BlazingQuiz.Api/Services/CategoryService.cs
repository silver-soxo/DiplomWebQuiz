using BlazingQuiz.Api.Data;
using BlazingQuiz.Api.Data.Entities;
using BlazingQuiz.Shared.DTOs;
using Microsoft.EntityFrameworkCore;

namespace BlazingQuiz.Api.Services
{
    public class CategoryService
    {
        private readonly QuizContext _context;

        public CategoryService(QuizContext context) 
        {
            _context = context;
        }

        //Метод для сохраниния категорий
        public async Task<QuizApiResponse> SaveCategoryAsync(CategoryDto dto) 
        {
            //Проверка существования категории
            if (await _context.Categories
                         .AsNoTracking()
                         .AnyAsync(c => c.Name == dto.Name && c.Id != dto.Id))
            {
                //Вывод ошибка о существовании категории с таким же названием
                return QuizApiResponse.Fail("Категория с таким же названием уже существует");
            }
            if (dto.Id == 0)
            {
                //Создаём новую категорию
                    //Создаём объект категории
                var category = new Category 
                {
                    Name = dto.Name
                };
                _context.Categories.Add(category);
            }
            else
            {
                //Обноляем категорию
                    //Получаем категории из бд
                var dbCategory = await _context.Categories
                    .FirstOrDefaultAsync(c => c.Id == dto.Id); 
                if (dbCategory == null)
                {
                    //Категори не существует => вывод сообщения об ошибке
                    return QuizApiResponse.Fail("Категории с таким названием не существует");
                }
                //Обновление имени категории
                dbCategory.Name = dto.Name; 
                _context.Categories.Update(dbCategory);
            }
            //Сохрание изменений
            await _context.SaveChangesAsync(); 
            return QuizApiResponse.Success();
        }

        //Метод вывода всех категорий
        public async Task<CategoryDto[]> GetCategoriesAsync() => 
            await _context.Categories.AsNoTracking()
            .Select(c=> new CategoryDto
            {
                Name=c.Name,
                Id=c.Id
            })
            .ToArrayAsync();
        
    }
}
