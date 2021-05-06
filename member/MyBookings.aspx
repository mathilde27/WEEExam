<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyBookings.aspx.cs" Inherits="member_MyBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <span class="headingspan">All current bookings:</span><br /><br />
      <asp:Label ID="userLabel" runat="server" Text="User:" Visible="false"></asp:Label>
   
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="facility" HeaderText="facility" SortExpression="facility" />
            <asp:BoundField DataField="bookedBy" HeaderText="bookedBy" SortExpression="bookedBy" Visible="false"/>
            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" DataFormatString="{0:d}"/>
            <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="false"/>
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" /> 
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
</asp:GridView>

     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         SelectCommand="SELECT [facility], [bookedBy], [date], [time], [Id] FROM [bookings] WHERE ([bookedBy] = @bookedBy)" 
         DeleteCommand="DELETE FROM [bookings] WHERE [Id] = @Id" InsertCommand="INSERT INTO [bookings] ([facility], [bookedBy], [date], [time]) VALUES (@facility, @bookedBy, @date, @time)" UpdateCommand="UPDATE [bookings] SET [facility] = @facility, [bookedBy] = @bookedBy, [date] = @date, [time] = @time WHERE [Id] = @Id">
         <DeleteParameters>
             <asp:Parameter Name="Id" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="facility" Type="String" />
             <asp:Parameter Name="bookedBy" Type="String" />
             <asp:Parameter DbType="Date" Name="date" />
             <asp:Parameter Name="time" Type="String" />
         </InsertParameters>
         <SelectParameters>
             <asp:ControlParameter ControlID="userLabel" Name="bookedBy" PropertyName="Text" Type="String" />
         </SelectParameters>
         <UpdateParameters>
             <asp:Parameter Name="facility" Type="String" />
             <asp:Parameter Name="bookedBy" Type="String" />
             <asp:Parameter DbType="Date" Name="date" />
             <asp:Parameter Name="time" Type="String" />
             <asp:Parameter Name="Id" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>
         
</asp:Content>

