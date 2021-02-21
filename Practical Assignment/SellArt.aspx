<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SellArt.aspx.cs" Inherits="Practical_Assignment.SellArt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 29px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    
            <p><b><u>Welcome to XXX, Please upload your Art to be sold.</u></b></p>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
    <table>

        <tr>
            <td>Art name : </td>
            <td>
                <asp:TextBox ID="ArtName" runat="server" Width="267px"></asp:TextBox></td>
        </tr>   

        <tr>
            <td>
                Art Description :
            </td>
            <td>
                <asp:TextBox runat="server" ID="ArtDescription" TextMode="Multiline" Columns="20" Name="S1" Rows="2" Height="98px" Width="271px" style="resize:none;"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                Price :
            </td>
            <td>
                <asp:TextBox ID="Price" runat="server" Width="265px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                Total Art :
            </td>
            <td class="auto-style2">
                <asp:DropDownList ID="TotalArt" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td>Art Drawing :</td>
            <td>
                <asp:FileUpload ID="Drawing" runat="server" /></td>
        </tr>
        </table>
    <br />
            &nbsp;
         <asp:Button ID="Cancel" runat="server" Text="Cancel" Width="140px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" Width="139px" />
           
    

</asp:Content>
