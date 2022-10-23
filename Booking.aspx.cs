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
    public partial class Booking1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getMenu();

            getTables();
        }

        private void getTables()
        {
            string queryString = "SELECT * FROM Tables";

            using (OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString))
            {
                OleDbCommand command = new OleDbCommand(queryString, connection);
                connection.Open();
                OleDbDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    System.Web.UI.HtmlControls.HtmlGenericControl div = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    div.Attributes.Add("class", "r-table form-check col-md-4");

                    RadioButton radio = new RadioButton();
                    radio.GroupName = "table-choice";
                    radio.Attributes.Add("value", reader["tableID"].ToString());

                    System.Web.UI.HtmlControls.HtmlGenericControl label = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    label.Attributes.Add("class", "table-image");

                    Image image = new Image();
                    image.ImageUrl = getImageURL(int.Parse(reader["numSeated"].ToString()));

                    label.Controls.Add(image);

                    div.Controls.Add(radio);
                    div.Controls.Add(label);

                    tables.Controls.Add(div);
                }
            }
        }
        private String getImageURL(int num)
        {
            if (num == 6)
                return "Images/six.png";
            else if (num == 4)
                return "Images/four.png";
            else
                return "Images/two.png";
        }

        private void getMenu()
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

                    menu_table.Rows.Add(row);

                    TableRow row_ = new TableRow();

                    TableCell name_ = new TableCell();
                    name_.Text = reader["mealName"].ToString();
                    row_.Cells.Add(name_);

                    TableCell price_ = new TableCell();
                    price_.Text = reader["mealPrice"].ToString();
                    row_.Cells.Add(price_);

                    TableCell quntity_ = new TableCell();

                    TextBox txtE = new TextBox();
                    txtE.ID = "" + reader["mealName"].ToString();
                    txtE.Visible = true;
                    txtE.Text = "1";
                    txtE.TextMode = TextBoxMode.Number;
                    txtE.Attributes.Add("min", "0");

                    quntity_.Controls.Add(txtE);
                    row_.Cells.Add(quntity_);
                    row_.CssClass = "d-none";

                    selection_table.Rows.Add(row_);
                }
                reader.Close();
            }
        }
    
        protected void MakeBooking(Object sender, EventArgs e)
        {
            string table = Request.Form["table-choice"].ToString();



            string full_name = deatails_full_name.Text;
            string date = details_date.Text;
            string time = details_time.Text;
            string contact = details_contact_number.Text;
            string guests = details_guests.Text;

            string card_number = payment_card_number.Text;
            string expiry_date = payment_expiry_date.Text;
            string ccv = payment_ccv.Text;
            string name = payment_name.Text;

        }
    }
}