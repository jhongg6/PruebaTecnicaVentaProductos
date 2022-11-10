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
    public class RegisterShoppingController : ApiController
    {

        // POST api/<controller>
        public bool Post([FromBody] RegisterShopping oRegisterShopping)
        {
            return RegisterShoppingData.Register(oRegisterShopping);
        }

        

        
    }
}