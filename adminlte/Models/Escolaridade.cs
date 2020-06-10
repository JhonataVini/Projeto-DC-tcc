using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace adminlte.Models
{
    public class Escolaridade
    {
        [Key]
        public int ID { get; set; }

        public string Descricao { get; set; }
    }
}