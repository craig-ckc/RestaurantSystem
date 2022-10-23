using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RestaurantSystem
{
    public partial class Registor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register(object sender, EventArgs e)
        {
            int status = 0;

            OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);
            
            connection.Open();
            
            string sql = "INSERT INTO Customer ([customerFname],[customerLname],[customerDOB],[customerEmail],[customerUsername],[customerPassword]) " + "VALUES (?,?,?,?,?,?);";
            OleDbCommand command = new OleDbCommand(sql, connection);
            command.Parameters.AddWithValue("@customerFname", registration_name.Text);
            command.Parameters.AddWithValue("@customerLname", registration_surname.Text);
            command.Parameters.AddWithValue("@customerDOB", DateTime.Parse(registration_date.Text));
            command.Parameters.AddWithValue("@customerEmail", registration_email.Text);
            command.Parameters.AddWithValue("@customerUsername", registration_username.Text);
            command.Parameters.AddWithValue("@customerPassword", registration_password.Text);
            try
            {
                status = command.ExecuteNonQuery();
                connection.Close();
                if (status > 0)
                {
                    //LblFeedback.Text = "INSERT Command Executed Successfully!";
                    Response.Redirect("~/Home.aspx");
                }
                else { }
                    //LblFeedback.Text = "INSERT Command Failed!";
            }
            catch (Exception ex)
            {
                //LblFeedback.Text = ex.ToString();
            }
        }

        protected void LogIn(Object sender, EventArgs e)
        {
            string queryString = "SELECT customerEmail, customerPassword FROM Customer";

            using (OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString))
            {
                OleDbCommand command = new OleDbCommand(queryString, connection);
                connection.Open();
                OleDbDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    if(reader.GetString(0).Equals(log_in_emial.Text) && reader.GetString(1).Equals(log_in_password.Text))
                    {
                        Response.Redirect("~/Home.aspx");
                    }
                    else
                    {

                    }
                }
                reader.Close();
            }
        }
    }
}