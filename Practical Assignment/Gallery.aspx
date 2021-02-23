<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Practical_Assignment.Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    <link href="Gallery.css" rel="stylesheet" type="text/css" />
    
    
    <div style="width:1200px; margin:0 auto; border: 2px black;">
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" CellPadding="50" RepeatColumns="2" RepeatDirection="Horizontal" OnItemDataBound="DataList1_ItemDataBound" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                  
                <asp:Image ID="Image1" CssClass="Img" runat="server" ImageUrl='<%# Eval("Image") %>' />
                <br />
                Draw Name:<asp:Label ID="Label3" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                <br />
                Description:<asp:Label ID="Label1" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                <br />
                Price:<asp:Label ID="Label2" runat="server" Text='<%#Eval("Price") %>'></asp:Label>
                <br />
                <asp:Button CssClass="Button" ID="Button7" runat="server" Text="Buy" CommandName="BuyDrawing" CommandArgument='<%# Eval("DrawID") %>'/>&nbsp
                <asp:Button CssClass="Button" ID="Button15" runat="server" Text="Add to Wishlist" />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Gallery]"></asp:SqlDataSource>
    </div>
    
    
</asp:Content>
