using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.Script.Services;
using System.Web.Services;
using System.Runtime.InteropServices.WindowsRuntime;

namespace Practice_Tasks
{
    public partial class Charts_1 : System.Web.UI.Page
    {
        DataBaseHelper dbhelper = new DataBaseHelper();
        DataTable dt = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack) // Prevent re-binding on every request
                {
                    addRangevalues();
                    addDonutChartValues();
                    addBarChartValues();
                    //ChangeFrontEndSize();
                    double oeeValue = 24.21;
                    double remainingValue = 100 - oeeValue;


                }
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Page_Load : " + ex.Message);
            }
           
        }
        public void addRangevalues()
        {
            try
            {
                DataBaseHelper.rangeValues range = new DataBaseHelper.rangeValues();

                double availabilityValue = 29.56;
                double performanceValue = 81.95;
                double qualityValue = 99.95;

                range.AvailabilityValue = $"width:{availabilityValue}%";
                range.PerformanceValue = $"width:{performanceValue}%";
                range.QualityValue = $"width:{qualityValue}%";

                range.AvailabilityData = $"{availabilityValue}%";
                range.PerformanceData = $"{performanceValue}%";
                range.QualityData = $"{qualityValue}%";

                Repeator.DataSource = new List<DataBaseHelper.rangeValues> { range };
                Repeator.DataBind();
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("addRangeValues : " + ex.Message);
            }

        }
        public void addDonutChartValues()
        {
            try
            {
                var chartData = new
                {
                    OEE = 24.21,
                    OeeRemaining = 100 - 24.21,
                    CNC = 10.48,
                    CNCRemaining = 100 - 10.48,
                    HMC = 7.99,
                    HMCRemaining = 100 - 7.99,
                    VMC = 28.13,
                    VMCRemaining = 100 - 28.13
                };
                string chartDataJs = $@"
                    var chartData = {{
                        OEE: {chartData.OEE},
                        OeeRemaining: {chartData.OeeRemaining},
                        CNC: {chartData.CNC},
                        CNCRemaining: {chartData.CNCRemaining},
                        HMC: {chartData.HMC},
                        HMCRemaining: {chartData.HMCRemaining},
                        VMC: {chartData.VMC},
                        VMCRemaining: {chartData.VMCRemaining}
                    }};
                ";
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "chartData",
                    $"<script>{chartDataJs}</script>",
                    false
                );
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("addDonutChartValues : " + ex.Message);
            }

        }


        public void addBarChartValues()
        {
            try
            {
                var categories = new[] { "CNC 01", "HMC 01", "HMC 02", "HMC 03 Mazak", "HMC 04", "HMC 05", "HMC 06", "HMC 07", "VMC 01 APC","VMC 02 APC",
                    "VMC 03 U-cam",  "VMC 04 APC", "VMC 05 Indexer","VMC 06 APC","VMC 07 U-cam","VMC 08 APC","VMC 09 Basic", "VMC 10 APC", "VMC 11 Indexer","VMC 12 APC", };
                //var series = new[]
                //{
                //    new { y = 7, color = "#FF5733" },
                //    new { y = 31, color = "#33FF57" },
                //    new { y = 55, color = "#3357FF" },
                //    new { y = 23, color = "#F0E130" },
                //    new { y = 73, color = "#FF5733" },
                //    new { y = 81, color = "#33FF57" },
                //    new { y = 40, color = "#3357FF" },
                //    new { y = 82, color = "#F0E130" },
                //    new { y = 47, color = "#FF5733" },
                //    new { y = 61, color = "#33FF57" },
                //    new { y = 75, color = "#3357FF" },
                //    new { y = 83, color = "#F0E130" },
                //    new { y = 13, color = "#FF5733" },
                //    new { y = 81, color = "#33FF57" },
                //    new { y = 43, color = "#3357FF" },
                //    new { y = 77, color = "#F0E130" },
                //    new { y = 40, color = "#FF5733" },
                //    new { y = 31, color = "#33FF57" },
                //    new { y = 65, color = "#3357FF" },
                //    new { y = 23, color = "#F0E130" },                   
                //};

                var series = new[] { 7, 31, 55, 23, 73, 81, 40, 82, 47, 61, 75, 83, 13, 81, 43, 77, 40, 31, 65, 23 };

                //  string seriesJs = string.Join(",", series.Select(s => $"{{ y: {s.y}, color: '{s.color}' }}"));
                string categoriesJs = string.Join(",", categories.Select(c => $"'{c}'"));
                string seriesJs = string.Join(",", series.Select(y => $"{y}"));

                //string script = $"<script>var chartData = {{ categories: [{categoriesJs}], series: [{seriesJs}] }};</script>";
                //ClientScript.RegisterStartupScript(this.GetType(), "chartData", script, false);

                ClientScript.RegisterStartupScript(
              this.GetType(),
              "chartData2",
              $"<script>var chartData2 = {{ categories: [{categoriesJs}], series: [{seriesJs}] }};</script>",
              false
          );
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("addBarChartValues : " + ex.Message);
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Response.Redirect("ChangeSettings.aspx");
            }
          catch (Exception ex)
            {
                Logger.WriteErrorLog("ImageButton1_Click : " + ex.Message);
            }
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static DataBaseHelper.ChangeFontSize ChangeFrontEndSize()
        {
            try
            {

                DataTable dt = new DataBaseHelper().GetChartSettingsAsDataTable();
                DataRow row = dt.Rows[0];
                return new DataBaseHelper.ChangeFontSize
                {
                    LeftChartHeading = (row["LeftChartHeading"] == DBNull.Value || string.IsNullOrEmpty(row["LeftChartHeading"] as string)) ? "20" : row["LeftChartHeading"] as string,
                    RightChartHeading = row["RightChartHeading"] == DBNull.Value || string.IsNullOrEmpty(row["RightChartHeading"] as string) ? "18" : row["RightChartHeading"] as string,
                    BottomChartHeading = row["BottomChartHeading"] == DBNull.Value || string.IsNullOrEmpty(row["BottomChartHeading"] as string) ? "18" : row["BottomChartHeading"] as string,
                    Rangename = row["Rangename"] == DBNull.Value || string.IsNullOrEmpty(row["Rangename"] as string) ? "18" : row["Rangename"] as string,
                    Rangedata = row["Rangedata"] == DBNull.Value || string.IsNullOrEmpty(row["Rangedata"] as string) ? "18" : row["Rangedata"] as string,
                    xAxis = row["xAxis"] == DBNull.Value || string.IsNullOrEmpty(row["xAxis"] as string) ? "12" : row["xAxis"] as string,
                    yAxis = row["yAxis"] == DBNull.Value || string.IsNullOrEmpty(row["yAxis"] as string) ? "12" : row["yAxis"] as string,
                    Datalabels = row["Datalabels"] == DBNull.Value || string.IsNullOrEmpty(row["Datalabels"] as string) ? "18" : row["Datalabels"] as string,
                    RightHeaders = row["RightHeaders"] == DBNull.Value || string.IsNullOrEmpty(row["RightHeaders"] as string) ? "18" : row["RightHeaders"] as string,
                    LeftCenterdata = row["LeftCenterdata"] == DBNull.Value || string.IsNullOrEmpty(row["LeftCenterdata"] as string) ? "18" : row["LeftCenterdata"] as string,
                    RightCenterdata = row["RightCenterdata"] == DBNull.Value || string.IsNullOrEmpty(row["RightCenterdata"] as string) ? "18" : row["RightCenterdata"] as string,
                };
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("ChangeFrontEndSize : " + ex.Message);
                return null;
            }          
            // Return an empty JSON object if no data
        }        
    }
}