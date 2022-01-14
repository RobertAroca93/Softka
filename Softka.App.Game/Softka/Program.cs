using Sofka.Repository.Game.Models;
using Softka.Service.Game;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Softka
{
    class Program
    {
        static void Main(string[] args)
        {
            string identificacion = "";
            Console.WriteLine("Hola bienvenido al juego");
            Console.WriteLine("Por favor ingrese su numero de identificación");
            identificacion = Console.ReadLine();
            while (String.IsNullOrEmpty(identificacion))
            {
                Console.WriteLine("Por favor ingrese un valor");
                Console.WriteLine("Por favor ingrese su numero de identificación");
                identificacion = Console.ReadLine();
            }
            Personas persona = GetUser(identificacion);
            if (persona != null)
            {
                Console.WriteLine("Hola " + persona.Nombres + " " + persona.Apellidos);
                int idJuego = StartGame(persona.IdPersona);
                if (idJuego != 0)
                {
                    Console.WriteLine("Se inicia el juego, IdJuego: " + idJuego);
                    VistaRonda vistaRonda = GetRonda(persona.IdPersona, idJuego);
                    Console.WriteLine("Finalizó el juego");
                    Console.WriteLine("Resultado:");
                    Console.WriteLine("Acumulado: " + vistaRonda.Acumulado);
                }
            }
            else
            {
                Console.WriteLine("Acceso denegado");
                Console.WriteLine("Fin del juego");
            }
        }
        static Personas GetUser(string identificacion)
        {
            PersonService personService = new PersonService();
            Personas persona = personService.GetUser(identificacion);
            return persona;
        }
        static int StartGame(int idPerson)
        {
            GameService gameService = new GameService();
            int idJuego = gameService.StartGame(idPerson);
            return idJuego;
        }
        static VistaRonda GetRonda(int idPerson, int idJuego)
        {
            int ronda = 1;
            bool finaliza = false;
            VistaRonda vistaRonda = new VistaRonda();
            GameService gameService = new GameService();
            while (ronda <= 5 || finaliza)
            {
                switch (ronda)
                {
                    case 1:
                        Preguntas preguntaMuyFacil = gameService.GetPregunta(CategoriaEnum.MuyFacil.GetHashCode());
                        List<Respuestas> respuestasMuyFaciles = gameService.GetRespuestas(preguntaMuyFacil.IdPregunta);
                        FormularPregunta(preguntaMuyFacil, respuestasMuyFaciles, vistaRonda);
                        AcumularPremio(vistaRonda, preguntaMuyFacil.IdPregunta, CategoriaEnum.MuyFacil.GetHashCode(), idPerson, idJuego);
                        break;
                    case 2:
                        Preguntas preguntaFacil = gameService.GetPregunta(CategoriaEnum.Facil.GetHashCode());
                        List<Respuestas> respuestasFaciles = gameService.GetRespuestas(preguntaFacil.IdPregunta);
                        FormularPregunta(preguntaFacil, respuestasFaciles, vistaRonda);
                        AcumularPremio(vistaRonda, preguntaFacil.IdPregunta, CategoriaEnum.Facil.GetHashCode(), idPerson, idJuego);
                        break;
                    case 3:
                        Preguntas preguntaIntermedia = gameService.GetPregunta(CategoriaEnum.Intermedio.GetHashCode());
                        List<Respuestas> respuestasIntermedias = gameService.GetRespuestas(preguntaIntermedia.IdPregunta);
                        FormularPregunta(preguntaIntermedia, respuestasIntermedias, vistaRonda);
                        AcumularPremio(vistaRonda, preguntaIntermedia.IdPregunta, CategoriaEnum.Intermedio.GetHashCode(), idPerson, idJuego);
                        break;
                    case 4:
                        Preguntas preguntaIntermediaAlta = gameService.GetPregunta(CategoriaEnum.IntermedioAlto.GetHashCode());
                        List<Respuestas> respuestasIntermediasAltas = gameService.GetRespuestas(preguntaIntermediaAlta.IdPregunta);
                        FormularPregunta(preguntaIntermediaAlta, respuestasIntermediasAltas, vistaRonda);
                        AcumularPremio(vistaRonda, preguntaIntermediaAlta.IdPregunta, CategoriaEnum.IntermedioAlto.GetHashCode(), idPerson, idJuego);
                        break;
                    case 5:
                        Preguntas preguntaAvanzada = gameService.GetPregunta(CategoriaEnum.Avanzado.GetHashCode());
                        List<Respuestas> respuestasAvanzadas = gameService.GetRespuestas(preguntaAvanzada.IdPregunta);
                        FormularPregunta(preguntaAvanzada, respuestasAvanzadas, vistaRonda);
                        AcumularPremio(vistaRonda, preguntaAvanzada.IdPregunta, CategoriaEnum.Avanzado.GetHashCode(), idPerson, idJuego);
                        break;
                    default:
                        break;
                }
                if (vistaRonda.Estado == Estado.Retirado || vistaRonda.Estado == Estado.Perdedor)
                {
                    ronda = 5;
                }
                ronda++;
                vistaRonda.NumeroRonda = ronda;
            }
            return vistaRonda;
        }
        static void FormularPregunta(Preguntas pregunta, List<Respuestas> respuestas, VistaRonda vistaRonda)
        {
            string[] letras = { "A", "B", "C", "D" };
            Console.WriteLine(pregunta.Pregunta);
            string respuestaJugador = "";
            foreach (Respuestas respuesta in respuestas)
            {
                Console.WriteLine(respuesta.Respuesta);
            }
            Console.WriteLine("Digite la respuesta correcta o presione 1 para retirarse del juego");
            respuestaJugador = Console.ReadLine();
            if (respuestaJugador != "" && letras.Where(x => x == respuestaJugador.ToUpper()).Count() != 0)
            {
                var indexRespuesta = Array.IndexOf(letras, respuestaJugador.ToUpper());
                Respuestas respuestaSeleccionada = respuestas[indexRespuesta];
                if (respuestaSeleccionada.Correcta)
                {
                    vistaRonda.Estado = Estado.Ganador;
                    vistaRonda.IdRespuesta = respuestaSeleccionada.IdRespuesta;
                }
                else
                {
                    vistaRonda.Estado = Estado.Perdedor;
                    vistaRonda.IdRespuesta = respuestaSeleccionada.IdRespuesta;
                }
            }
            else if (respuestaJugador == "1")
            {
                vistaRonda.Estado = Estado.Retirado;
            }
        }
        static void AcumularPremio(VistaRonda vistaRonda, int idPregunta, int idCategoria, int idPersona, int idJuego)
        {
            GamePersonService gamePersonService = new GamePersonService();
            GameService gameService = new GameService();
            CategoriaService categoriaService = new CategoriaService();
            switch (vistaRonda.Estado.GetHashCode())
            {
                case 1:
                    if (vistaRonda.NumeroRonda > 1)
                    {
                        gamePersonService.Create(idPregunta, idPersona, idJuego, 0);
                    }
                    else
                    {
                        gamePersonService.Update(idPregunta, idPersona, idJuego, 0);
                    }
                    gameService.Update(idJuego, false, vistaRonda.Acumulado);
                    break;
                case 2:
                    vistaRonda.Acumulado = 0;
                    if (vistaRonda.NumeroRonda > 1)
                    {
                        gamePersonService.Create(idPregunta, idPersona, idJuego, vistaRonda.IdRespuesta);
                    }
                    else
                    {
                        gamePersonService.Update(idPregunta, idPersona, idJuego, vistaRonda.IdRespuesta);
                    }
                    gameService.Update(idJuego, false, vistaRonda.Acumulado);
                    break;
                case 3:
                    if (vistaRonda.NumeroRonda > 1)
                    {
                        gamePersonService.Create(idPregunta, idPersona, idJuego, vistaRonda.IdRespuesta);
                    }
                    else
                    {
                        gamePersonService.Update(idPregunta, idPersona, idJuego, vistaRonda.IdRespuesta);
                    }
                    vistaRonda.Acumulado += categoriaService.GetPuntos(idCategoria);
                    gameService.Update(idJuego,(vistaRonda.NumeroRonda != 5)? true:false, vistaRonda.Acumulado);
                    break;
                default:
                    break;
            }
        }
    }
}
