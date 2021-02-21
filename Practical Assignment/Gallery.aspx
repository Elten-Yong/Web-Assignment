<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Practical_Assignment.Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    <link href="Gallery.css" rel="stylesheet" type="text/css" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [DrawID] FROM [Gallery]"></asp:SqlDataSource>
    <table style="width: 100%; text-align: center">
        <tr>
            <td>
                <asp:Image CssClass="Img" width="500px" height="250px" ID="Image1" runat="server" ImageUrl="~/Sample Images/20181126_125649.jpg" /></td>
            <td>
                <asp:Image CssClass="Img" width="500px" height="250px" ID="Image2" runat="server" ImageUrl="~/Sample Images/20190101_190842.jpg"/></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button CssClass="Button" ID="Button1" runat="server" Text="Buy" />&nbsp<asp:Button CssClass="Button" ID="Button9" runat="server" Text="Add to Wishlist" /></td>
            <td>
                <asp:Button CssClass="Button" ID="Button2" runat="server" Text="Buy" />&nbsp<asp:Button CssClass="Button" ID="Button10" runat="server" Text="Add to Wishlist" /></td>
        </tr>
        <tr>
            <td>
                <asp:Image CssClass="Img" width="500px" height="250px" ID="Image3" runat="server" ImageUrl="~/Sample Images/20190114_071118.jpg"/></td>
            <td>
                <asp:Image CssClass="Img" width="500px" height="250px" ID="Image4" runat="server" ImageUrl="~/Sample Images/20190123_222050.jpg"/></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button CssClass="Button" ID="Button3" runat="server" Text="Buy" />&nbsp<asp:Button CssClass="Button" ID="Button11" runat="server" Text="Add to Wishlist" /></td>
            <td>
                <asp:Button CssClass="Button" ID="Button4" runat="server" Text="Buy" />&nbsp<asp:Button CssClass="Button" ID="Button12" runat="server" Text="Add to Wishlist" /></td>
        </tr>
        <tr>
            <td>
                <asp:Image CssClass="Img" width="500px" height="250px" ID="Image5" runat="server" ImageUrl="~/Sample Images/20190204_134017.jpg"/></td>
            <td>
                <asp:Image CssClass="Img" width="500px" height="250px" ID="Image6" runat="server" ImageUrl="~/Sample Images/20190401_010521.jpg"/></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button CssClass="Button" ID="Button5" runat="server" Text="Buy" />&nbsp<asp:Button CssClass="Button" ID="Button13" runat="server" Text="Add to Wishlist" /></td>
            <td>
                <asp:Button CssClass="Button" ID="Button6" runat="server" Text="Buy" />&nbsp<asp:Button CssClass="Button" ID="Button14" runat="server" Text="Add to Wishlist" /></td>
        </tr>
        <tr>
            <td>
                <asp:Image CssClass="Img" width="500px" height="250px" ID="Image7" runat="server" ImageUrl="~/Sample Images/20190506_173737.jpg"/></td>
            <td>
                <asp:Image CssClass="Img" width="500px" height="250px" ID="Image8" runat="server" ImageUrl="~/Sample Images/20190617_192945.jpg"/></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button CssClass="Button" ID="Button7" runat="server" Text="Buy" />&nbsp<asp:Button CssClass="Button" ID="Button15" runat="server" Text="Add to Wishlist" /></td>
            <td>
                <asp:Button CssClass="Button" ID="Button8" runat="server" Text="Buy" />&nbsp<asp:Button CssClass="Button" ID="Button16" runat="server" Text="Add to Wishlist" /></td>
        </tr>
    </table>
</asp:Content>
