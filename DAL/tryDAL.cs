using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class tryDAL
    {
        /* public DataTable Try(DataTable dtcolumns, string dtcolum, string phase_Id, string User_Id, string IpAdderess)
         {
             SqlConnection con = new SqlConnection(connection.ConnectionStrings_DBConnection);
             DataTable dt = new DataTable();

             try
             {
                 if (con.State == ConnectionState.Closed)
                 {
                     con.Open();
                 }
                 SqlCommand cmd = new SqlCommand("sP_Gridinser137", con);
                 cmd = con.CreateCommand();
                 cmd.CommandType = CommandType.StoredProcedure;
                 cmd.CommandText = "sP_Gridinser137";
                 cmd.Parameters.AddWithValue("@Id", Id);
                 cmd.Parameters.AddWithValue("@Name", Name);
                 cmd.Parameters.AddWithValue("@MobileNum", MobileNum);
                 cmd.Parameters.AddWithValue("@Salary", Salary);
                 cmd.Parameters.AddWithValue("@Country", Country);

                 SqlDataAdapter da = new SqlDataAdapter(cmd);
                 da.Fill(dtDetails);
             }
             catch (Exception ex)
             {
                 throw new Exception(ex.message);

             }
             finally
             {
                 if (con.State == ConnectionState.Open)
                 {
                     con.Close();
                 }
             }
             return dtDetails;
         }*/
        /* public DataTable GetCETS()
         {
             SqlConnection con = new SqlConnection(connection.connectionStrings_MyDB);
             DataTable dt = new DataTable();


             try
             {
                 if (con.State == ConnectionState.Closed)
                 {
                     con.Open();
                 }
                 SqlCommand cmd = new SqlCommand("sP_Gridinser137", con);
                 cmd = con.CreateCommand();
                 cmd.CommandType = CommandType.StoredProcedure;
                 cmd.CommandText = "sP_Gridinser137";

                 SqlDataAdapter da = new SqlDataAdapter(cmd);
                 da.Fill(dtDetails);
             }
             catch (Exception ex)
             {
                 throw new Exception(ex.Message);

             }
             finally
             {
                 if (con.State == ConnectionState.Open)
                 {
                     con.Close();
                 }
             }
             return dtDetails;
         }*/

        public string InsertData(string FCol, string SCol)
        {
            
            SqlConnection con = new SqlConnection(connection.connectionStrings_MyDB);
            string Inserted = "Y";
            SqlCommand cmd = new SqlCommand("SP_INSERT", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", FCol);
            cmd.Parameters.AddWithValue("@Name", SCol);
            con.Open();
            int k = cmd.ExecuteNonQuery();
            //if (k != 0)
            //{
            //    lblmsg.Text = "Record Inserted Succesfully into the Database";
            //    lblmsg.ForeColor = System.Drawing.Color.CornflowerBlue;
            //}
            con.Close();
            
            return Inserted;
        }
    }
}