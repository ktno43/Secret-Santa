<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Survey.aspx.cs" Inherits="Secret_Santa.Survey" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        @font-face {
            font-family: 'St. Nicholas'; /*a name to be used later*/
            src: url(Fonts/stnicholas.ttf);
        }

        @font-face {
            font-family: 'The Perfect Christmas'; /*a name to be used later*/
            src: url(Fonts/perfectchristmas.ttf);
        }

        @font-face {
            font-family: 'Merry Christmas Flake'; /*a name to be used later*/
            src: url(Fonts/MerryChristmasFlake.ttf);
        }

        body {
            background-image: url('Images/christmas.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            height: 100%;
            background-attachment: fixed;
        }

        .content {
            position: absolute;
            left: 50%;
            top: 50%;
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            max-height: 700px;
            overflow-y: scroll;
            display: block;
        }

        .auto-style1 {
            font-family: "The Perfect Christmas";
            font-size: 90pt;
            text-align: center;
            height: 124px;
        }

        .auto-style3 {
            color: #FF0000;
        }

        .auto-style4 {
            font-size: 30pt;
            color: #006600;
        }

        .auto-style10 {
            text-align: right;
            height: 130px;
        }

        .auto-styleSignUp {
            font-family: "The Perfect Christmas";
        }

        .auto-secret {
            font-family: "The Perfect Christmas";
            font-size: 30pt;
        }

        .fixed_header tbody {
            display: block;
            overflow: auto;
            height: 650px;
            width: 100%;
        }

        .fixed_header thead tr {
            display: block;
        }

        .auto-style16 {
            height: 21px;
        }

        .auto-style38 {
            color: #006600;
            font-family: "The Perfect Christmas";
            font-size: 30pt;
        }

        .auto-style51 {
            text-align: center;
            height: 30px;
        }

        .auto-style52 {
            text-align: right;
            width: 500px;
            height: 108px;
        }

        .auto-style53 {
            text-align: right;
            height: 130px;
            width: 500px;
        }

        .auto-style55 {
            height: 108px;
            width: 268435520px;
        }

        .auto-style57 {
            font-family: "The Perfect Christmas";
            font-size: 25pt;
            text-align: right;
            height: 130px;
            width: 500px;
        }

        .auto-style58 {
            font-family: "The Perfect Christmas";
            font-size: 30pt;
            color: #006600;
            text-align: right;
            height: 130px;
            width: 500px;
        }

        .auto-style60 {
            font-family: "Merry Christmas Flake";
        }

        .auto-style61 {
            color: #996633;
        }

        .auto-style63 {
            color: #003300;
        }

        .auto-style64 {
            text-align: right;
            height: 108px;
        }

        .auto-style66 {
            font-family: "The Perfect Christmas";
            font-size: 30pt;
            color: #FF0000;
        }

        .auto-style67 {
            text-align: center;
            color: #FFFFFF;
            font-family: "The Perfect Christmas";
            font-size: 35pt;
            background-color: #FF0000;
            height: 49px;
        }

        .auto-style72 {
            height: 30px;
        }

        .auto-style73 {
            font-family: "The Perfect Christmas";
            font-size: 30pt;
            color: #006600;
            text-align: right;
            height: 30px;
            width: 500px;
        }

        .auto-style75 {
            height: 130px;
        }

        .auto-style76 {
            height: 130px;
            width: 268435520px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="content">
            <table>
                <tr>
                    <td colspan="6" class="auto-style1"><span class="auto-style60"><span class="auto-style63">1</span><span class="auto-style61">2</span></span><span class="auto-style3">Hi</span>&nbsp;<asp:Label ID="LabelFirstName" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                        <span class="auto-style60"><span class="auto-style61">0</span><span class="auto-style63">1</span></span></td>
                </tr>

                <tr>
                    <td colspan="6" class="auto-style67">Gift Exchange On Saturday 12/29/18 @ 10:30 P.M<br />
                        BJ&#39;s Restaurant 6424 Canoga Avenue Woodland Hills, CA 91367</td>
                </tr>

                <tr style="vertical-align: top">
                    <td colspan="1" class="auto-style73">Rules:&nbsp;</td>
                    <td colspan="2" class="auto-style72">
                        <span class="auto-style66">1.&nbsp; Minimum of $20 </span>
                        <br class="auto-style66" />
                        <span class="auto-style66">2.&nbsp; No Gift Cards</span><br />
                    </td>

                    <td colspan="3" class="auto-style51">

                        <asp:Button ID="ButtonSecretSanta" runat="server" Text="Find out your Secret Santa" ForeColor="White" CssClass="auto-styleSignUp" Font-Size="35pt" Width="350px" OnClick="ButtonSecretSanta_Click" BackColor="Blue" TabIndex="6" />

                    </td>
                </tr>


                <tr>
                    <td colspan="6" class="auto-style16"></td>
                </tr>
                <tr style="vertical-align: top">
                    <td colspan="1" class="auto-style58"><span class="auto-style38">&nbsp; </span>Your Favorite Color:&nbsp; </td>
                    <td colspan="2" class="auto-style75">
                        <asp:TextBox ID="TextBoxColor" runat="server" Height="25px" Width="225px" Style="resize: none" ForeColor="Red" TabIndex="1"></asp:TextBox>
                    </td>

                    <td colspan="1" class="auto-style53">
                        <asp:Label ID="LabelSecretSanta" runat="server" CssClass="auto-secret" ForeColor="#3333FF" Text="You're a Secret Santa For:" Visible="False"></asp:Label>
                        &nbsp;&nbsp;
                    </td>
                    <td colspan="2" class="auto-style76">
                        <asp:TextBox ID="TextBoxSecretSanta" runat="server" Height="25px" Width="225px" Style="resize: none" ReadOnly="True" ForeColor="#009933" Visible="False" TabIndex="7"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td colspan="6" class="auto-style16">&nbsp;</td>
                </tr>

                <tr style="vertical-align: top">
                    <td colspan="1" class="auto-style57"><span class="auto-style38">Your Shirt Size:&nbsp; </span></td>
                    <td colspan="2" class="auto-style75">
                        <asp:TextBox ID="TextBoxShirt" runat="server" Height="25px" Width="225px" Style="resize: none" ForeColor="Red" TabIndex="2"></asp:TextBox>
                    </td>

                    <td colspan="1" class="auto-style57">&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="LabelSecretColor" runat="server" CssClass="auto-secret" ForeColor="#3333FF" Text="Their Favorite Color:" Visible="False"></asp:Label>&nbsp;&nbsp;                  
                    </td>
                    <td colspan="2" class="auto-style76">
                        <asp:TextBox ID="TextBoxSecretColor" runat="server" Height="25px" Width="225px" Style="resize: none" ForeColor="#009933" ReadOnly="True" Visible="False" TabIndex="8"></asp:TextBox>
                    </td>

                </tr>

                <tr>
                    <td colspan="6" class="auto-style16"></td>
                </tr>

                <tr style="vertical-align: top">
                    <td colspan="1" class="auto-style58"><span class="auto-style4">Your Favorite Stores:&nbsp; </span></td>
                    <td colspan="2" class="auto-style75">
                        <asp:TextBox ID="TextBoxStores" runat="server" Height="100px" TextMode="MultiLine" Style="resize: none" Width="225px" ForeColor="Red" TabIndex="3"></asp:TextBox>
                    </td>

                    <td colspan="1" class="auto-style58">
                        <asp:Label ID="LabelSecretShirt" runat="server" CssClass="auto-secret" Font-Size="30pt" ForeColor="#3333FF" Text="Their Shirt Size:" Visible="False"></asp:Label>
                        &nbsp;
                    </td>
                    <td colspan="2" class="auto-style76">
                        <asp:TextBox ID="TextBoxSecretShirt" runat="server" Height="25px" Width="225px" ForeColor="#009933" ReadOnly="True" Visible="False" Style="resize: none" TabIndex="9"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td colspan="6" class="auto-style16"></td>
                </tr>
                <tr style="vertical-align: top">
                    <td colspan="1" class="auto-style58">Your Wishlist:&nbsp; </td>
                    <td colspan="2" class="auto-style10">
                        <asp:TextBox ID="TextBoxWishlist" runat="server" Height="100px" TextMode="MultiLine" Style="resize: none" Width="225px" ForeColor="Red" TabIndex="4"></asp:TextBox>
                    </td>
                    <td colspan="1" class="auto-style53" style="vertical-align: top">
                        <asp:Label ID="LabelSecretStore" runat="server" CssClass="auto-secret" ForeColor="#3333FF" Text="Their Favorite Stores:" Visible="False"></asp:Label>
                        &nbsp;
                    </td>
                    <td colspan="2" class="auto-style76">
                        <asp:TextBox ID="TextBoxSecretStore" runat="server" Height="100px" TextMode="MultiLine" Style="resize: none" Width="225px" ForeColor="#009933" ReadOnly="True" Visible="False" TabIndex="10"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" class="auto-style16"></td>
                </tr>
                <tr style="vertical-align: top">
                    <td colspan="3" class="auto-style64">&nbsp;&nbsp;
                        <asp:Button ID="ButtonSave" runat="server" Text="Save Answers" BackColor="#009933" CssClass="auto-styleSignUp" Font-Size="30pt" ForeColor="White" OnClick="ButtonSave_Click" Width="180px" TabIndex="5" />
                    </td>
                    <td colspan="1" class="auto-style52">
                        <asp:Label ID="LabelSecretWishlist" runat="server" CssClass="auto-secret" ForeColor="#3333FF" Text="Their Wishlist:" Visible="False"></asp:Label>
                        &nbsp;
                    </td>
                    <td colspan="2" class="auto-style55">
                        <asp:TextBox ID="TextBoxSecretWishlist" runat="server" Height="100px" TextMode="MultiLine" Style="resize: none" Width="225px" ForeColor="#009933" ReadOnly="True" Visible="False" TabIndex="11"></asp:TextBox>
                    </td>
                </tr>

            </table>
        </div>
    </form>
</body>
</html>
