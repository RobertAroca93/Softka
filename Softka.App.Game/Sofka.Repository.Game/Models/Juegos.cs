using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Sofka.Repository.Game.Models
{
    public partial class Juegos
    {
        public int IdJuego { get; set; }
        public DateTime FechaInicio { get; set; }
        public bool Estado { get; set; }
        public int PuntosGanados { get; set; }
    }
}
