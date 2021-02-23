<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="GalleryArtist.aspx.cs" Inherits="Practical_Assignment.GalleryArtist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .width1 {
            width: 16%;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="width1">
                Draw ID
            </td>
            <td class="width1">
                Name
            </td>
            <td class="width1">
                Image
            </td>
            <td class="width1">
                Description
            </td>
            <td class="width1">
                Price
            </td>
            <td class="width1">
                Edit
            </td>
            <td class="width1">
                Delete
            </td>
        </tr>
    </table>
    <div style="width:600px; margin: 0 auto;">
        <asp:Label ID="Label1" runat="server" Text="" style="font-size: x-large;"></asp:Label>
    </div>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
            <table style="width: 100%;">
                <tr>
                    <td class="width1">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("DrawID") %>'></asp:Label>
                    </td>
                    <td class="width1">
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </td>
                    <td class="width1">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="75px" Width="100px"/>
                    </td>
                    <td class="width1">
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                    </td>
                    <td class="width1">
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                    </td>
                    <td class="width1">
                        <asp:Button ID="Button1" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%# Eval("DrawID") %>'/>
                    </td>
                    <td class="width1">
                        <asp:Button ID="Button2" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("DrawID") %>' />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Gallery.DrawID, Gallery.Name, Gallery.Description, Gallery.Price, Gallery.Image, Gallery.ArtistID FROM Artist INNER JOIN Gallery ON Artist.ArtistID = Gallery.ArtistID WHERE (Gallery.ArtistID = @ArtistID) ">
        <SelectParameters>
            <asp:SessionParameter Name="ArtistID" SessionField="Value" />            
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
