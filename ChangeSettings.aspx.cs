using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Practice_Tasks.DataBaseHelper;

namespace Practice_Tasks
{
    public partial class ChangeSettings : System.Web.UI.Page
    {
        DataBaseHelper dbhelper = new DataBaseHelper();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

      
        protected void OnButtonCLick_SaveChangesToDB(object sender, EventArgs e)
        {
            try
            {
                string LeftChartHeading = leftchartHeading.Text;
                string RightChartHeading = rightchartHeading.Text;
                string BottomChartHeading = bottomchartHeading.Text;
                string Rangename = rangename.Text;
                string Rangedata = rangedata.Text;
                string xAxis = Xaxisdata.Text;
                string yAxis = Yaxisdata.Text;
                string Datalabels = Bardatalabels.Text;
                string RightHeaders = rightHeaders.Text;
                string LeftCenterdata = leftcenter.Text;
                string RightCenterdata = rightcenter.Text;


                dbhelper.addOrUpdateDataToDB(LeftChartHeading, RightChartHeading, BottomChartHeading, Rangename, Rangedata,
                    xAxis, yAxis, Datalabels, RightHeaders, LeftCenterdata, RightCenterdata);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Save_Button_Click : " + ex.Message);
            }
        }


        protected void Updatebtn_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Charts_1.aspx");
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Redirect_to_Charts_2.aspx : " + ex.Message);
            }
        }
    }
}