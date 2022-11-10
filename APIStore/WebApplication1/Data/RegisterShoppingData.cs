using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApplication1.Models;

namespace WebApplication1.Data
{
    public class RegisterShoppingData
    {
        public static bool Register(RegisterShopping oRegisterShopping)
        {
            using (SqlConnection oConnection = new SqlConnection(Connection.connectionPath))
            {
                SqlCommand cmd = new SqlCommand("usp_register_shopping", oConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IdProduct", oRegisterShopping.IdProduct);
                cmd.Parameters.AddWithValue("@IdClient", oRegisterShopping.IdClient);
                cmd.Parameters.AddWithValue("@Amount", oRegisterShopping.Amount);

                try
                {
                    oConnection.Open();
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

    }
}