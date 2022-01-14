using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Sofka.Repository.Game.Models
{
    public partial class Personas
    {
        public int IdPersona { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Email { get; set; }
        public int TipoIdentificacionFk { get; set; }
        public string Identificacion { get; set; }

        public virtual TiposIdentificacion TipoIdentificacionFkNavigation { get; set; }
    }
}
