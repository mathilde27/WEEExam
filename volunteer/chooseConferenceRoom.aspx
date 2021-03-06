<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="chooseConferenceRoom.aspx.cs" Inherits="volunteer_chooseConferenceRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <span class="headingspan">Choose a conference room to book</span> <br /><br />

         <asp:ListView ID="ListView1" runat="server" DataKeyNames="conferenceRoom" 
         DataSourceID="SqlDataSource1" OnSelectedIndexChanged="selected">

               <AlternatingItemTemplate> 
           <!-- The AlternatingItemTemplate can be used to make every second item displayed differently.
              So item 1, 3, 5, etc. will appear as defined in the ItemTemplate, and item 2, 4, 6, etc. will 
              be displayed as defined in this AlternatingItemTemplate 
         -->
         <div style="background-color:#e6eeff; float:left;padding:10px;margin:0px 5px 5px 0px; border:1px solid #002b80">
            <div style="float:left">
               <span style="color: #000000;">
                  Room: <asp:Label ID="croomidLabel" runat="server" Text='<%# Eval("conferenceRoom") %>' />
                  <br />
                  Seats: <asp:Label ID="seatsLabel" runat="server" Text='<%# Eval("seats") %>' />
                  <br />
                  Projector: <asp:CheckBox ID="projectorCheckBox" runat="server" Checked='<%# Eval("projector") %>' Enabled="false" />
                  <br /><br />
                  <asp:Button ID="Button1" runat="server" Text="Select" CommandName="select" />
                  <br/>
               </span>
            </div>
            <div style="float:right;margin:0px 50px">
               <!-- Set the image by using the conditional operator. If no image path is in the 
                    database, then use standard image, else use the image path from the database 
               --> 
               <asp:Image ID="image" runat="server" ImageUrl='<%# Eval("image").ToString() == "" ? "~/images/NoImage.png" : Eval("image") %>' AlternateText="Room Image"/>
            </div>
            <br />
            <br />
         </div>
        </AlternatingItemTemplate>
       
        <EmptyDataTemplate>
          <!-- Defines what should be displayed if no items are returned from the database -->
          No Conference rooms found.
        </EmptyDataTemplate>
      
        <ItemTemplate>
            <!-- The ItemTemplate defines how each item in the database will be displayed. 
              To get the value from each column we can use Eval("columnName") 
         --> 
         <div style="background-color:#e6eeff; float:left; clear:both; padding:10px; margin:0px 5px 5px 0px; border:1px solid #002b80">
            <div style="float:left;">
               <span style="color: #000000;">
                  Room: <asp:Label ID="croomidLabel" runat="server" Text='<%# Eval("conferenceRoom") %>' />
                  <br />
                  Seats: <asp:Label ID="seatsLabel" runat="server" Text='<%# Eval("seats") %>' />
                  <br />
                  Projector: <asp:CheckBox ID="projectorCheckBox" runat="server" Checked='<%# Eval("projector") %>' Enabled="false" />
                  <br /><br />
                  <asp:Button ID="Button1" runat="server" Text="Select" CommandName="select" />
                  <br/>
               </span>
            </div>
            <div style="float:right;margin:0px 50px">
               <!-- Set the image by using the conditional operator. If no image path is in the 
                    database, then use standard image, else use the image path from the database 
               --> 
               <asp:Image ID="image" runat="server" ImageUrl='<%# Eval("image").ToString() == "" ? "~/images/NoImage.png" : Eval("image") %>' AlternateText="Room Image"/>
            </div>
            <br />
            <br />
         </div>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="clear:both;text-align: center;">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="2">
                </asp:DataPager>
            </div>
        </LayoutTemplate>
      </asp:ListView>

     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         SelectCommand="SELECT [conferenceRoom], [seats], [projector], [image] FROM [conferenceRoom] ORDER BY [conferenceRoom]">
     </asp:SqlDataSource>

</asp:Content>

