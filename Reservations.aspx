<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reservations.aspx.cs" Inherits="RestaurantSystem.Reservations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server" id="f1">

        <div class="container">
            <div class="mt-5">
                <h2 class="text-center">Reservations</h2>
            </div>

            <div class="mt-4">
                <div>
                    <asp:Table runat="server" ID="reservations" CssClass="table">
                        <asp:TableHeaderRow CssClass="table-light d-table-row">
                            <asp:TableCell>Table</asp:TableCell>
                            <asp:TableCell>Booking date</asp:TableCell>
                            <asp:TableCell>Booking time</asp:TableCell>
                            <asp:TableCell>Number seated</asp:TableCell>
                            <asp:TableCell>Confirmed</asp:TableCell>
                        </asp:TableHeaderRow>
                        <asp:TableRow>
                        </asp:TableRow>
                    </asp:Table>
                </div>
            </div>

            <asp:TextBox ID="id" runat="server" CssClass="d-none"></asp:TextBox>
            <asp:TextBox ID="date" runat="server" CssClass="d-none" TextMode="Date"></asp:TextBox>
            <asp:TextBox ID="time" runat="server" CssClass="d-none" TextMode="Time"></asp:TextBox>

            <div class="row g-3 mt-3 w-50 mx-auto">
                <div class="col-6 mt-5">
                    <div class="btn btn-primary w-100">Cancel</div>
                </div>
                <div class="col-6 mt-5">
                    <div class="btn btn-primary w-100 edit">Edit</div>
                </div>
                <div class="col-12 mt-2">
                    <asp:LinkButton Text="Update" CssClass="btn btn-primary w-100" OnClick="Update" runat="server" />
                </div>
            </div>

        </div>
    </form>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="CustomeScript" runat="server">
    <script>
        var index = 0;
        var editing = false;

        $(".edit-view").each(function () {
            $(this).val($(this).next().html())
        })

        $("#ContentPlaceHolder1_reservations").find('tr').click(function () {
            if (!editing) {
                $("ContentPlaceHolder1_id").val($(this).find("#ContentPlaceHolder1_id").val())
                index = $(this).index()
            }

            console.log(index)
            console.log(editing)
        })


        $(".edit").click(() => {
            var row = $("#ContentPlaceHolder1_reservations").find('tr').eq(index)
            row.find(".edit-view").toggleClass("d-none")
            row.find(".main-view").toggleClass("d-none")

            if (!editing) {
                $(".edit").text("Done");
                editing = true;
            } else {
                $(".edit").text("Edit");
                editing = false;
            }
        })

        $(".edit-view").change(() => {
            $(this).next().text($(this).val())

            var row = $("#ContentPlaceHolder1_reservations").find('tr').eq(index)

            $("ContentPlaceHolder1_date").next().text($("input[type=date]").val())
            $("ContentPlaceHolder1_time").next().text($("input[type=time]").val())
        })

    </script>
</asp:Content>

