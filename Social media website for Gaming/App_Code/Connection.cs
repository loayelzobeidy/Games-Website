using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for Connection
/// </summary>
public class Connection
{
    public Connection()
    {
        string connStr = ConfigurationManager.ConnectionStrings["Social_website_main"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
    }
}