<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeVisibility.aspx.cs" Inherits="Task1_Black_Screen.ChangeVisibility" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            justify-content: center;
            padding-top:3%;
        }

        label {
            font-size: 26px;
        }

        .div {
            padding: 20px;
            border: 1px double black;
            justify-self: center;
            font-size: 24px;
            font-weight: bold;
            background-color: burlywood;
            margin-top: 20px;
            border-radius: 30px;
            width: 28%;
        }

            .div > div >div {
                padding: 10px;
                display: inline-flex;
                width: 60%;
            }

        .textbox {
            border-radius: 10px;
            font-size: 30px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server" >
            <ContentTemplate>
                 <div style="text-align: center;"><strong style="font-size: 38px; text-decoration: underline; text-align: center;">Set The Visibility</strong></div>

 <div class="div">
     <div style=" text-align: center;">
         <div>
             <label>Running Status :</label>

             <asp:CheckBox CssClass="" runat="server"  ID="statusTitle" Style="transform: scale(2.1); padding-left: 13.2%"></asp:CheckBox>
         </div>
         <div>
             <label>Shift output :</label>
             <asp:CheckBox runat="server" CssClass="textbox"  ID="shift" Style="padding-left: 22.9%; transform: scale(2);"></asp:CheckBox>
         </div>

         <div>
             <label>Day output :</label>
             <asp:CheckBox runat="server" CssClass="textbox"  ID="Day" Style="transform: scale(2.1); padding-left: 24.3%"></asp:CheckBox>
         </div>

         <div>
             <label>Month to date :</label>
             <asp:CheckBox runat="server" CssClass="textbox"  ID="Month" Style="transform: scale(2); padding-left: 17.89%"></asp:CheckBox>
         </div>



         <div>
             <label>OEE :</label>
             <asp:CheckBox runat="server" CssClass="textbox"  ID="OEE" Style="transform: scale(2); padding-left: 42.5%;"></asp:CheckBox>
         </div>
         <div>
             <label>Power :</label>
             <asp:CheckBox runat="server" CssClass="textbox"  ID="power" Style="transform: scale(2.1); padding-left: 37.8%"></asp:CheckBox>
         </div>
         <div>
             <label>Idle Time :</label>
             <asp:CheckBox runat="server" CssClass="textbox"  ID="idle" Style="transform: scale(2); padding-left: 30.5%"></asp:CheckBox>
         </div>
         <div>
             <label>Rejection :</label>
             <asp:CheckBox runat="server" CssClass="textbox"  ID="rejection" Style="transform: scale(2); padding-left: 31%"></asp:CheckBox>
         </div>

         <div>
             <label>Downtime reason :</label>
             <asp:CheckBox runat="server" ID="downtime" CssClass="textbox"  Style="transform: scale(2); padding-left: 10%"></asp:CheckBox>
         </div>
     </div>



     <div style="justify-self: center;padding-top:3%;">
         <asp:Button runat="server" ID="submitbtn" Text="Save" Style="height: 50px; width: 70px; color: white; border-radius: 10px; margin-right: 20px; font-size: 22px; background-color: forestgreen;" OnClick="OnButtonCLick_SaveChangesToDB" />
         <asp:Button runat="server" ID="Updatebtn" Text="View Updated Screen" Style="height: 50px; width: 250px; border-radius: 10px; font-size: 22px; color: white; background-color: forestgreen;" OnClick="Updatebtn_Click" />
     </div>
 </div>
            </ContentTemplate>
        </asp:UpdatePanel>
       

    </form>
</body>
</html>
