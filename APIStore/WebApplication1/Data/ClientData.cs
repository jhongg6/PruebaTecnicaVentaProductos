using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApplication1.Models;

namespace WebApplication1.Data
{
    public class ClientData
    {
        public static bool Register(Client oClient)
        {
            using (SqlConnection oConnection = new SqlConnection(Connection.connectionPath))
            {
                SqlCommand cmd = new SqlCommand("usp_register_client", oConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IdentityCard", oClient.IdentityCard);
                cmd.Parameters.AddWithValue("@NameClient", oClient.NameClient);
                cmd.Parameters.AddWithValue("@SurnameClient", oClient.SurnameClient);
                cmd.Parameters.AddWithValue("@Phone", oClient.Phone);

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

        public static bool modify(Client oClient, int id)
        {
            using (SqlConnection oConnection = new SqlConnection(Connection.connectionPath))
            {
                SqlCommand cmd = new SqlCommand("usp_modify_client", oConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IdClient", id);
                cmd.Parameters.AddWithValue("@IdentityCard", oClient.IdentityCard);
                cmd.Parameters.AddWithValue("@NameClient", oClient.NameClient);
                cmd.Parameters.AddWithValue("@SurnameClient", oClient.SurnameClient);
                cmd.Parameters.AddWithValue("@Phone", oClient.Phone);

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

        public static List<Client> List()
        {
            List<Client> oListClient = new List<Client>();
            using (SqlConnection oConnection = new SqlConnection(Connection.connectionPath))
            {
                SqlCommand cmd = new SqlCommand("usp_list_client", oConnection);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConnection.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oListClient.Add(new Client()
                            {
                                IdClient = Convert.ToInt32(dr["IdClient"]),
                                IdentityCard = dr["IdentityCard"].ToString(),
                                NameClient = dr["NameClient"].ToString(),
                                SurnameClient = dr["SurnameClient"].ToString(),
                                Phone = dr["Phone"].ToString(),
                                RegistrationDate = Convert.ToDateTime(dr["RegistrationDate"].ToString())
                            });
                        }

                    }



                    return oListClient;
                }
                catch (Exception ex)
                {
                    return oListClient;
                }
            }
        }

        public static Client Get(int idClient)
        {
            Client oClient = new Client();
            using (SqlConnection oConnection = new SqlConnection(Connection.connectionPath))
            {
                SqlCommand cmd = new SqlCommand("usp_get_client", oConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IdClient", idClient);

                try
                {
                    oConnection.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oClient = new Client()
                            {
                                IdClient = Convert.ToInt32(dr["IdClient"]),
                                IdentityCard = dr["IdentityCard"].ToString(),
                                NameClient = dr["NameClient"].ToString(),
                                SurnameClient = dr["SurnameClient"].ToString(),
                                Phone = dr["Phone"].ToString(),
                                RegistrationDate = Convert.ToDateTime(dr["RegistrationDate"].ToString())
                            };
                        }

                    }
                    return oClient;
                }
                catch (Exception ex)
                {
                    return oClient;
                }
            }
        }

        public static bool delete(int idClient)
        {
            using (SqlConnection oConnection = new SqlConnection(Connection.connectionPath))
            {
                SqlCommand cmd = new SqlCommand("usp_delete_client", oConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IdClient", idClient);

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