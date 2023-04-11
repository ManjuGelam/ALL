using BAL;
//using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace jqueryvalidation.ALL
{
    public partial class Try : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string FName = "Ashok";
            string LName = "Ittadi";
            string FullName = FName + "" + LName;
        }

        [WebMethod(EnableSession = true)]
        public static string submitData(List<tryBAL> columns, string ID, string Name, string MobileNum, string Salary, string Country)
        {
            string jsonResult = "";
            tryBAL objbal = new tryBAL();
            try
            {
                DataTable dtcolum = new DataTable();
                dtcolum.Columns.Add("ID", typeof(string));
                dtcolum.Columns.Add("Name", typeof(string));
                dtcolum.Columns.Add("MobileNum", typeof(string));
                dtcolum.Columns.Add("Salary", typeof(string));
                dtcolum.Columns.Add("Country", typeof(string));

                dtcolum.AcceptChanges();

               /* foreach (tryBAL objbal in columns)
                {
                    DataRow drEdu = dtcolum.NewRow();
                    drEdu["ID"] = objbal.ID;
                    drEdu["Name"] = objbal.Name;
                    drEdu["MobileNum"] = objbal.MobileNum;
                    drEdu["Salary"] = objbal.Salary;
                    drEdu["Country"] = objbal.Country;

                    dtcolum.Rows.Add(drEdu);
                }*/


                /* DataTable dtResult = objbal.Try(dtcolum, phase_Id, User_Id, IpAdderess);
                 if (dtResult.Rows.Count > 0)
                 {
                     jsonResult = JsonConvert.SerializeObject(dtResult);
                 }
                 else
                 {
                     jsonResult = "";
                 }*/
            }
            catch (Exception ex)
            {
                Random rnErrorId = new Random();
                jsonResult = "";
                ex.Message.ToString();
            }
            return (jsonResult);
        }
    }

    /* [WebMethod(EnableSession = true)]
     public static string GetCETS()
     {
         String jsonResult = "";
         try
         {
             tryBAL objbal = new tryBAL();

             DataTable dtDetails = objbal.GetCETS();
             if (dtDetails.Rows.Count > 0)
             {
                 jsonResult = JsonConvert.SerializeObject(dtDetails);
                 jsonResult.Replace(@"\", string.Empty);
             }
         }
         catch (Exception ex)
         {
             throw ex;
         }
         return jsonResult;
     }*/
}