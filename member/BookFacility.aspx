<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BookFacility.aspx.cs" Inherits="member_BookFacility" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


  <span class="headingspan">Book a facility:</span> <br /><br />
    <asp:Label ID="userLabel" runat="server" Text="User:"></asp:Label>
     <asp:LoginName ID="userLoginName" Width="120px" runat="server" />
   <br /><br />

   <asp:Label ID="facilityLabel" runat="server" Width="60px" Text="Facility:"></asp:Label>
   <asp:Label ID="facilityValueLabel" runat="server" Width="60px" Text="Facility"></asp:Label>

        <br /><br />




</asp:Content>