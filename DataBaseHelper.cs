using Evaluation2_Screens;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI.WebControls;

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

        public DataTable selectDataFromDB()
        {
            SqlConnection conn = new SqlConnection(connectionstring);
            SqlDataReader rdr = null;
            DataTable dt = null;
            try
            {
                using (SqlCommand cmd = new SqlCommand("SELECT ValueInText, ValueInBool FROM AndonDefaults_SAF", conn))
                {
                    cmd.CommandTimeout = 120;
                    conn.Open();
                    rdr = cmd.ExecuteReader();

                    if (rdr.HasRows)
                    {
                        dt = new DataTable();
                        dt.Load(rdr);
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("fetchVisibilityData : " + ex);
            }
            finally
            {
                if (rdr != null) { rdr.Close(); rdr.Dispose(); }
                if (conn != null) { conn.Close(); conn.Dispose(); }
            }

            return dt;
        }
        public void addOrUpdateDataToDB(string status, string shiftData, string Dayoutput,
      string Monthtodate, string OEEValue, string powerValue, string idleValue,
      string rejectionValue, string downtimeValue)
        {
            SqlConnection conn = new SqlConnection(connectionstring);

            try
            {
                conn.Open(); 
                string updateQuery = @"
            UPDATE AndonDefaults_SAF SET ValueInBool = @status WHERE ValueInText = 'RunningStatus';
            UPDATE AndonDefaults_SAF SET ValueInBool = @shiftData WHERE ValueInText = 'CurrentShift';
            UPDATE AndonDefaults_SAF SET ValueInBool = @Dayoutput WHERE ValueInText = 'CurrentDay';
            UPDATE AndonDefaults_SAF SET ValueInBool = @Monthtodate WHERE ValueInText = 'MonthToDate';
            UPDATE AndonDefaults_SAF SET ValueInBool = @OEEValue WHERE ValueInText = 'OEE';
            UPDATE AndonDefaults_SAF SET ValueInBool = @powerValue WHERE ValueInText = 'Power';
            UPDATE AndonDefaults_SAF SET ValueInBool = @idleValue WHERE ValueInText = 'IdleTime';
            UPDATE AndonDefaults_SAF SET ValueInBool = @rejectionValue WHERE ValueInText = 'Rejection';
            UPDATE AndonDefaults_SAF SET ValueInBool = @downtimeValue WHERE ValueInText = 'DownTimeReason';
        ";
                using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                {                   
                    updateCmd.Parameters.AddWithValue("@status", status);
                    updateCmd.Parameters.AddWithValue("@shiftData", shiftData);
                    updateCmd.Parameters.AddWithValue("@Dayoutput", Dayoutput);
                    updateCmd.Parameters.AddWithValue("@Monthtodate", Monthtodate);
                    updateCmd.Parameters.AddWithValue("@OEEValue", OEEValue);
                    updateCmd.Parameters.AddWithValue("@powerValue", powerValue);
                    updateCmd.Parameters.AddWithValue("@idleValue", idleValue);
                    updateCmd.Parameters.AddWithValue("@rejectionValue", rejectionValue);
                    updateCmd.Parameters.AddWithValue("@downtimeValue", downtimeValue);

                    updateCmd.ExecuteNonQuery();
                }

                Console.WriteLine("Record updated successfully.");
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
            }
            finally
            {
                if (conn != null) { conn.Close(); conn.Dispose(); }
            }
        }    
    }
}