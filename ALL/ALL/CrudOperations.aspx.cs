using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using BAL;

namespace ALL.ALL
{
    public partial class CrudOperations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod(EnableSession = true)]
        public static string InsertData(string FCol, string SCol)
        {
            string jsonResult = "";
            tryBAL objbal = new tryBAL();
            objbal.InsertData(FCol, SCol);
            return jsonResult;
        }
    }
}