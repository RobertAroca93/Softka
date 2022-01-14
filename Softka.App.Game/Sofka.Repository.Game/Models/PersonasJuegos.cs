using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Sofka.Repository.Game.Models
{
    public partial class PersonasJuegos
    {
        public int IdPersonaJuego { get; set; }
        public int IdPersonaFk { get; set; }
        public int IdJuegoFk { get; set; }
        public int IdPreguntaFk { get; set; }
        public int IdRespuestaFk { get; set; }
    }
}
