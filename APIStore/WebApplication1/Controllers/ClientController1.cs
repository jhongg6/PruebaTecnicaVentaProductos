using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApplication1.Data;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class ClientController : ApiController
    {
        // GET api/<controller>
        public List<Client> Get()
        {
            return ClientData.List();
        }

        // GET api/<controller>/5
        public Client Get(int id)
        {
            return ClientData.Get(id);
        }

        // POST api/<controller>
        public bool Post([FromBody] Client oClients)
        {
            return ClientData.Register(oClients);
        }

        // PUT api/<controller>/5
        public bool Put([FromBody] Client oClients, int id)
        {
            return ClientData.modify(oClients, id);
        }

        // DELETE api/<controller>/5
        public bool Delete(int id)
        {
            return ClientData.delete(id);
        }
    }
}