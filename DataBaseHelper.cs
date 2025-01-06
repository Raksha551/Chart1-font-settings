using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
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
            
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
            }
            finally
            {
                if (conn != null) { conn.Close(); conn.Dispose(); }
            }

        }

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





    }
}