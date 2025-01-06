<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeSettings.aspx.cs" Inherits="Practice_Tasks.ChangeSettings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        label {
            font-size: 20px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <label>Set font size of top left chart heading</label>
                <asp:TextBox runat="server" ID="leftchartHeading"></asp:TextBox>
            </div>
            <div>
                <label>Set font size of top right chart side heading</label>
                <asp:TextBox runat="server" ID="rightchartHeading"></asp:TextBox>
            </div>

            <div>
                <label>Set font size of bottom chart heading</label>
                <asp:TextBox runat="server" ID="bottomchartHeading"></asp:TextBox>
            </div>
            <hr />
            <div>
                <label>Set font size of range Name</label>
                <asp:TextBox runat="server" ID="rangename"></asp:TextBox>
            </div>
           
               

            <div>
                <label>Set font size of range data</label>
                <asp:TextBox runat="server" ID="rangedata"></asp:TextBox>
            </div>
            <div>
               
            <hr />

            <div>
                <label>Set font size of X-axis values</label>
                <asp:TextBox runat="server" ID="Xaxisdata"></asp:TextBox>
            </div>
            <div>
                <label>Set font size of Y-axis values</label>
                <asp:TextBox runat="server" ID="Yaxisdata"></asp:TextBox>
            </div>
            <div>
                <label>Set font size of datalabels of bar chart</label>
                <asp:TextBox runat="server" ID="Bardatalabels"></asp:TextBox>
            </div>
            <hr />
                 <div>
     <label>Set font size of top right chart headers</label>
     <asp:TextBox runat="server" ID="rightHeaders"></asp:TextBox>
 </div>
                                <div>
    <label>Set font size of left chart center values</label>
    <asp:TextBox runat="server" ID="leftcenter"></asp:TextBox>
</div>
                                <div>
    <label>Set font size of right center values</label>
    <asp:TextBox runat="server" ID="rightcenter"></asp:TextBox>
</div>
                <asp:Button runat="server" ID="submitbtn" Text="Save" style="height:40px; width:60px; color:white; background-color:forestgreen;" OnClick="OnButtonCLick_SaveChangesToDB"/>
                <asp:Button runat="server" ID="Updatebtn" Text="View Updated Screen" Style="height: 40px; width: 150px; color: white; background-color: forestgreen;" OnClick="Updatebtn_Click" />
        </div>
    </form>
</body>
</html>
