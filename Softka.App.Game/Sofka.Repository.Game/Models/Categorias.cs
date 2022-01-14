using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Sofka.Repository.Game.Models
{
    public partial class Categorias
    {
        public Categorias()
        {
            Preguntas = new HashSet<Preguntas>();
        }

        public int IdCategoria { get; set; }
        public string Categoria { get; set; }
        public int Puntos { get; set; }

        public virtual ICollection<Preguntas> Preguntas { get; set; }
    }
}
