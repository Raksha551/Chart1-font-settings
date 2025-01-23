<<<<<<< HEAD
﻿using Evaluation2_Screens;
using System;
=======
﻿using System;
>>>>>>> fe3e602f6beec712cc6209a88a08d2d9bb6d327a
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
<<<<<<< HEAD
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
=======
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;


namespace Practice_Tasks
{
    public class DataBaseHelper
    {
        public static string connectionString;
        DataTable dt = new DataTable();

        public DataBaseHelper()
        {
            connectionString = WebConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        }
        public class rangeValues
        {
            public string AvailabilityValue { get; set; }
            public string PerformanceValue { get; set; }
            public string QualityValue { get; set; }
            public string AvailabilityData { get; set; }
            public string PerformanceData { get; set; }
            public string QualityData { get; set; }
        }

        public class ChangeFontSize
        {
           public  string LeftChartHeading { get; set; }
            public  string RightChartHeading { get; set; }
            public  string BottomChartHeading { get; set; }
            public  string Rangename { get; set; }
            public  string Rangedata { get; set; }
            public  string xAxis { get; set; }
            public  string yAxis { get; set; }
            public  string Datalabels { get; set; }
            public  string RightHeaders { get; set; }
            public  string LeftCenterdata { get; set; }
            public  string RightCenterdata { get; set; }



            public override string ToString()
            {
                return $"LeftChartHeading: {LeftChartHeading}, " +
                       $"RightChartHeading: {RightChartHeading}, " +
                       $"BottomChartHeading: {BottomChartHeading}, " +
                       $"Rangename: {Rangename}, " +
                       $"Rangedata: {Rangedata}, " +
                       $"xAxis: {xAxis}, " +
                       $"yAxis: {yAxis}, " +
                       $"Datalabels: {Datalabels}, " +
                       $"RightHeaders: {RightHeaders}, " +
                       $"LeftCenterdata: {LeftCenterdata}, " +
                       $"RightCenterdata: {RightCenterdata}";
            }
        }

        #region add Or Update Data To DB
        public void addOrUpdateDataToDB(string LeftChartHeading, string RightChartHeading, string BottomChartHeading,
      string Rangename, string Rangedata, string xAxis, string yAxis,
      string Datalabels, string RightHeaders, string LeftCenterdata, string RightCenterdata)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            try
            {            
                    string countQuery = "SELECT COUNT(*) FROM UserDefinedFontSizeSettings";
                    int recordCount = 0;
                    conn.Open();
                    using (SqlCommand countCmd = new SqlCommand(countQuery, conn))
                    {
                        recordCount = (int)countCmd.ExecuteScalar();
                    }

                    if (recordCount > 0)
                    {
                        // Step 2: If data exists, update it
                        string updateQuery = @"
                    UPDATE UserDefinedFontSizeSettings
                    SET 
                        LeftChartHeading = @LeftChartHeading,
                        RightChartHeading = @RightChartHeading,
                        BottomChartHeading = @BottomChartHeading,
                        Rangename = @Rangename,
                        Rangedata = @Rangedata,
                        xAxis = @xAxis,
                        yAxis = @yAxis,
                        Datalabels = @Datalabels,
                        RightHeaders = @RightHeaders,
                        LeftCenterdata = @LeftCenterdata,
                        RightCenterdata = @RightCenterdata";

                        using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                        {
                            updateCmd.Parameters.AddWithValue("@LeftChartHeading", LeftChartHeading);
                            updateCmd.Parameters.AddWithValue("@RightChartHeading", RightChartHeading);
                            updateCmd.Parameters.AddWithValue("@BottomChartHeading", BottomChartHeading);
                            updateCmd.Parameters.AddWithValue("@Rangename", Rangename);
                            updateCmd.Parameters.AddWithValue("@Rangedata", Rangedata);
                            updateCmd.Parameters.AddWithValue("@xAxis", xAxis);
                            updateCmd.Parameters.AddWithValue("@yAxis", yAxis);
                            updateCmd.Parameters.AddWithValue("@Datalabels", Datalabels);
                            updateCmd.Parameters.AddWithValue("@RightHeaders", RightHeaders);
                            updateCmd.Parameters.AddWithValue("@LeftCenterdata", LeftCenterdata);
                            updateCmd.Parameters.AddWithValue("@RightCenterdata", RightCenterdata);

                            updateCmd.ExecuteNonQuery();
                        }

                        Console.WriteLine("Record updated successfully.");
                    }
                    else
                    {
                        // Step 3: If no data exists, insert a new record
                        string insertQuery = @"
                    INSERT INTO UserDefinedFontSizeSettings (
                        LeftChartHeading, RightChartHeading, BottomChartHeading,
                        Rangename, Rangedata, xAxis, yAxis,
                        Datalabels, RightHeaders, LeftCenterdata, RightCenterdata
                    )
                    VALUES (
                        @LeftChartHeading, @RightChartHeading, @BottomChartHeading,
                        @Rangename, @Rangedata, @xAxis, @yAxis,
                        @Datalabels, @RightHeaders, @LeftCenterdata, @RightCenterdata
                    )";

                        using (SqlCommand insertCmd = new SqlCommand(insertQuery, conn))
                        {
                            insertCmd.Parameters.AddWithValue("@LeftChartHeading", LeftChartHeading);
                            insertCmd.Parameters.AddWithValue("@RightChartHeading", RightChartHeading);
                            insertCmd.Parameters.AddWithValue("@BottomChartHeading", BottomChartHeading);
                            insertCmd.Parameters.AddWithValue("@Rangename", Rangename);
                            insertCmd.Parameters.AddWithValue("@Rangedata", Rangedata);
                            insertCmd.Parameters.AddWithValue("@xAxis", xAxis);
                            insertCmd.Parameters.AddWithValue("@yAxis", yAxis);
                            insertCmd.Parameters.AddWithValue("@Datalabels", Datalabels);
                            insertCmd.Parameters.AddWithValue("@RightHeaders", RightHeaders);
                            insertCmd.Parameters.AddWithValue("@LeftCenterdata", LeftCenterdata);
                            insertCmd.Parameters.AddWithValue("@RightCenterdata", RightCenterdata);

                            insertCmd.ExecuteNonQuery();
                        }

                        Console.WriteLine("Record inserted successfully.");
                    }
                }
            
>>>>>>> fe3e602f6beec712cc6209a88a08d2d9bb6d327a
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
            }
            finally
            {
                if (conn != null) { conn.Close(); conn.Dispose(); }
            }
<<<<<<< HEAD
        }    
=======

        }
        #endregion

        #region GetChartSettingsAsDataTable
        public DataTable GetChartSettingsAsDataTable()
        {
            DataTable dt = new DataTable();
            string query = "SELECT * FROM UserDefinedFontSizeSettings";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlDataAdapter adapter = new SqlDataAdapter(query, conn))
                    {
                        adapter.Fill(dt);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
            }

            return dt;
        }
        #endregion

>>>>>>> fe3e602f6beec712cc6209a88a08d2d9bb6d327a
    }
}