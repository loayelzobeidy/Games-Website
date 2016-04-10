using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class ConferenceReview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["Social_website_main"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("ConferenceReviewInformation", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@id", 1));
        SqlCommand cmd2 = new SqlCommand("select (content) as comments ,email from Conference_Review_Comments where conference_id=1", conn);
        conn.Open();
        SqlDataReader rdr2 = cmd2.ExecuteReader();
        GridView1.DataSource = rdr2;
        GridView1.DataBind();
        conn.Close();
        conn.Open();
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        if (rdr.HasRows)
        {
            while (rdr.Read())
            {
                string ConferenceName = rdr.GetString(rdr.GetOrdinal("Conferecename"));
                string MemberEmail = rdr.GetString(rdr.GetOrdinal("member_email"));
                string content = rdr.GetString(rdr.GetOrdinal("content"));
                lblConferenceName.InnerText = ConferenceName;
                lblReview.InnerText = content;
                ReviewerProfile.InnerText = MemberEmail;
               
            }
        }
    }



    protected void btn_Comment_Click(object sender, EventArgs e)
    {

    }
}
