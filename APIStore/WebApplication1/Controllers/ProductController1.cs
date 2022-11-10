using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using WebApplication1.Data;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class ProductController : ApiController
    {
        

        // GET api/<controller>
        public List<Products> Get()
        {
            return ProductData.List();
        }

        // GET api/<controller>/5
        public Products Get(int id)
        {
            return ProductData.Get(id);
        }

        // POST api/<controller>
        public bool Post([FromBody] Products oProducts)
        {
            return ProductData.Register(oProducts);
        }

        // PUT api/<controller>/5
        public bool Put([FromBody] Products oProducts, int id)
        {
            return ProductData.modify(oProducts, id);
        }

        // DELETE api/<controller>/5
        public bool Delete(int id)
        {
            return ProductData.delete(id);
        }
    }
}