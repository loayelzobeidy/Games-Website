using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class GamePage : System.Web.UI.Page
{
    /*Getters and setter 

         private static String s ;
    public String S 
    {
    get{return GamePage.S;}
    set{GamePage
     }

     */

    protected void Page_Load(object sender, EventArgs e)
    {
        
        string connStr = ConfigurationManager.ConnectionStrings["Social_website_main"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("game_information_new", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@name", "Assasins Creed"));
        conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            if (rdr.HasRows)
            {
                while (rdr.Read())
                {
                    string GameName = rdr.GetString(rdr.GetOrdinal("name"));
                    //Int32.Parse
                    // DateTime currentdate = DateTime.Now;
                    int age = rdr.GetInt32(rdr.GetOrdinal("age_limit"));
                    String age_limit = "" + age;
                    int rating = rdr.GetInt32(rdr.GetOrdinal("rating"));
                    String ratings = "" + rating;
                    string DevelopmentTeamEmail = rdr.GetString(rdr.GetOrdinal("development_team_email"));
                    string Type = rdr.GetString(rdr.GetOrdinal("type"));
                    //string Release_Date = rdr.GetString(rdr.GetOrdinal("release_date"));


                
                    Page.FindControl("lblGameName");
                    Page.FindControl("LblDevTeam");
                    Page.FindControl("LblAgeLimit");
                    Page.FindControl("LblRating");
                    Page.FindControl("LblType");

                    lblGameName.InnerText = GameName;
                    LblDevTeam.InnerText = DevelopmentTeamEmail;
                    LblAgeLimit.InnerText = age_limit;
                    LblRating.InnerText = ratings;
                    LblType.InnerText = Type;


            }
        }

    }

   /* protected void abdo_Click(object sender, EventArgs e)
    {
        Response.Redirect("Topic");
    }
    */
   protected void Ratings(object sender, EventArgs e)
    {

        string graphics = txtGraphics.Value;
        int graphicsvalue = Int32.Parse(graphics);

        string interactivity = txtInteractivity.Value;
        int interactivityvalue= Int32.Parse(interactivity);

        string uniquness = txtUniquness.Value;
        int uniqunessvalue = Int32.Parse(uniquness);

        string levelDesign = txtLevelDesign.Value;
        int levelDesignValue = Int32.Parse(levelDesign);
    


        string connStr = ConfigurationManager.ConnectionStrings["Social_website_main"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("RatingsNew", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@name", "Assasins Creed"));
        cmd.Parameters.Add(new SqlParameter("@graphics", graphicsvalue));
        cmd.Parameters.Add(new SqlParameter("@interactivty", interactivityvalue));
        cmd.Parameters.Add(new SqlParameter("@uniquness", uniqunessvalue));
        cmd.Parameters.Add(new SqlParameter("@levelDesign", levelDesignValue));
        cmd.Parameters.Add(new SqlParameter("@email", "nazih@gmail"));

        conn.Open();
        cmd.ExecuteNonQuery();
        

       


    }



    }

