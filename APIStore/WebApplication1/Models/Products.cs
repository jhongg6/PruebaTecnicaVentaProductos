using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class Products
    {
        public int IdProduct { get; set; }
        public string NameProduct { get; set; }
        public decimal UnitPrice { get; set; }
        public DateTime RegistrationDate { get; set; }

    }
}