using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Sofka.Repository.Game.Models
{
    public partial class Preguntas
    {
        public int IdPregunta { get; set; }
        public string Pregunta { get; set; }
        public int IdCategoriaFk { get; set; }

        public virtual Categorias IdCategoriaFkNavigation { get; set; }
    }
}
