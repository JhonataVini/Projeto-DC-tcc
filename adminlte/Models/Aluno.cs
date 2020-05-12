using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace adminlte.Models
{
    public class Aluno
    {
        public int ID { get; set; }
        public string Nome { get; set; }
        public char Sexo { get; set; }
        public DateTime Nascimento { get; set; }
        public string Email { get; set; }
        public int IdEscolaridade { get; set; }
        public string Senha { get; set; }
    }
}