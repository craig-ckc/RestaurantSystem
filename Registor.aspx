<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registor.aspx.cs" Inherits="RestaurantSystem.Registor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <form runat="server">
            <div class="row overflow-hidden ">
                <!-- Card 1 -->
                <input type="checkbox" id="card" disabled="true" />
                <label class="card-container mt-5 mx-auto w-50" for="card-1">
                    <div class="card-flip">
                        <!-- Card 1 Front -->
                        <div class="card front">
                            <div class="row g-3 card-body">
                                <div class="col-12">
                                    <label for="registration-name" class="form-label">First name</label>
                                    <asp:TextBox ID="registration_name" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-12">
                                    <label for="registration-surname" class="form-label">Surname</label>
                                    <asp:TextBox ID="registration_surname" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-12">
                                    <label for="registration-emial" class="form-label">Email</label>
                                    <asp:TextBox ID="registration_email" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label for="registration-date" class="form-label">DOB</label>
                                    <asp:TextBox ID="registration_date" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label for="registration-username" class="form-label">Username</label>
                                    <asp:TextBox ID="registration_username" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-12">
                                    <label for="registration-password" class="form-label">Password</label>
                                    <asp:TextBox ID="registration_password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                </div>

                                <div class="col-md-12 mt-5">
                                    <asp:LinkButton Text="Register" CssClass="btn btn-primary w-100" OnClick="Register" runat="server" />
                                </div>
                                <div class="border-top mt-4 padding-top-md flip-trigger">
                                    <div class="btn btn-outline-secondary btn-sm w-100">Log in here</div>
                                </div>
                            </div>

                        </div>
                        <!-- End Card 1 Front -->

                        <!-- Card 1 Back -->
                        <div class="card back">
                            <div class="row g-3 card-body">
                                <div class="col-md-12">
                                    <label for="log-in-emial" class="form-label">Email</label>
                                    <asp:TextBox ID="log_in_emial" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-12">
                                    <label for="log-in-password" class="form-label">Password</label>
                                    <asp:TextBox ID="log_in_password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-12 mt-5">
                                    <asp:LinkButton Text="Log in" CssClass="btn btn-primary w-100" OnClick="LogIn" runat="server" />
                                </div>
                                <div class="border-top mt-5 padding-top-md flip-trigger">
                                    <div class="btn btn-outline-secondary btn-sm w-100">Registor here</div>
                                </div>
                            </div>
                        </div>
                        <!-- End Card 1 Back -->
                    </div>
                </label>
                <!-- End Card 1 -->
            </div>
        </form>
    </div>
</asp:Content>

<asp:Content ID="CustomeScriptContent" ContentPlaceHolderID="CustomeScript" runat="server">
    <script>
        $(".flip-trigger").click(() => {
            var checkBoxes = $("#card");
            checkBoxes.prop("checked", !checkBoxes.prop("checked"));
        })
    </script>
</asp:Content>
