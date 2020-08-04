using BEUEjercicio;
using BEUEjercicio.Transactions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;
using System.Web.Mvc;

namespace WebApiEscolastico.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ClubController : ApiController
    {
        public IHttpActionResult Post(Club alumno)
        {
            try
            {
                ClubBLL.Create(alumno);
                return Content(HttpStatusCode.Created, "Club creado correctamente");
            }
            catch (Exception ex) {
                return BadRequest(ex.Message);
            }
        }
                       
        public IHttpActionResult Get()
        {
            try
            {
                List<Club> todos = ClubBLL.List();
                return Content(HttpStatusCode.OK, todos);
            }
            catch (Exception ex) {
                return Content(HttpStatusCode.BadRequest, ex);
            }
        }

        public IHttpActionResult Get(String criteria)
        {
            try
            {
                List<Club> todos = ClubBLL.List(criteria);
                return Content(HttpStatusCode.OK, todos);
            }
            catch (Exception ex)
            {
                return Content(HttpStatusCode.BadRequest, ex);
            }
        }

        public IHttpActionResult Put(Club alumno)
        {
            try
            {
                ClubBLL.Update(alumno);
                return Content(HttpStatusCode.OK, "Club actualizado correctamente");

            }
            catch (Exception ex) {
                return BadRequest(ex.Message);
            }
        }

        public IHttpActionResult Get(int id)
        {
            try
            {
                Club result = ClubBLL.Get(id);
                if (result == null) {
                    return NotFound();
                }
                return Content(HttpStatusCode.OK, result);
            }
            catch (Exception ex)
            {
                return Content(HttpStatusCode.BadRequest, ex);
            }
        }

        public IHttpActionResult Delete(int id)
        {
            try
            {
                ClubBLL.Delete(id);
                return Ok("Club eliminado correctamente");
            }
            catch (Exception ex)
            {
                return Content(HttpStatusCode.BadRequest, ex);
            }
        }

    }
}