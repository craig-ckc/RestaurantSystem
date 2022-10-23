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
    public partial class Reservations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string queryString = "SELECT * FROM Booking";

            using (OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString))
            {
                OleDbCommand command = new OleDbCommand(queryString, connection);
                connection.Open();
                OleDbDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    TableRow row = new TableRow();

                    TableCell ID = new TableCell();
                    TextBox IDBox = new TextBox();
                    IDBox.Text = reader["bookingID"].ToString();
                    IDBox.ID = "id";
                    ID.Controls.Add(IDBox);
                    ID.CssClass = "d-none";
                    row.Cells.Add(ID);

                    TableCell table = new TableCell();
                    table.Text = reader["tableID"].ToString();
                    row.Cells.Add(table);

                    TableCell date = new TableCell();

                    TextBox date_edit = new TextBox();
                    date_edit.TextMode = TextBoxMode.Date;
                    date_edit.CssClass = "d-none edit-view";

                    Label date_text = new Label();
                    date_text.Text = reader["bookingDate"].ToString();
                    date_text.CssClass = "main-view";

                    date.Controls.Add(date_edit);
                    date.Controls.Add(date_text);

                    row.Cells.Add(date);

                    TableCell time = new TableCell();

                    Label time_text = new Label();
                    time_text.Text = reader["bookingTime"].ToString();
                    time_text.CssClass = "main-view";

                    TextBox time_edit = new TextBox();
                    time_edit.TextMode = TextBoxMode.Time;
                    time_edit.CssClass = "d-none edit-view";

                    time.Controls.Add(time_edit);
                    time.Controls.Add(time_text);

                    row.Cells.Add(time);

                    TableCell seated = new TableCell();
                    seated.Text = reader["numberSeated"].ToString();
                    row.Cells.Add(seated);

                    TableCell confirmed = new TableCell();
                    CheckBox check = new CheckBox();
                    check.Checked = Boolean.Parse(reader["confirmed"].ToString());
                    row.Cells.Add(confirmed);

                    reservations.Rows.Add(row);
                }
                reader.Close();
            }
        }

        protected void Update(Object sender, EventArgs e)
        {
            string queryString = "UPDATE Booking SET bookingTime = '" +  time.Text + "', bookingDate = '" + date.Text + "' WHERE ID = " + id.Text ;

            using (OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString))
            {
                OleDbCommand command = new OleDbCommand(queryString, connection);
                connection.Open();

                command.ExecuteNonQuery();
            }
        }
    }
}