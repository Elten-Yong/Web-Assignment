<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SellArt.aspx.cs" Inherits="Practical_Assignment.SellArt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 271px;
            height: 121px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    
            <p><b><u>Welcome to XXX, Please upload your Art to be sold.</u></b></p>
            <br />

    <table>
        

        <tr>
            <td>Art name&nbsp;&nbsp; : </td>
            <td>
                <asp:TextBox ID="ArtName" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>
                Art Description&nbsp;&nbsp; :
            </td>
            <td>
                <textarea id="ArtDesciption" class="auto-style1"></textarea>
            </td>
        </tr>
        <tr>
            <td>
                Price :
            </td>
            <td>
                <asp:TextBox ID="Price" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Total Art:
            </td>
            <td>
                <asp:DropDownList ID="TotalArt" runat="server"></asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td>Art Drawing :</td>
            <td>
                <asp:FileUpload ID="Drawing" runat="server" /></td>
        </tr>

        <tr>
            <td>
                <asp:Button ID="Cancel" runat="server" Text="Cancel" />
            </td>
            <td>
                <asp:Button ID="Submit" runat="server" Text="Submit" />
            </td>
        </tr>
    </table>

</asp:Content>
