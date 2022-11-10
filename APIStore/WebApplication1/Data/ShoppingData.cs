using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApplication1.Models;

namespace WebApplication1.Data
{
    public class ShoppingData
    {
        public static List<shopping> List(int id)
        {
            List<shopping> oListShopping = new List<shopping>();
            using (SqlConnection oConnection = new SqlConnection(Connection.connectionPath))
            {
                SqlCommand cmd = new SqlCommand("usp_list_shopping", oConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IdClient", id);

                try
                {
                    oConnection.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oListShopping.Add(new shopping()
                            {
                                IdProduct = Convert.ToInt32(dr["IdProduct"]),
                                NameProduct = dr["NameProduct"].ToString(),
                                Amount = Convert.ToInt32(dr["TotalAmount"]),
                                UnitPrice = (decimal)dr["UnitPrice"],
                                TotalValue = (decimal)dr["TotalValue"],
                            });
                        }

                    }



                    return oListShopping;
                }
                catch (Exception ex)
                {
                    return oListShopping;
                }
            }
        }
    }
}

