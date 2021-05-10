using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class member_ViewBooking : System.Web.UI.Page
{

    // DataTable object that will hold the information shown in our GridView
    private DataTable myTable = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        
        // Only do the following when the page is actually loaded, not when we click on buttons, etc
        if (!IsPostBack)
        { 
            // Set the datasource of the DropDownList as soon as the page is loaded
            facilityDropDownList.DataSource = SqlDataSource1;
            facilityDropDownList.DataBind();

            WeekCalendar.SelectedDate = DateTime.Today;

            // Fill out the Gridview
            fillGridView();
        }
    }

    protected void DropDownBox1_Changed(object sender, EventArgs e)
    {
        fillGridView();
    }
    protected void WeekCalendar_SelectionChanged(object sender, EventArgs e)
    {
        fillGridView();
    }


    private void fillGridView()
    {
        // Clear the DataTable object from any information that might already be in it
        myTable.Clear();

        // Add columns to the table representing each of the week days
        myTable.Columns.Add("Time", typeof(string));
        myTable.Columns.Add("Mon", typeof(string));
        myTable.Columns.Add("Tue", typeof(string));
        myTable.Columns.Add("Wed", typeof(string));
        myTable.Columns.Add("Thu", typeof(string));
        myTable.Columns.Add("Fri", typeof(string));
        myTable.Columns.Add("Sat", typeof(string));
        myTable.Columns.Add("Sun", typeof(string));

        /* Add rows for the various times we can book rooms. 
        * In a perfect world (where I'm less lazy) the times should
        * be retreived from the times table in my database
        */
        DataRow row1 = myTable.NewRow();
        row1["Time"] = "8-9";

        DataRow row2 = myTable.NewRow();
        row2["Time"] = "9-10";

        DataRow row3 = myTable.NewRow();
        row3["Time"] = "10-11";

        DataRow row4 = myTable.NewRow();
        row4["Time"] = "11-12";

        DataRow row5 = myTable.NewRow();
        row5["Time"] = "12-13";

        DataRow row6 = myTable.NewRow();
        row6["Time"] = "13-14";

        DataRow row7 = myTable.NewRow();
        row7["Time"] = "14-15";

        DataRow row8 = myTable.NewRow();
        row8["Time"] = "15-16";

        DataRow row9 = myTable.NewRow();
        row9["Time"] = "16-17";

        DataRow row10 = myTable.NewRow();
        row10["Time"] = "17-18";

        DataRow row11 = myTable.NewRow();
        row11["Time"] = "18-19";

        DataRow row12 = myTable.NewRow();
        row12["Time"] = "19-20";

        DataRow row13 = myTable.NewRow();
        row13["Time"] = "20-21";

        // Gets the default connection string/path to our database from the web.config file
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        // Creates a connection to our database
        SqlConnection con = new SqlConnection(dbstring);

        // The SQL statement to select all bookings in a specific room for a given week
        string sqlStr = "SELECT * FROM bookings WHERE facility = @theFacility AND date >= @theMonday AND date <= @theSunday ";

        //Date selected in calendar
        DateTime dt = WeekCalendar.SelectedDate;

        //There is a thing called "DayOfWeek" where each week day has a number, from 0 to 6. The week starts on Sunday, so:
        //DayOfWeek.Sunday == 0, DayOfWeek.Monday==1, ... DayOfWeek.Saturday==6

        //Days between Monday in the selected week and the selected day 
        int daysBetween = DayOfWeek.Monday - dt.DayOfWeek;

        if (daysBetween > 0) //selected day is a Sunday
        {
            daysBetween -= 7; //I need the preceding Monday, not the following Monday
        }

        //Monday in the selected week
        DateTime monday = dt.AddDays(daysBetween);

        //Sunday in the selected week
        DateTime sunday = monday.AddDays(6);

        // Create an executable SQL command containing our SQL statement and the database connection
        SqlCommand sqlCmd = new SqlCommand(sqlStr, con);

        // Fill in the parameters in our prepared SQL statement
        sqlCmd.Parameters.AddWithValue("@theFacility", facilityDropDownList.SelectedValue);
        sqlCmd.Parameters.AddWithValue("@theMonday", monday);
        sqlCmd.Parameters.AddWithValue("@theSunday", sunday);

        // Open the database connection
        con.Open();

        // DataSet that will contain the information we retreive from the database
        DataSet ds = new DataSet();

        // The SqlDataAdapter will retrieve the data from the database and fill the information
        // from the  bookings table into the DataSet
        SqlDataAdapter da = new SqlDataAdapter(sqlCmd);
        da.Fill(ds);

        // Close the connection to the database
        con.Close();

        // Run through the retrieved bookings
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            // Take the information we need from each booking out of the DataSet
            string theUser = Convert.ToString(ds.Tables[0].Rows[i]["bookedBy"]);
            string theTime = Convert.ToString(ds.Tables[0].Rows[i]["time"]);
            DateTime theDate = Convert.ToDateTime(ds.Tables[0].Rows[i]["date"]);

            // Calculate which day of the week each date is, to place them in the right
            // column in the DataTable
            int theDayNo = (int)theDate.DayOfWeek;

            if (theDayNo == 0) //Sunday
            {
                theDayNo = 7;  //I want Sunday displayed in column 7, not column 0
            }

            if (theTime == "8-9")
            {
                row1[theDayNo] = theUser;
            }
            else if (theTime == "9-10")
            {
                row2[theDayNo] = theUser;
            }
            else if (theTime == "10-11")
            {
                row3[theDayNo] = theUser;
            }
            else if (theTime == "11-12")
            {
                row4[theDayNo] = theUser;
            }
            else if (theTime == "12-13")
            {
                row5[theDayNo] = theUser;
            }
            else if (theTime == "13-14")
            {
                row6[theDayNo] = theUser;
            }
            else if (theTime == "14-15")
            {
                row7[theDayNo] = theUser;
            }
            else if (theTime == "15-16")
            {
                row8[theDayNo] = theUser;
            }
            else if (theTime == "16-17")
            {
                row9[theDayNo] = theUser;
            }
            else if (theTime == "17-18")
            {
                row10[theDayNo] = theUser;
            }
            else if (theTime == "18-19")
            {
                row11[theDayNo] = theUser;
            }
            else if (theTime == "19-20")
            {
                row12[theDayNo] = theUser;
            }
            else if (theTime == "20-21")
            {
                row13[theDayNo] = theUser;
            }
         

        }

        // Add all the rows to the DataTable
        myTable.Rows.Add(row1);
        myTable.Rows.Add(row2);
        myTable.Rows.Add(row3);
        myTable.Rows.Add(row4);
        myTable.Rows.Add(row5);
        myTable.Rows.Add(row6);
        myTable.Rows.Add(row7);
        myTable.Rows.Add(row8);
        myTable.Rows.Add(row9);
        myTable.Rows.Add(row10);
        myTable.Rows.Add(row11);
        myTable.Rows.Add(row12);
        myTable.Rows.Add(row13);

        // Set the data source of the GridView in our web page to the DataTable with the bookings
        GridView1.DataSource = myTable;
        GridView1.DataBind();

        //Set fitting width for each GridView column
        for (int i = 0; i < GridView1.HeaderRow.Cells.Count; i++)
        {
            GridView1.HeaderRow.Cells[i].Attributes["Width"] = "64px";
        }

    }
}