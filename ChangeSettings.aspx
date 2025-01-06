<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeSettings.aspx.cs" Inherits="Practice_Tasks.ChangeSettings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
            justify-content:center;
        }
        label {
            font-size: 20px;
            
        }
        .div{
            padding:20px;
         
            border :1px double black;
            justify-self:center;
            font-size:24px;
            font-weight:bold;
            background-color:burlywood;
            margin-top:20px;
                border-radius: 30px;
        }
        .div > div{
            padding:10px;
              width:550px;
              display:flex;
        }
        .textbox{
          
            height:25px;
            border-radius:10px;
            font-size:18px;
           
        }
       
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div style="text-align:center;"> <strong  style="font-size:38px; text-decoration:underline; text-align:center;">Change Font Size</strong></div>
       
        <div class="div">
            <div>
                <label>Top left chart heading :</label>
                <asp:TextBox CssClass="textbox" runat="server" ID="leftchartHeading" style=" margin-left:18%" ></asp:TextBox>
            </div>
            <div>
                <label> Top right chart side heading :</label>
                <asp:TextBox runat="server" CssClass="textbox" ID="rightchartHeading" style=" margin-left:8.5%" ></asp:TextBox>
            </div>

            <div>
                <label>Bottom chart heading :</label>
                <asp:TextBox runat="server" CssClass="textbox" ID="bottomchartHeading" style=" margin-left:18.5%" ></asp:TextBox>
            </div>
          
            <div>
                <label>Range Name :</label>
                <asp:TextBox runat="server" CssClass="textbox" ID="rangename" style=" margin-left:32.9%" ></asp:TextBox>
            </div>
           
               

            <div>
                <label>Range data :</label>
                <asp:TextBox runat="server" CssClass="textbox" ID="rangedata" style=" margin-left:35.2%"></asp:TextBox>
            </div>
            <div>
                <label>X-axis values :</label>
                <asp:TextBox runat="server" CssClass="textbox" ID="Xaxisdata" style=" margin-left:32.4%" ></asp:TextBox>
            </div>
            <div>
                <label>Y-axis values :</label>
                <asp:TextBox runat="server" CssClass="textbox" ID="Yaxisdata" style=" margin-left:32.5%"></asp:TextBox>
            </div>
            <div>
                <label>Datalabels of bar chart :</label>
                <asp:TextBox runat="server" CssClass="textbox" ID="Bardatalabels" style=" margin-left:17.4%"></asp:TextBox>
            </div>
         
                 <div>
     <label>Top right chart headers :</label>
     <asp:TextBox runat="server" ID="rightHeaders" CssClass="textbox" style=" margin-left:16.8%" ></asp:TextBox>
 </div>
                                <div>
    <label>Left chart center values :</label>
    <asp:TextBox runat="server" ID="leftcenter" CssClass="textbox" style=" margin-left:16.8%" ></asp:TextBox>
</div>
                                <div>
    <label>Right center values :</label>
    <asp:TextBox runat="server" ID="rightcenter" CssClass="textbox" style=" margin-left:23.2%" ></asp:TextBox>
</div>
            <div style="justify-content: center;">
                        <asp:Button runat="server" ID="submitbtn" Text="Save" style="height:50px; width:70px; color:white; border-radius:10px;margin-right:20px; font-size:22px; background-color:forestgreen;" OnClick="OnButtonCLick_SaveChangesToDB"/>
        <asp:Button runat="server" ID="Updatebtn" Text="View Updated Screen" Style="height: 50px; width: 250px;  border-radius:10px; font-size:22px; color: white; background-color: forestgreen;" OnClick="Updatebtn_Click" />
</div>
            </div>
              
    </form>
</body>
</html>
