using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class Client
    {
        public int IdClient { get; set; }
        public string IdentityCard { get; set; }
        public string NameClient { get; set; }
        public string SurnameClient { get; set; }
        public string Phone { get; set; }
        public DateTime RegistrationDate { get; set; }

    }
}