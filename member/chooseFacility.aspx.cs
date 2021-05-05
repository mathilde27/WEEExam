using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class member_chooseFacility : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void selected(object sender, EventArgs e)
    {
        /* Take the value of the selected item's primary key (in this case the croom value) and
        * store it as a session variable with the name "conference". In this way we can see
        * which room the user selected on all pages. 
        * Then redirect to the page bookconferenceroom.aspx to complete the booking.
        */
        string str = ListView1.SelectedDataKey.Value.ToString();
        Session["facility"] = str;
        Response.Redirect("~/member/BookFacility.aspx");
    }
}