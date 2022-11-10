using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApplication1.Models;

namespace WebApplication1.Data
{
    public class ProductData
    {
        public static bool Register(Products oProducts)
        {
            using (SqlConnection oConnection = new SqlConnection(Connection.connectionPath))
            {
                SqlCommand cmd = new SqlCommand("usp_register_product", oConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@NameProduct", oProducts.NameProduct);
                cmd.Parameters.AddWithValue("@UnitPrice", oProducts.UnitPrice);

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

        public static bool modify(Products oProducts, int id)
        {
            using (SqlConnection oConnection = new SqlConnection(Connection.connectionPath))
            {
                SqlCommand cmd = new SqlCommand("usp_modify_product", oConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IdProduct", id);
                cmd.Parameters.AddWithValue("@NameProduct", oProducts.NameProduct);
                cmd.Parameters.AddWithValue("@UnitPrice", oProducts.UnitPrice);

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

        public static List<Products> List()
        {
            List<Products> oListProducts = new List<Products>();
            using (SqlConnection oConnection = new SqlConnection(Connection.connectionPath))
            {
                SqlCommand cmd = new SqlCommand("usp_list_product", oConnection);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConnection.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oListProducts.Add(new Products()
                            {
                                IdProduct = Convert.ToInt32(dr["IdProduct"]),
                                NameProduct = dr["NameProduct"].ToString(),
                                UnitPrice = (decimal)dr["UnitPrice"],
                                RegistrationDate = Convert.ToDateTime(dr["RegistrationDate"].ToString())
                            });
                        }

                    }



                    return oListProducts;
                }
                catch (Exception ex)
                {
                    return oListProducts;
                }
            }
        }

        public static Products Get(int idProduct)
        {
            Products oProduct = new Products();
            using (SqlConnection oConnection = new SqlConnection(Connection.connectionPath))
            {
                SqlCommand cmd = new SqlCommand("usp_get_product", oConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IdProduct", idProduct);

                try
                {
                    oConnection.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oProduct = new Products()
                            {
                                IdProduct = Convert.ToInt32(dr["IdProduct"]),
                                NameProduct = dr["NameProduct"].ToString(),
                                UnitPrice = (decimal)dr["UnitPrice"],
                                RegistrationDate = Convert.ToDateTime(dr["RegistrationDate"].ToString())
                            };
                        }

                    }
                    return oProduct;
                }
                catch (Exception ex)
                {
                    return oProduct;
                }
            }
        }

        public static bool delete(int idProduct)
        {
            using (SqlConnection oConnection = new SqlConnection(Connection.connectionPath))
            {
                SqlCommand cmd = new SqlCommand("usp_delete_product", oConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IdProduct", idProduct);

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