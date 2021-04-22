<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ScheduleWork.aspx.cs" Inherits="employee_ScheduleWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

       <span class="headingspan">Work schedule</span> <br /><br />
    <asp:Label ID="userLabel" runat="server" Text="User:"></asp:Label>
     <asp:LoginName ID="userLoginName" Width="120px" runat="server" />
   <br /><br />

        <br /><br />
</asp:Content>

