<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StatisticsPerFacility.aspx.cs" Inherits="admin_StatisticsPerFacility" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <span class="headingspan">Number of bookings per facility</span> <br /><br />

    

    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Palette="SeaGreen" Width="396px">
        <Series>
            <asp:Series Name="Series1" XValueMember="facility" YValueMembers="bookings" ShadowColor="GreenYellow"></asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
        </ChartAreas>
    </asp:Chart> 
      
        <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource1" Palette="SeaGreen" BorderlineDashStyle="Dash" Height="335px" Width="460px">
        <Series>
            <asp:Series Name="Series1" XValueMember="facility" YValueMembers="bookings" ShadowColor="GreenYellow" ChartArea="ChartArea1" ChartType="Pie" LabelForeColor="Transparent"></asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
        </ChartAreas>
            <Legends>
                <asp:Legend Name="Legend1">
                </asp:Legend>
            </Legends>
    </asp:Chart> 
      
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT count([facility]) as Bookings, facility as Facility FROM [bookings] group by facility">
    </asp:SqlDataSource>

 
</asp:Content>

