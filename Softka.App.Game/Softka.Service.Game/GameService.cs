using Sofka.Repository.Game.Context;
using Sofka.Repository.Game.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Softka.Service.Game
{
    public class GameService
    {
        public int StartGame(int idPerson)
        {
            using var ctx = new SoftkaContext();
            using var transaction = ctx.Database.BeginTransaction();
            Juegos juego = new Juegos()
            {
                Estado = true,
                FechaInicio = DateTime.Now
            };
            ctx.Juegos.Add(juego);
            ctx.SaveChanges();
            PersonasJuegos personaJuego = new PersonasJuegos()
            {
                IdJuegoFk = juego.IdJuego,
                IdPersonaFk = idPerson
            };
            ctx.PersonasJuegos.Add(personaJuego);
            ctx.SaveChanges();
            transaction.Commit();
            return juego.IdJuego;
        }
        public Preguntas GetPregunta(int categoria)
        {
            using var ctx = new SoftkaContext();
            List<Preguntas> preguntas = ctx.Preguntas.Where(x => x.IdCategoriaFk == categoria).ToList();
            Random rnd = new Random();
            int num = rnd.Next(0,4);
            return preguntas[num];
        }
        public List<Respuestas> GetRespuestas(int idPregunta)
        {
            using var ctx = new SoftkaContext();
            List<Respuestas> respuestas = ctx.Respuestas.Where(x => x.IdPreguntaFk == idPregunta).ToList();
            return respuestas;
        }
        public void Update( int idJuego, bool estado, int puntos)
        {
            using var ctx = new SoftkaContext();
            Juegos juego = ctx.Juegos.Where(x => x.IdJuego == idJuego).FirstOrDefault();
            juego.Estado = estado;
            juego.PuntosGanados = puntos;
            ctx.SaveChanges();
        }
    }
}
