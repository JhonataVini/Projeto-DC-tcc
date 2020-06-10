using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using adminlte.Models;

namespace adminlte.DAL
{
    public class DirecionaCursos : DbContext
    {
        public DirecionaCursos() : base("direcionacursos")
        {
        }

        public DbSet<Aluno> Alunos { get; set; }
        public DbSet<Escolaridade> Escolaridades  { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }
    }
}

