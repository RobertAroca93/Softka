using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Sofka.Repository.Game.Models
{
    public partial class TiposIdentificacion
    {
        public TiposIdentificacion()
        {
            Personas = new HashSet<Personas>();
        }

        public int IdTipoIdentificacion { get; set; }
        public string Tipo { get; set; }

        public virtual ICollection<Personas> Personas { get; set; }
    }
}
