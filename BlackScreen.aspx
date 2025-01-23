<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlackScreen.aspx.cs" Inherits="Task1_Black_Screen.BlackScreen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


    <style>
        body {
            background-color: black;
            color: white;
            margin-top: 0px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            text-align: center;
        }

        .header-center {
            width: 55%;
            height: 50px;
            background-color: #222222;
            border-radius: 10px;
            text-align: center;
            padding-top: 10px;
            margin-left: 100px;
        }

        .header-title {
            font-size: 35px;
            font-weight: bold;
            font-family: monospace;
        }

        .header-right {
            display: flex;
            font-size: 25px;
            flex-direction: column;
            font-weight: 550;
            font-family: sans-serif;
            line-height: 1;
        }

        .shiftA {
            /*margin-left: 65%;*/
        }

        .pagebody {
            padding-left: 40px;
            padding-right: 40px;
            display: flex;
            justify-content: center;
        }

        .leftmenu {
            width: 29%;
            border-radius: 10px;
        }

        .menuitems {
            font-weight: bold;
            padding: 10px;
            display: flex;
            font-size: 20px;
            font-family: sans-serif;
        }

            .menuitems > img {
                width: 35px;
                height: 35px;
                padding-left: 10px;
            }

            .menuitems:nth-child(even) {
                border-radius: 10px;
                background-color: #393433;
                margin-bottom: 4px;
            }

            .menuitems:nth-child(odd) {
                border-radius: 10px;
                background-color: #222222;
                margin-bottom: 4px;
            }

        .menuname {
            padding-left: 15px;
            padding-top: 6px;
        }

        .menuright {
            padding-left: 60px;
            padding-right: 20px;
            font-weight: 550;
            padding-top: 6px;
        }

        .rightTable {
            margin-left: 40px;
            color: white;
            font-family: sans-serif;
            font-weight: 550;
        }

            .rightTable > table > tbody {
                display: flex;
                margin-top: 6.5px;
                width: 100%
            }

                .rightTable > table > tbody > tr {
                    display: grid;
                    margin-left: 20px;
                    width: 500px;
                    text-align: center;
                }

                    .rightTable > table > tbody > tr > td {
                        border-radius: 10px;
                        font-size: 20px;
                        margin-bottom: 4px;
                        padding: 4px;
                        padding-top: 16px;
                        height: 35px;
                    }

                        .rightTable > table > tbody > tr > td:nth-child(even) {
                            background-color: #393433;
                        }

                        .rightTable > table > tbody > tr > td:nth-child(odd) {
                            background-color: #222222;
                        }

        .monthTable {
            justify-self: center;
        }

        /*        .rightTable > table > tbody > tr > td:nth-child(5) {
            height: 130px;
            padding: 0px;
        }*/
        #monthValue {
            height: 130px;
            padding: 0px;
        }

        #downtimeValue {
            height: 50px;
            padding-top: 8px;
            padding-bottom: 2px;
        }

        #downtime {
            padding-top: 8px;
        }

        .startdata {
            color: black;
        }
    </style>
    <%-- <script type="text/javascript">
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_beginRequest(function () {
            document.getElementById('<%= Timer1.ClientID %>').disabled = true; 
    });
    prm.add_endRequest(function () { 
        document.getElementById('<%= Timer1.ClientID %>').disabled = false;
    });
    </script>--%>
