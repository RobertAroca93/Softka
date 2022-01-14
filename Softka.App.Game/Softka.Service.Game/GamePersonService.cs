using Sofka.Repository.Game.Context;
using Sofka.Repository.Game.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Softka.Service.Game
{
    public class GamePersonService
    {
        public void Update(int idPregunta, int idPersona, int idJuego,int idRespuesta)
        {
            using var ctx = new SoftkaContext();
            PersonasJuegos personaJuego = ctx.PersonasJuegos.Where(x => x.IdPersonaFk == idPersona && x.IdJuegoFk == idJuego).FirstOrDefault();
            personaJuego.IdPreguntaFk = idPregunta;
            if (idRespuesta != 0)
                personaJuego.IdRespuestaFk =  idRespuesta;
            ctx.SaveChanges();
        }
        public void Create(int idPregunta, int idPersona, int idJuego,int idRespuesta)
        {
            using var ctx = new SoftkaContext();
            PersonasJuegos personaJuego = new PersonasJuegos()
            {
                IdJuegoFk = idJuego,
                IdPersonaFk = idPersona,
                IdPreguntaFk = idPregunta,
                IdRespuestaFk = idRespuesta
            };
            ctx.PersonasJuegos.Add(personaJuego);
            ctx.SaveChanges();
        }
    }
}
