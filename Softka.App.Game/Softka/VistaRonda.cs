using System;
using System.Collections.Generic;
using System.Text;

namespace Softka
{
    public class VistaRonda
    {
        public int NumeroRonda { get; set; }
        public int Acumulado { get; set; }
        public Estado Estado { get; set; }
        public int IdRespuesta { get; set; }
    }
    public enum Estado
    {
        Retirado =1,
        Perdedor =2,
        Ganador = 3
    }
}