</head>
<body>
    <form id="form1" runat="server">
        <div style="padding: 20px;">
            <div class="header">
                <img runat="server" src="./Images/AmitLogo-Transparent.png" alt="Amit_Logo" style="width: 135px; height: 65px; background-color: black;" />
                <div class="header-center">
                    <asp:Label runat="server" Text="ANDON-TPM Trak" class="header-title"></asp:Label>
                </div>
                <div class="header-right">
                    <asp:Label runat="server" ID="currentDate"></asp:Label>
                    <div style="display: flex; margin-left: 46%;">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="./Images/settings.png" Style="width: 40px; padding-right: 10px;"
                            OnClick="ImageButton1_Click" class="header-settings-icon" />

                        <asp:Label runat="server" Text="Shift A" class="shiftA"></asp:Label>
                    </div>

                </div>
            </div>
        </div>

        <asp:Timer runat="server" OnTick="Timer1_Tick" ID="Timer1" Interval="10000"></asp:Timer>
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
            <ContentTemplate>
                <div class="pagebody" style="display: flex;">
                    <div class="leftmenu">

                        <div runat="server" style="width: 20px; height: 65px;"></div>
                        <div class="menuitems" style="" runat="server" id="statusTitle">
                            <img runat="server" src="./Images/settings (4).png" alt="Status Image" />
                            <asp:Label runat="server" CssClass="menuname" Text="Running Status"></asp:Label>
                        </div>
                        <div class="menuitems" runat="server" id="shiftTitle">
                            <img runat="server" src="./Images/chart.png" alt="Image" />

                            <asp:Label runat="server" CssClass="menuname" Text="Shift output (no's)"></asp:Label>
                            <asp:Label runat="server" Text="Target/Actual" CssClass="menuright"></asp:Label>
                        </div>
                        <div class="menuitems" runat="server" id="dayOutputTitle">
                            <img runat="server" src="./Images/chart.png" alt="Image" />
                            <asp:Label runat="server" CssClass="menuname" Text="Day output"></asp:Label>
                            <asp:Label runat="server" Text="Target/Actual" Style="padding-left: 124px" CssClass="menuright"></asp:Label>
                        </div>
                        <div class="menuitems" style="padding: 10px;" runat="server" id="MonthtoDateTitle">
                            <img runat="server" src="./Images/calendar.png" alt="calendar Image" style="padding-top: 30px;" />
                            <asp:Label runat="server" CssClass="menuname" Style="padding-top: 30px;" Text="Month to Date (MTD)"></asp:Label>
                            <div runat="server" style="text-align: center">
                                <asp:Label runat="server" Text="Req.Rate/Day" CssClass="menuright"></asp:Label>
                                <hr style="width: 56%; margin-left: 30%; opacity: 0.2;" />
                                <asp:Label runat="server" Text="Hit Rate/Day" CssClass="menuright"></asp:Label>
                                <hr style="width: 56%; margin-left: 30%; opacity: 0.2;" />
                                <asp:Label runat="server" Text="Ask Rate/Day" CssClass="menuright"></asp:Label>
                            </div>
                        </div>
                        <div class="menuitems" runat="server" id="OEETitle">
                            <img runat="server" src="./Images/speedometer.png" alt="speedometer.png Image" />
                            <asp:Label runat="server" CssClass="menuname" Text="OEE (%)"></asp:Label>
                        </div>
                        <div class="menuitems" runat="server"  id="PowerTitle">
                            <img runat="server" src="./Images/electricity.png" alt="Status Image" />
                            <asp:Label runat="server" CssClass="menuname" Text="Power(KWH.CUM.)"></asp:Label>
                        </div>
                        <div class="menuitems" runat="server"  id="IdleTitle">
                            <img runat="server" src="./Images/stopwatch.png" alt="Image" />
                            <asp:Label runat="server" CssClass="menuname" Text="Idle time"></asp:Label>
                            <asp:Label runat="server" Text="Current/Today" CssClass="menuright" Style="padding-left: 140px"></asp:Label>
                        </div>
                        <div class="menuitems" runat="server"  id="RejectionTitle">
                            <img runat="server" src="./Images/gear.png" alt="Image" />

                            <asp:Label runat="server" CssClass="menuname" Text="Rejection (No's)"></asp:Label>
                            <asp:Label runat="server" Text="Today/Cumm." CssClass="menuright" Style="padding-left: 74px"></asp:Label>
                        </div>
                        <div class="menuitems" runat="server" id="downtimeTitle">
                            <img runat="server" src="./Images/reliability.png" alt="Status Image" />
                            <asp:Label runat="server" CssClass="menuname" ID="downtime" Text="Down time reason"></asp:Label>
                        </div>
                    </div>
                    <div class="rightTable">
                        <asp:ListView runat="server" ID="listview1" ItemPlaceholderID="itemplaceholder" OnItemDataBound="listview1_ItemDataBound">
                            <LayoutTemplate>
                                <table>
                                    <tr runat="server" id="itemplaceholder">
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td runat="server" clientidmode="Static" id="checkvalue" class="serialdata" style="color: white; background-color: dimgrey; font-size: 22px; font-weight: bolder; padding-top: 10px; height: 38px;">
                                        <asp:Label runat="server" Text='<%# Eval("MachineID") %>'></asp:Label>
                                    </td>
                                    <td runat="server" class="startdata" clientidmode="Static" style='<%# Eval("BackgroundColor") %>' id="statusValue">
                                        <asp:Label runat="server" Text='<%# Eval("MachineLiveStatus") %>'></asp:Label>
                                    </td>
                                    <td runat="server" class="enddata" clientidmode="Static" id="shiftValue">
                                        <asp:Label runat="server" Text='<%# Eval("ShiftTarget") %>' Style='<%# Eval("targetcolor") %>'></asp:Label>
                                    </td>
                                    <td runat="server" class="iddata" clientidmode="Static" id="dayValue">
                                        <asp:Label runat="server" Text='<%# Eval("DayTarget") %>' Style='<%# Eval("targetcolor") %>'></asp:Label>
                                    </td>
                                    <td runat="server" class="innerdata" clientidmode="Static" id="monthValue">
                                        <table class="monthTable">
                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" Text='<%# Eval("ReqRate") %>'></asp:Label>
                                                    <hr style="width: 350px; color: #ddd; opacity: 0.2;" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" Text='<%# Eval("HitRate") %>'></asp:Label>
                                                    <hr style="width: 350px; opacity: 0.2;" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" Text='<%# Eval("AskRate") %>'></asp:Label></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td runat="server" class="downdata" id="oeeeValue" clientidmode="Static">
                                        <asp:Label runat="server" Text='<%# Eval("ShiftOEE") %>'></asp:Label>
                                    </td>
                                    <td runat="server" class="downdata" id="powerValue" clientidmode="Static">
                                        <asp:Label runat="server" Text='<%# Eval("MonthLevel_KWH") %>'></asp:Label>
                                    </td>
                                    <td runat="server" class="downdata" id="idleValue" clientidmode="Static">
                                        <asp:Label runat="server" Text='<%# Eval("ShiftDownTime") %>'></asp:Label>
                                    </td>
                                    <td runat="server" class="downdata" id="rejectValue" clientidmode="Static">
                                        <asp:Label runat="server" Text='<%# Eval("DayRejCount") %>' Style="color: red"></asp:Label>
                                    </td>
                                    <td runat="server" class="" style="" id="downtimeValue" clientidmode="Static">
                                        <asp:Label runat="server" Text='<%# Eval("HelpReqStatus") %>' Style='<%# Eval("statuscolor") %>'></asp:Label>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate runat="server">
                                <asp:Label runat="server" Text="No data to display" Style="padding: 20px; border: 1px solid #ddd; margin-left: 35%; margin-top: 6%; font-size: 18px;"></asp:Label>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>

        </asp:UpdatePanel>

    </form>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const currentDate = new Date();
            const formattedDate = currentDate.toLocaleDateString('en-IN', {
                month: 'short',
                day: '2-digit',
                year: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit',
                hour12: false,
            });
            const [date, time] = formattedDate.split(', ');
            const [month, day, year] = date.split(' ');
            const finalDate = `${day} ${month} ${year} ${time}`;
            document.getElementById('currentDate').textContent = finalDate;
        });
    </script>
</body>
</html>
