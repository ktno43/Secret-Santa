<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Secret_Santa.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style type="text/css">
        @font-face {
            font-family: 'St. Nicholas'; /*a name to be used later*/
            src: url(Fonts/stnicholas.ttf);

        }

        .auto-style1 {
            text-align: center;
            color: #FFFFFF;
            font-size: 50pt;
            font-family: "St. Nicholas";
        }

        body {
            background-image: url('Images/skull.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            height: 100%;
            background-attachment: fixed;
        }

        .auto-style3 {
            font-family: "St. Nicholas";
            color: #FF0000;
            text-align: center;
            font-size: xx-large;
        }

        .auto-style4 {
            color: #FFFFFF;
            text-align: left;
        }

        .auto-style5 {
            color: #FFFFFF;
            height: 30px;
            text-align: left;
        }

        .auto-style6 {
            height: 30px;
        }

        .auto-style7 {
            margin-bottom: 0px;
        }

        .auto-style8 {
            color: #339933;
            font-family: "St. Nicholas";
            font-size: medium;
        }

        .auto-style9 {
            height: 30px;
            text-align: center;
        }

        .auto-style10 {
            width: 205px;
        }

        .content {
            position: absolute;
            left: 50%;
            top: 50%;
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }

        .auto-styleSignUp {
            font-family: "St. Nicholas";
        }
    </style>
</head>

<body>
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <form id="form1" runat="server">
        <div class="container">
            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Sign Up for Daiso's Secret Santa 2018</h4>
                        </div>

                        <div class="modal-body">
                            Username:&nbsp; &nbsp;
                            <asp:TextBox ID="TextBoxModalUser" Width="100px" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            Password:&nbsp; &nbsp; &nbsp;<asp:TextBox ID="TextBoxModalPass" Width="100px" runat="server" TextMode="Password"></asp:TextBox>
                            <br />
                            <br />
                            First Name:&nbsp; &nbsp;<asp:TextBox ID="TextBoxModalFirst" Width="100px" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            Last Name:&nbsp; &nbsp;<asp:TextBox ID="TextBoxModalLast" Width="100px" runat="server"></asp:TextBox>
                            <br />
                            <br />
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <asp:Button ID="ButtonModalSignUp" runat="server" Text="Sign Up" CssClass="btn btn-default" OnClick="ButtonModalSignUp_Click" UseSubmitBehavior="false" data-dismiss="modal" />
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="content">
            <table>
                <tr>
                    <td colspan="3" class="auto-style1"><strong>Welcome to Kyle's Dark Web. . .</strong></td>
                </tr>
                <tr>
                    <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8"><em><strong>Already registered?</strong></em></td>
                    <td class="auto-style3"><em>&quot;Who&#39;s your Secret Santa?&quot;</em></td>
                    <td></td>
                </tr>

                <tr>
                    <td class="auto-style5" rowspan="2">Username:&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBoxUser" runat="server" Width="100px" ForeColor="Black"></asp:TextBox>
                        <br />
                        <br />
                        Password:&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBoxPass" runat="server" TextMode="Password" CssClass="auto-style7" Width="100px" ForeColor="Black"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Label ID="LabelLoginMsg" runat="server" Font-Size="15pt" ForeColor="Red" Text="[Login Msg]" Visible="False" Font-Bold="True"></asp:Label>
                    </td>
                    <td rowspan="3" class="auto-style9">
                        <img src="Images/crystal.gif" alt="crystal ball gif" height="200" class="auto-style10" />
                    </td>
                    <td class="auto-style6"></td>
                </tr>


                <tr>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td colspan="1">
                        <asp:Button ID="ButtonLogin" runat="server" Text="Login" OnClick="ButtonLogin_Click" CssClass="auto-styleSignUp" Font-Bold="True" Font-Size="20px" ForeColor="Red" Height="30px" Width="60px" />
                    </td>
                    <td colspan="1">
                        <asp:LinkButton ID="LinkButtonSignUp" runat="server" data-toggle="modal" data-target="#myModal" OnClientClick="return false;" Font-Size="18pt" ForeColor="#339933" CssClass="auto-styleSignUp">Sign Up</asp:LinkButton>
                    </td>
                </tr>

            </table>
        </div>
    </form>
</body>
</html>
