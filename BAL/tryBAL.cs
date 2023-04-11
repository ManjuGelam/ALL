using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL
    {
        public class tryBAL
        {

            public string ID { get; set; }
            public string Name { get; set; }
            public string MobileNum { get; set; }
            public string Salary { get; set; }
            public string Country { get; set; }

        /*  public DataTable Try(DataTable dtcolumns, string dtcolum, string phase_Id, string User_Id, string IpAdderess)
          {
              try
              {
                  tryDAL objdal = new tryDAL();
                  //return objdal.Try(dtcolum, phase_Id, User_Id, IpAdderess);
              }
              catch (Exception)
              {
                  throw;

              }
          }*/
        /*  public DataTable GetCETS()
          {
              tryDAL objdal = new tryDAL();
              return objdal.GetCETS();
          }*/
          public string InsertData(string FCol,string SCol)
          {
              tryDAL objdal = new tryDAL();
              return objdal.InsertData(FCol,SCol);
          }
    }
}


