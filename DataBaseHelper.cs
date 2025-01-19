using Evaluation2_Screens;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace Task1_Black_Screen
{
    
    public class DataBaseHelper
    {
        public class ColumnNames_DB
        {
            public string MachineID { get; set; }
            public string MachineLiveStatus { get; set; }
            public string ShiftTarget { get; set; }
            public string DayTarget { get; set; }
            public string ReqRate { get; set; }
            public string HitRate { get; set; }
            public string AskRate { get; set; }
            public string ShiftOEE { get; set; }
            public string MonthLevel_KWH { get; set; }
            public string ShiftDownTime { get; set; }
            public string DayRejCount { get; set; }
            public string HelpReqStatus { get; set; }
            public string BackgroundColor { get; set; }
            public string targetcolor { get; set; }
            public string statuscolor { get; set; }

        }
        private static string connectionstring;
        DataTable dt = new DataTable();
        public DataBaseHelper()
        {
            connectionstring = WebConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        }

        public DataTable fetchdata(string param="", string PlantID="", string MachineID="")
        {
            SqlConnection con = new SqlConnection(connectionstring);

            try
            {
                using (SqlCommand cmd = new SqlCommand("S_GetMachineWiseAndonDetails_SAF", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandTimeout = 120;
                    cmd.Parameters.AddWithValue("@Param", param);
                    cmd.Parameters.AddWithValue("@PlantID", PlantID);
                    cmd.Parameters.AddWithValue("@MachineID", MachineID);

                    con.Open();
                    SqlDataAdapter ad = new SqlDataAdapter(cmd);
                    ad.Fill(dt);

                }

            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Fetch Data : " + ex);
            }
            finally
            {
                if (con != null) { con.Close(); con.Dispose(); }
            }
            return dt;  
        }
    }
}