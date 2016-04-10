using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class CommintyNew : System.Web.UI.Page
{
   
         protected void Page_Load(object sender, EventArgs e)
    {

        string connStr = ConfigurationManager.ConnectionStrings["Social_website_main"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("CommunityInformation", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@theme", "Back and Fourth"));
        conn.Open();
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        if (rdr.HasRows)
        {
            while (rdr.Read())
            {
                string CommunityName = rdr.GetString(rdr.GetOrdinal("name"));
                string Description = rdr.GetString(rdr.GetOrdinal("description"));


                Page.FindControl("comm");
                Page.FindControl("description");

                comm.InnerText = CommunityName;
                description.InnerText = Description;




            }
        }

    }

    protected void btn_Join_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["Social_website_main"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("JoinCommunity", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@theme", "Back"));
        cmd.Parameters.Add(new SqlParameter("@email", "nazih@gmail"));
        SqlParameter outputparameter = new SqlParameter();
        SqlCommand cmd2 = new SqlCommand("checkJoinedCommunity", conn);
        cmd2.CommandType = CommandType.StoredProcedure;
        cmd2.Parameters.Add(new SqlParameter("@email", "nazih@gmail"));
        outputparameter.ParameterName = "@check";
        outputparameter.SqlDbType = System.Data.SqlDbType.Int;
        outputparameter.Direction = System.Data.ParameterDirection.Output;
        cmd2.Parameters.Add(outputparameter);

        conn.Open();

        cmd2.ExecuteNonQuery();
        String check = outputparameter.Value.ToString();
    
        
        if (check == "0")
        {
            cmd.ExecuteNonQuery();
            Response.Write( "you  joined the community" ) ;
        }
        else if(check == "1")

        {
            Response.Write( "you joined the community before");
        }


    }

    protected void btn_Create_Community_Click(object sender, EventArgs e)
    {
        CreateCommunityDiv.Visible = true;
    }

    protected void btnRequest_Click(object sender, EventArgs e)
    {




        string connStr = ConfigurationManager.ConnectionStrings["Social_website_main"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("sp_Request_Creating_Community", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@name", txtCommunityName.Value));
        cmd.Parameters.Add(new SqlParameter("@description", txtCommunityDescription.Value));
        cmd.Parameters.Add(new SqlParameter("@theme", txtCommunityTheme.Value));
        cmd.Parameters.Add(new SqlParameter("@email", "tag@gmail"));
        conn.Open();

        try
        {
            cmd.ExecuteNonQuery();
            lblResponse.InnerText = "Your Request was sent to the Adminstrator!";

        }
        catch( Exception t )
        {
            lblResponse.InnerText = "There is a Community with the same theme, Please choose another theme";
        }

       
     /*   if (cmd.ExecuteNonQuery()==1)

        {
            Response.Write("Your Request was sent to the Adminstrator!");
        }
        else
        {
            Response.Write("There is a Community with the same theme, Please choose another theme");
        }
        
    */


        }
}
