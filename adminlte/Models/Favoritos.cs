using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace adminlte.Models
{
    public class Favoritos
    {
        [Key]
        public int IdAluno { get; set; }
        public int IdCurso { get; set; }
    }
}