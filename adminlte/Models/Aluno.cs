using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
    

namespace adminlte.Models
{
    public class Aluno
    {
        [Key]
        public int ID { get; set; }

        [Required(ErrorMessage ="Por favor insira um nome!")]
        public string Nome { get; set; }

        [Required(ErrorMessage = "Por favor selecione o sexo!")]
        public char Sexo { get; set; }

        [Required(ErrorMessage = "Por favor insira uma data de nascimento!")]
        public DateTime Nascimento { get; set; }

        [EmailAddress(ErrorMessage ="Por favor insira um email válido!")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Por favor selecione sua escolaridade!")]
        public int IdEscolaridade { get; set; }

        [Required(ErrorMessage = "Por favor digite uma senha!")]
        [DataType(DataType.Password)]
        public string Senha { get; set; }

        [Compare("Senha",ErrorMessage = "Por favor confirme sua senha!")]
        [DataType(DataType.Password)]
        public string ConfirmaSenha { get; set; }
    }
}