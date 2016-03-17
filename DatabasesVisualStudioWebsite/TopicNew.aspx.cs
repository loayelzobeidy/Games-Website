using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class TopicNew : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["Social_website_main"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("TopicInformation", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@id", 5));
        conn.Open();
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        if (rdr.HasRows)
        {
            while (rdr.Read())
            {
                string TopicName = rdr.GetString(rdr.GetOrdinal("title"));
                string Theme = rdr.GetString(rdr.GetOrdinal("theme"));
                string By = rdr.GetString(rdr.GetOrdinal("member_email"));
                string Description = rdr.GetString(rdr.GetOrdinal("description"));



                lblTopicTitle.InnerText = TopicName;
                lblTopicTheme.InnerText = Theme;
                lbldescription.InnerText = Description;     
                linkUserProfile.InnerText = By;





            }
        }

    }
}
