<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="RestaurantSystem.Meals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="container">
            <div class="mt-5">
                <h2 class="text-center">Meals</h2>
            </div>
            <div class="row g-3 mt-3">
                <div class="input-group col-12">
                    <input type="text" class="form-control" id="search-string" onkeyup="search()" placeholder="">
                    <button class="btn btn-outline-secondary" type="button" id="button-addon2">
                        <i class="bi bi-search me-2"></i>Search</button>
                </div>
            </div>
            <div class="mt-4">
                <div>
                    <asp:Table runat="server" ID="table" CssClass="table">
                        <asp:TableHeaderRow CssClass="table-light d-table-row">
                            <asp:TableCell>Name</asp:TableCell>
                            <asp:TableCell>Price</asp:TableCell>
                        </asp:TableHeaderRow>
                        <asp:TableRow>
                        </asp:TableRow>
                    </asp:Table>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CustomeScript" runat="server">
    <script>
        function search() {
            // Declare variables
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("search-string");
            filter = input.value.toUpperCase();
            table = document.getElementById("ContentPlaceHolder1_table");
            tr = table.getElementsByTagName("tr");

            // Loop through all table rows, and hide those who don't match the search query
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
</asp:Content>
