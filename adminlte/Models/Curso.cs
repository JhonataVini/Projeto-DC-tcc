using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;


namespace adminlte.Models
{
    public class Curso
    {
        [Key]
        public int ID { get; set; }
        public string NomeCurso { get; set; }
        public int DuracaoCurso { get; set; }
        public string IdiomaCurso { get; set; }
        public string DescrCurso { get; set; }
        public float Valor { get; set; }
        public int IDCategoria { get; set; }
        public string LinkCurso { get; set; }      
    }
}