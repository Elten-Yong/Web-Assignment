<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Practical_Assignment.Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    <link href="Gallery.css" rel="stylesheet" type="text/css" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [DrawID] FROM [Gallery]"></asp:SqlDataSource>
    <table style="width: 100%; text-align: center">
        <tr>
            <td>
                <asp:Image ID="Image1" runat="server" /></td>
            <td>
                <asp:Image ID="Image2" runat="server" /></td>
        </tr>
        <tr>
            <td>
                <asp:Button CssClass="Button" ID="Button1" runat="server" Text="Button" /></td>
            <td>
                <asp:Button CssClass="Button" ID="Button2" runat="server" Text="Button" /></td>
        </tr>
        <tr>
            <td>
                <asp:Image ID="Image3" runat="server" /></td>
            <td>
                <asp:Image ID="Image4" runat="server" /></td>
        </tr>
        <tr>
            <td>
                <asp:Button CssClass="Button" ID="Button3" runat="server" Text="Button" /></td>
            <td>
                <asp:Button CssClass="Button" ID="Button4" runat="server" Text="Button" /></td>
        </tr>
        <tr>
            <td>
                <asp:Image ID="Image5" runat="server" /></td>
            <td>
                <asp:Image ID="Image6" runat="server" /></td>
        </tr>
        <tr>
            <td>
                <asp:Button CssClass="Button" ID="Button5" runat="server" Text="Button" /></td>
            <td>
                <asp:Button CssClass="Button" ID="Button6" runat="server" Text="Button" /></td>
        </tr>
        <tr>
            <td>
                <asp:Image ID="Image7" runat="server" /></td>
            <td>
                <asp:Image ID="Image8" runat="server" /></td>
        </tr>
        <tr>
            <td>
                <asp:Button CssClass="Button" ID="Button7" runat="server" Text="Button" /></td>
            <td>
                <asp:Button CssClass="Button" ID="Button8" runat="server" Text="Button" /></td>
        </tr>
    </table>
</asp:Content>
