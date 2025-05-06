using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlazingQuiz.Shared.DTOs
{
    public record UserDto(int Id, string Name, string Email, string Phone, bool IsApproved);
}
