﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlazingQuiz.Shared.DTOs
{
    public class CategoryDto
    {
        public int Id { get; set; }

        [Required, MaxLength(50)]
        public string Name { get; set; }

    }
}
