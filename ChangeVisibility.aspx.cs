using Evaluation2_Screens;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Task1_Black_Screen
{
    public partial class ChangeVisibility : System.Web.UI.Page
    {
        DataBaseHelper dbhelper = new DataBaseHelper();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // Ensure bindCkeckbox is only called once on initial load
            {
                bindCkeckbox();
            }
        }

        public void bindCkeckbox()
        {
            try
            {
                DataTable dtvisible = dbhelper.selectDataFromDB();
                if (dtvisible != null && dtvisible.Rows.Count > 0)
                {
                    for (int i = 0; i < dtvisible.Rows.Count; i++)
                    {
                        string valueInText = dtvisible.Rows[i]["ValueInText"].ToString();
                        string valueInBool = dtvisible.Rows[i]["ValueInBool"].ToString();
                        switch (valueInText)
                        {
                            case "RunningStatus":                              
                                    statusTitle.Checked = valueInBool == "1" ? true : false;
                                break;
                            case "CurrentShift":
                                shift.Checked = valueInBool == "1" ? true : false;
                                break;
                            case "CurrentDay":
                                Day.Checked = valueInBool == "1" ? true : false;
                                break;
                            case "MonthToDate":
                                Month.Checked = valueInBool == "1" ? true : false;
                                break;
                            case "OEE":
                                OEE.Checked = valueInBool == "1" ? true : false;
                                break;
                            case "Power":
                                power.Checked = valueInBool == "1" ? true : false;
                                break;
                            case "IdleTime":
                                idle.Checked = valueInBool == "1" ? true : false;
                                break;
                            case "Rejection":
                                rejection.Checked = valueInBool == "1" ? true : false;
                                break;
                            case "DownTimeReason":
                                downtime.Checked = valueInBool == "1" ? true : false;
                                break;
                            default:
                                Console.WriteLine($"Unrecognized ValueInText: {valueInText}");
                                break;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog($"bindVisibility Error: {ex.Message}");
            }
        }
        protected void OnButtonCLick_SaveChangesToDB(object sender, EventArgs e)
        {
            try
            {

                string status = statusTitle.Checked ? "1" : "0";
                string shiftData = shift.Checked ? "1" : "0";
                string Dayoutput = Day.Checked ? "1" : "0";
                string Monthtodate = Month.Checked ? "1" : "0";
                string OEEValue = OEE.Checked ? "1" : "0";
                string powerValue = power.Checked ? "1" : "0";
                string idleValue = idle.Checked ? "1" : "0";
                string rejectionValue = rejection.Checked ? "1" : "0";
                string downtimeValue = downtime.Checked ? "1" : "0";

              

                dbhelper.addOrUpdateDataToDB(status, shiftData, Dayoutput, Monthtodate, OEEValue,
                    powerValue, idleValue, rejectionValue, downtimeValue);
              

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
                Response.Redirect("BlackScreen.aspx");
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Redirect_to_Charts_2.aspx : " + ex.Message);
            }
        }

    }
}