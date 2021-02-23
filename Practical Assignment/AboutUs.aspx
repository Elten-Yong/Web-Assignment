<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Practical_Assignment.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 264px;
        }
        .auto-style4 {
            width: 70%;
            height: 308px;
            margin:0px auto;
            background-color:rgba(255,255,255,0.7);
        }
        .auto-style5 {
            width: 350px;
            text-align:left;
        }
        .auto-style6 {
            width: 388px;
        }
        .auto-style8 {
            width: 388px;
            height: 32px;
        }
        .auto-style10 {
            height: 32px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">

 <h1 style="text-align:center;margin-right:5%">About Us</h1><hr />  
    <table class="auto-style4">
        <tr>
            <td class="auto-style3">  

            <asp:HyperLink NavigateUrl="~/HomePage.aspx" ID="Logo" runat="server" ImageUrl="~/Sample Images/Alzenda_Logo.png" Style="margin-left: 3%;"  />

            </td>
            <td style="font-size:large">Alzenda Artwork Sales Gallery&#39;s objective is to provide artist a platform to
                <br />
                share and sell their art work to promote their artworks or provide a platform<br />
                for artist to have extra income. The gallery allows artist to post their artwork,<br />
                manage their artwork and also view their art work.<br />
                <br />
                Besides that, it is also a platform for art lovers to explore their desired artwork.<br />
                Art lovers can add their desired artwork in the wishlist as well as the cart for them<br />
                to store their desired art for further references. Art can lovers browse the art through
                <br />
                gallery page and select their favourite art to purchase.<br />
            </td>
        </tr>
        </table><br /><br /><br />

    <table style="width: 100%; margin-left: 4%">
        <tr>
            <td class="auto-style6"><h3>Contact Number</h3><hr class="auto-style5" /></td>
            <td class="auto-style6"><h3>Email Address</h3><hr class="auto-style5" /></td>
            <td class="auto-style6"><h3>Donate Us</h3><hr class="auto-style5" /></td>
        </tr>
        <tr>
            <td class="auto-style8">Lee Xian Xian : 012-556 4070</td>
            <td class="auto-style8"><span style="color: rgb(95, 99, 104); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: 0.2px; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(241, 243, 244); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">leejx-wp18@student.tarc.edu.my</span></td>
            <td class="auto-style8">Ali Bank : 8473637491</td>
        </tr>
        <tr>
            <td class="auto-style6">Yong Wei Yan : 019-558 9809</td>
            <td class="auto-style6"><span style="color: rgb(95, 99, 104); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: 0.2px; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(241, 243, 244); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">yongwh-wp18@student.tarc.edu.my</span></td>
            <td class="auto-style6">Abu Bank: 6374939387</td>
        </tr>
        <tr>
            <td class="auto-style8">Tang Tang. JS&nbsp; : 012-540 9116</td>
            <td class="auto-style8"><span style="color: rgb(95, 99, 104); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: 0.2px; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(241, 243, 244); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">tangsw-wp18@student.tarc.edu.my</span></td>
            <td class="auto-style10"></td>
        </tr>
        <tr>
            <td class="auto-style6">Wonder Ng TK: 016-587 8717</td>
            <td class="auto-style6"><span style="color: rgb(95, 99, 104); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: 0.2px; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(241, 243, 244); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">ngtk-wp18@student.tarc.edu.my</span></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">Tee Joo Hong&nbsp;&nbsp; :012-23451111</td>
            <td class="auto-style6"><span style="color: rgb(95, 99, 104); font-family: Roboto, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: 0.2px; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(241, 243, 244); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">teejh-wp18@student.tarc.edu.my</span></td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    </asp:Content>
