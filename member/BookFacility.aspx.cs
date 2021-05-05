using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class member_BookFacility : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /* If there is a session value stored called "conference", someone has correctly chosen a
    * room to book, so set the text of the roomValueLabel to that room so the users can see 
    * which room they are about to book. Else something must have gone wrong so as some sort
    * of error handling, I will just set it to room VBI-6.01
    */
        if (Session.Count > 0 && Session["Facility"].ToString() != null)
        {
            facilityValueLabel.Text = Session["Facility"].ToString();
        }
        else
        {
            facilityValueLabel.Text = "Badminton court1";
        }
    }


    protected void BookingButton_Click(object sender, EventArgs e)
    {
        //Get the date as a string from the dateTextBox
        string dateStr = dateTextBox.Text;

        //Split the date string on every '-' or '/' found
        string[] splitDateStr = dateStr.Split(new char[] { '-', '/' });

        //Create a DateTime object from the chosen date. Constructor takes date in this order: year, month, date. So, last index of the array first
        DateTime theDate = new DateTime(Convert.ToInt32(splitDateStr[2]), Convert.ToInt32(splitDateStr[1]), Convert.ToInt32(splitDateStr[0]));

        // Gets the default connection string/path to our database from the web.config file
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        // Creates a connection to our database
        SqlConnection con = new SqlConnection(dbstring);

        // The SQL statement to insert a booking. By using prepared statements,
        // we automatically get some protection against SQL injection.
        string sqlStr = "INSERT INTO bookings (facility, bookedBy, date, time) VALUES (@theFacility, @theUser, @theDate, @theTime)";

        // Open the database connection
        con.Open();

        // Create an executable SQL command containing our SQL statement and the database connection
        SqlCommand sqlCmd = new SqlCommand(sqlStr, con);

        // Fill in the parameters in our prepared SQL statement
        sqlCmd.Parameters.AddWithValue("@theFacility", facilityValueLabel.Text);
        sqlCmd.Parameters.AddWithValue("@theUser", this.User.Identity.Name);
        sqlCmd.Parameters.AddWithValue("@theDate", theDate);
        sqlCmd.Parameters.AddWithValue("@theTime", timeDropDownList.SelectedValue);

        // Execute the SQL command
        sqlCmd.ExecuteNonQuery();

        // Close the connection to the database
        con.Close();

        // Show the user that the booking has been added
        resultLabel.Text = "Booking added";

    }
}