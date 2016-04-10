using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Conference : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["Social_website_main"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("GetConference", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@id", 3));
        SqlCommand cmd2 = new SqlCommand("select  Distinct (content) as reviews,member_email from Conference_Reviews where conference_id=3", conn);
        SqlCommand cmd3 = new SqlCommand("sp_View_Conference", conn);
        cmd3.Parameters.Add(new SqlParameter("@name", "GUC"));
        cmd3.CommandType = CommandType.StoredProcedure;
        conn.Open();
        SqlDataReader rdr2 = cmd2.ExecuteReader();
        ReviewGridView.DataSource = rdr2;
        ReviewGridView.DataBind();
        conn.Close();
        conn.Open();
        SqlDataReader rdr3 = cmd3.ExecuteReader();
        GridView1.DataSource = rdr3;
        GridView1.DataBind();
        conn.Close();
        conn.Open();
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        if (rdr.HasRows)
        {
            while (rdr.Read())
            {
                string ConferenceName = rdr.GetString(rdr.GetOrdinal("name"));


                DateTime startdate = rdr.GetDateTime(rdr.GetOrdinal("start_date"));
                String venue = rdr.GetString(rdr.GetOrdinal("venue"));
                string date = "" + startdate;

                lblConferenceName.InnerText = ConferenceName;
                lblDate.InnerText = date;
                lblLocation.InnerText = venue;



            }
        }
    }

    protected void btnAttendConference_Click(object sender, EventArgs e)
    {

        string connStr = ConfigurationManager.ConnectionStrings["Social_website_main"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("Add_Conferenceby_Members", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@email", "3adela@gmail"));
        cmd.Parameters.Add(new SqlParameter("@conference_id", 4));
        conn.Open();
        cmd.ExecuteNonQuery();
           
        

    }

    protected void btnDevelopment_team_add_game_clik(object sender, EventArgs e)
    {

        string connStr = ConfigurationManager.ConnectionStrings["Social_website_main"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("sp_DevelopmentTeam_Add_Attended_Conference_and_Games", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@conferencename", "Yasta"));
        cmd.Parameters.Add(new SqlParameter("@name", "Yugioh"));
        cmd.Parameters.Add(new SqlParameter("@email", "abbasd;@gmail"));
        cmd.Parameters.Add(new SqlParameter("@releasedate", "2012/3/5"));
        cmd.Parameters.Add(new SqlParameter("@rating", 1));
        cmd.Parameters.Add(new SqlParameter("@agelimit", 19));
       
        conn.Open();
        cmd.ExecuteNonQuery();
    }

    protected void btnAddReview_Click(object sender, EventArgs e)
    {
        Add_review_Conference.Visible = true;
    }

    protected void btnReview_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["Social_website_main"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("sp_add_conference_review_to_confernece_I_attended ", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@email", "abbas@gmail"));
        cmd.Parameters.Add(new SqlParameter("@conference_name", "GUC"));
        cmd.Parameters.Add(new SqlParameter("@review", txtReviewContent.Value));
        conn.Open();
        cmd.ExecuteNonQuery();


    }





    protected void ReviewGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
       int index = ReviewGridView.SelectedRow.RowIndex;
        string conference_id = ReviewGridView.Rows[index].Cells[0].Text;

    }

    protected void Review_Click(object sender, EventArgs e)
    {
        Response.Redirect("ConferenceReview.aspx");
    }

   
}
