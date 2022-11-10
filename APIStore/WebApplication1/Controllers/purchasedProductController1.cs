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
    public class purchasedProductController : ApiController
    {


        // GET api/<controller>
        public List<shopping> Get(int id)
        {
            return ShoppingData.List(id);
        }

    }
}