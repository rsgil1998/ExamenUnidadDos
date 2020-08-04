using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BEUEjercicio.Transactions
{
    public class ClubBLL
    {
        //BLL Bussiness Logic Layer
        //Capa de Logica del Negocio

        public static void Create(Club a)
        {
            using (Entities db = new Entities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        db.Clubs.Add(a);
                        db.SaveChanges();
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        throw ex;
                    }
                }
            }
        }

        public static Club Get(int? id)
        {
            Entities db = new Entities();
            return db.Clubs.Find(id);
        }

        public static void Update(Club Club)
        {
            using (Entities db = new Entities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        db.Clubs.Attach(Club);
                        db.Entry(Club).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        throw ex;
                    }
                }
            }
        }

        public static void Delete(int? id)
        {
            using (Entities db = new Entities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        Club Club = db.Clubs.Find(id);
                        db.Entry(Club).State = System.Data.Entity.EntityState.Deleted;
                        db.SaveChanges();
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        throw ex;
                    }
                }
            }
        }

        public static List<Club> List()
        {
            Entities db = new Entities();
            //Instancia del contexto

            /*List<Club> alumons = db.Clubs.ToList();
            List<Club> resultado = new List<Club>();
            foreach (Club a in alumons) {
                if (a.sexo == "M") {
                    resultado.Add(a);
                }
            }
            return resultado;*/
            //SQL -> SELECT * FROM dbo.Club WHERE sexo = 'M'
            //return db.Clubs.Where(x => x.sexo == "M").ToList();

            return db.Clubs.OrderBy(x => x.id).ToList();

            //Los metodos del EntityFramework se denomina Linq, 
            //y la evluacion de condiciones lambda
        }

        public static List<Club> ListToNames()
        {
            Entities db = new Entities();
            List<Club> result = new List<Club>();
            db.Clubs.ToList().ForEach(x =>
                result.Add(
                    new Club
                    {
                        nombre = x.nombre + " " + x.descripcion,
                        id = x.id
                    }));
            return result;
        }

        private static List<Club> GetClubs(string criterio)
        {
            //Ejemplo: criterio = 'quin'
            //Posibles resultados => Quintana, Quintero, Pulloquinga, Quingaluisa...
            Entities db = new Entities();
            return db.Clubs.Where(x => x.nombre.ToLower().Contains(criterio)).ToList();
        }

        public static List<Club> List(string criterio)
        {
            Entities db = new Entities();
            return db.Clubs.Where(x => x.nombre.Contains(criterio)).ToList();
        }

        private static Club GetClub(string cedula)
        {
            Entities db = new Entities();
            return db.Clubs.FirstOrDefault(x => x.nombre== cedula);
        }
    }
}
