using Sofka.Repository.Game.Context;
using Sofka.Repository.Game.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Softka.Service.Game
{
    public class PersonService
    {
        public Personas GetUser(string identificacion)
        {
            using (var ctx = new SoftkaContext())
            {
                Personas persona = ctx.Personas.Where(x => x.Identificacion == identificacion).FirstOrDefault();
                return persona;
            }
        }
    }
}
