<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="RestaurantSystem.Booking1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div>
            <div class="dflex nav nav-tabs" id="nav-tab" role="tablist">
                <button class="col-md-3 nav-link active" id="table-choise-tab" data-bs-toggle="tab"
                    data-bs-target="#table-choise" type="button" role="tab" aria-controls="table-choise"
                    aria-selected="true">
                    Table Choice</button>
                <button class="col-md-3 nav-link" id="meal-search-tab" data-bs-toggle="tab"
                    data-bs-target="#meal-search" type="button" role="tab" aria-controls="meal-search"
                    aria-selected="false">
                    Meal search</button>
                <button class="col-md-3 nav-link" id="booking-details-tab" data-bs-toggle="tab"
                    data-bs-target="#booking-details" type="button" role="tab" aria-controls="booking-details"
                    aria-selected="false">
                    Booking details</button>
                <button class="col-md-3 nav-link" id="payment-tab" data-bs-toggle="tab" data-bs-target="#payment"
                    type="button" role="tab" aria-controls="payment" aria-selected="false">
                    Paymet</button>
            </div>
        </div>
        <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active" id="table-choise" role="tabpanel" aria-labelledby="table-choise">
                <div class="container">
                    <div class="mt-5">
                        <h2 class="text-center">Choose table</h2>
                    </div>
                    <div class="row">
                        <asp:PlaceHolder ID="tables" runat="server"></asp:PlaceHolder>
                    </div>
                    <div class="row g-3 mt-3 w-50 mx-auto">
                        <div class="col-12 mt-5">
                            <div class="btn btn-primary w-100 next">Next</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="meal-search" role="tabpanel" aria-labelledby="meal-search">
                <div class="container">
                    <div class="mt-5">
                        <h2 class="text-center">Search for meals</h2>
                    </div>
                    <div class="row g-3 mt-3">
                        <div class="input-group col-12">
                            <input type="text" class="form-control" id="search-string" onkeyup="search()" placeholder="">
                            <button class="btn btn-outline-secondary" type="button" id="button-addon2">
                                <i class="bi bi-search me-2"></i>Search</button>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-6 right">
                            <div>
                                <asp:Table runat="server" ID="menu_table" CssClass="table">
                                    <asp:TableHeaderRow CssClass="table-light d-table-row">
                                        <asp:TableCell>Name</asp:TableCell>
                                        <asp:TableCell>Price</asp:TableCell>
                                    </asp:TableHeaderRow>
                                    <asp:TableRow>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                        </div>
                        <div class="col-md-6 right">
                            <div>
                                <asp:Table runat="server" ID="selection_table" CssClass="table">
                                    <asp:TableHeaderRow CssClass="table-light">
                                        <asp:TableCell>Name</asp:TableCell>
                                        <asp:TableCell>Price</asp:TableCell>
                                        <asp:TableCell>Quntity</asp:TableCell>
                                    </asp:TableHeaderRow>
                                    <asp:TableRow>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                        </div>
                    </div>
                    <div class="row g-3 mt-3 w-50 mx-auto">
                        <div class="col-6 mt-5">
                            <div class="btn btn-primary w-100 previous">Previous</div>
                        </div>
                        <div class="col-6 mt-5">
                            <div class="btn btn-primary w-100 next">Next</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="booking-details" role="tabpanel" aria-labelledby="booking-details">
                <div class="container">
                    <div class="mt-5">
                        <h2 class="text-center">Add booking details</h2>
                    </div>
                    <div class="row g-3 mt-3 w-50 mx-auto">
                        <div class="col-12">
                            <label for="details-full-name" class="form-label">Full name</label>
                            <asp:TextBox ID="deatails_full_name" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label for="details-date" class="form-label">Date</label>
                            <asp:TextBox ID="details_date" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label for="details-time" class="form-label">Time</label>
                            <asp:TextBox ID="details_time" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                        </div>
                        <div class="col-6">
                            <label for="details-contact-number" class="form-label">Contact number</label>
                            <asp:TextBox ID="details_contact_number" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                        </div>
                        <div class="col-6">
                            <label for="details-guests" class="form-label">Number of guests</label>
                            <asp:TextBox ID="details_guests" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                        </div>
                        <div class="col-6 mt-5">
                            <div class="btn btn-primary w-100 previous">Previous</div>
                        </div>
                        <div class="col-6 mt-5">
                            <div class="btn btn-primary w-100 next">Next</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="payment" role="tabpanel" aria-labelledby="payment">
                <div class="container">
                    <div class="mt-5">
                        <h2 class="text-center">Make payment</h2>
                    </div>
                    <div class="row g-3 mt-3 w-50 mx-auto">
                        <div class="col-12">
                            <label for="card-number" class="form-label">Card number</label>
                            <asp:TextBox ID="payment_card_number" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label for="expiry-date" class="form-label">Expiry date</label>
                            <asp:TextBox ID="payment_expiry_date" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label for="ccv" class="form-label">CCV</label>
                            <asp:TextBox ID="payment_ccv" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="col-12">
                            <label for="name" class="form-label">Card holder name</label>
                            <asp:TextBox ID="payment_name" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-6 mt-5">
                            <div class="btn btn-primary w-100 next">Previous</div>
                        </div>
                        <div class="col-6 mt-5">
                            <asp:LinkButton Text="Pay" CssClass="btn btn-primary w-100" OnClick="MakeBooking" runat="server" />
                        </div>
                    </div>
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
            table = document.getElementById("ContentPlaceHolder1_menu_table");
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

        $(".r-table").click(function () {
            var radio = $(this).find($("input"));
            radio.prop("checked", true);
        })

        $("#ContentPlaceHolder1_menu_table").find('tr').click(function () {
            var i = $(this).index()
            var row = $("#ContentPlaceHolder1_selection_table").find('tr').eq(i)

            row.removeClass("d-none")
        })

        $("#ContentPlaceHolder1_selection_table").find('tr').each(function () {
            var row = $(this);
            row.find('input').change(function () {
                if ($(this).val() < 1) row.addClass("d-none")
            })
        })

        $('.next').click(function () {
            $('.nav-link.active').next('button').trigger('click');
        });

        $('.previous').click(function () {
            $('.nav-link.active').prev('button').trigger('click');
        });

    </script>
</asp:Content>
