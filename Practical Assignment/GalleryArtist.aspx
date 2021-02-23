<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="GalleryArtist.aspx.cs" Inherits="Practical_Assignment.GalleryArtist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .width1 {
            width: 60px;
        }
        .tablestyle1{
            margin-left: auto; 
            margin-right: auto;
            width: 50%;
            border: 2px black;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    <div style="width:600px; margin: 0 auto;">
        <asp:Label ID="Label1" runat="server" Text="" style="font-size: x-large;"></asp:Label>
    </div>
    <div style="margin-left: 25%; margin-right: 25%;">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
            <table class="table table-bordered" style="width: 900px;">
                <tr>
                    <td>
                        Draw ID
                    </td>
                    <td>
                        Name
                    </td>
                    <td>
                        Image
                    </td>
                    <td>
                        Description
                    </td>
                    <td>
                        Price
                    </td>
                    <td>
                        Edit
                    </td>
                    <td>
                        Delete
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="width1" ID="Label2" runat="server" Text='<%# Eval("DrawID") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label CssClass="width1" ID="Label3" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Image CssClass="width1" ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="75px" Width="100px"/>
                    </td>
                    <td>
                        <asp:Label CssClass="width1" ID="Label4" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label CssClass="width1" ID="Label5" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Button CssClass="width1" ID="Button1" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%# Eval("DrawID") %>'/>
                    </td>
                    <td>
                        <asp:Button CssClass="width1" ID="Button2" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("DrawID") %>' />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Gallery.DrawID, Gallery.Name, Gallery.Description, Gallery.Price, Gallery.Image, Gallery.ArtistID FROM Artist INNER JOIN Gallery ON Artist.ArtistID = Gallery.ArtistID WHERE (Gallery.ArtistID = @ArtistID) ">
        <SelectParameters>
            <asp:SessionParameter Name="ArtistID" SessionField="Value" />            
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
