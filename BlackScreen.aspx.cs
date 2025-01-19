using Evaluation2_Screens;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;


namespace Task1_Black_Screen
{
    public partial class BlackScreen : System.Web.UI.Page
    {
        DataBaseHelper dbhelper = new DataBaseHelper();
        private static List<DataBaseHelper.ColumnNames_DB> list = new List<DataBaseHelper.ColumnNames_DB>();
        private static int currentIndex = 0;
        //private const int batchSize = 4;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    BindData();

                    if (list.Count > 0)
                    {
                        BindRow(currentIndex); // Displays first row of DB
                    }
                }
                catch (Exception ex)
                {
                    Logger.WriteErrorLog($"Page_Load Error: {ex.Message}");
                }
            }
        }

        public void BindData()
        {
            try
            {
                DataTable dt = dbhelper.fetchdata();
                if (dt != null && dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        DataBaseHelper.ColumnNames_DB data = new DataBaseHelper.ColumnNames_DB();
                        data.MachineID = dt.Rows[i]["MachineID"].ToString();
                        data.MachineLiveStatus = dt.Rows[i]["MachineLiveStatus"].ToString();
                        double shiftTarget = Convert.ToDouble(dt.Rows[i]["ShiftTarget"]);
                        data.ShiftTarget = dt.Rows[i]["ShiftTarget"].ToString() + "/100";
                        data.DayTarget = dt.Rows[i]["DayTarget"].ToString() + "/100";
                        data.ReqRate = dt.Rows[i]["ReqRate"].ToString();
                        data.HitRate = dt.Rows[i]["HitRate"].ToString();
                        data.AskRate = dt.Rows[i]["AskRate"].ToString();
                        data.ShiftOEE = dt.Rows[i]["ShiftOEE"].ToString();
                        data.MonthLevel_KWH = dt.Rows[i]["MonthLevel_KWH"].ToString();
                        data.ShiftDownTime = dt.Rows[i]["ShiftDownTime"].ToString();
                        data.DayRejCount = dt.Rows[i]["DayRejCount"].ToString() + "/123456";
                        data.HelpReqStatus = String.IsNullOrEmpty(dt.Rows[i]["HelpReqStatus"].ToString()) ? "-" : dt.Rows[i]["HelpReqStatus"].ToString();
                        data.BackgroundColor = "background-color:" + dt.Rows[i]["MachineLiveStatusColor"].ToString(); ;
                        data.targetcolor = Convert.ToDouble(dt.Rows[i]["DayTarget"]) >= 50 || Convert.ToDouble(dt.Rows[i]["DayTarget"]) >= 50 ? "color: green;" : "";
                        data.statuscolor = String.IsNullOrEmpty(dt.Rows[i]["HelpReqStatus"].ToString()) ? "color: green; padding-top:30px;" : "color: orange;";
                        list.Add(data);
                    }
                    //listview1.DataSource = list;
                    //listview1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog($"BindData Error: {ex.Message}");
            }
        }

        private void BindRow(int index)
        {
            try
            {
                if (list == null || index >= list.Count) return;

               // var start = DateTime.Now;
               // System.Diagnostics.Debug.WriteLine($"BindRow Start: Index={index}");
                var singleRowList = new List<DataBaseHelper.ColumnNames_DB> { list[index] };
                listview1.DataSource = singleRowList;
                listview1.DataBind();
               // System.Diagnostics.Debug.WriteLine($"BindRow End: Time Taken={(DateTime.Now - start).TotalMilliseconds}ms");
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog($"BindRow Error: {ex.Message}");
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            try
            {
                if (list == null || list.Count == 0) return;

                currentIndex++;
                if (currentIndex >= list.Count)
                {
                    currentIndex = 0; // Reset to the first row when reaching the end
                }
                //currentIndex = (currentIndex + 1) % list.Count;
                BindRow(currentIndex);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog($"Timer1_Tick Error: {ex.Message}");
            }
        }
    }
}

//private void BindRows(int startIndex)
//{
//    try
//    {
//        if (list == null || list.Count == 0) return;

//        // Fetch the next batch of rows
//        var rowsToDisplay = list.Skip(startIndex).Take(batchSize).ToList();

//        // Handle wrap-around if we reach the end of the list
//        if (rowsToDisplay.Count < batchSize && list.Count > batchSize)
//        {
//            rowsToDisplay.AddRange(list.Take(batchSize - rowsToDisplay.Count));
//        }

//        listview1.DataSource = rowsToDisplay;
//        listview1.DataBind();
//    }
//    catch (Exception ex)
//    {
//        Logger.WriteErrorLog($"BindRows Error: {ex.Message}");
//    }
//}

//protected void Timer1_Tick(object sender, EventArgs e)
//{
//    try
//    {
//        if (list == null || list.Count == 0) return;

//        // Update the start index for the next batch
//        currentIndex = (currentIndex + batchSize) % list.Count;

//        BindRows(currentIndex);
//    }
//    catch (Exception ex)
//    {
//        Logger.WriteErrorLog($"Timer1_Tick Error: {ex.Message}");
//    }
//    }


//        protected void Timer1_Tick(object sender, EventArgs e)
//        {
//            try
//            {
//                currentIndex++;
//                if (currentIndex >= list.Count)
//                {
//                    currentIndex = 0; // Reset to the first row when reaching the end
//                }
//                 BindRow(currentIndex);
//            }
//            catch (Exception ex)
//            {
//                Logger.WriteErrorLog($"Timer_CLick : {ex.Message}");
//            }        
//        }
//    }
//}