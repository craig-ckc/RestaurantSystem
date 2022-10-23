using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RestaurantSystem
{
    public partial class Meals : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string queryString = "SELECT mealName, mealPrice FROM Meal";

            using (OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString))
            {
                OleDbCommand command = new OleDbCommand(queryString, connection);
                connection.Open();
                OleDbDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    TableRow row = new TableRow();
                    TableCell name = new TableCell();

                    name.Text = reader["mealName"].ToString();
                    row.Cells.Add(name);

                    TableCell price = new TableCell();
                    price.Text = reader["mealPrice"].ToString();
                    row.Cells.Add(price);

                    table.Rows.Add(row);
                }
                reader.Close();
            }
        }
    }
}