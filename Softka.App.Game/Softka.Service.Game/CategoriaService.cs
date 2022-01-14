using Sofka.Repository.Game.Context;
using Sofka.Repository.Game.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Softka.Service.Game
{
    public class CategoriaService
    {
        public int GetPuntos(int idCategoria)
        {
            using var ctx = new SoftkaContext();
            int puntos = ctx.Categorias.Where(x => x.IdCategoria == idCategoria).Select(x=> x.Puntos).FirstOrDefault();
            return puntos;
        }
    }
}
