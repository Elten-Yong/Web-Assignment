<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="GalleryArtist.aspx.cs" Inherits="Practical_Assignment.GalleryArtist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .width1 {
            width: 120px;
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
    <h1 style="text-align:center;">Manage Art</h1>
    <hr />
    <div style="text-align: center">
        <asp:Label ID="Label1" runat="server" Text="" style="font-size: x-large;"></asp:Label>   
    </div>
    <div style="margin-left: 8%; margin-right: 8%;">
         
         <table class="table table-bordered" style="width: 100%; background-color: darkgray">
                <tr>
                    <th Class="width1">
                        Draw ID
                    </th>
                    <th Class="width1"> 
                        Name
                    </th>
                    <th Class="width1"> 
                        Category
                    </th>
                    <th Class="width1">
                        Image
                    </th>
                    <th Class="width1">
                        Description
                    </th>
                    <th class="width1">
                        Quantity
                    </th>
                    <th Class="width1">
                        Price
                    </th>
                    <th Class="width1">
                        Edit
                    </th>
                    <th Class="width1">
                        Delete
                    </th>
                </tr>
             </table>

    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
            <table class="table table-bordered" style="width: 100%; background-color: lightgray" >
                
                <tr>
                    <td Class="width1">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("DrawID") %>'></asp:Label>
                    </td>
                    <td Class="width1">
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </td>
                    <td Class="width1">
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("Category") %>'></asp:Label>
                    </td>
                    <td Class="width1">
                        <%--<asp:Image CssClass="width1" ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="75px" Width="100px"/>--%>
                        <asp:ImageButton ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="75px" Width="100px" CommandName="ClickImage" CommandArgument='<%# Eval("DrawID") %>'/>
                    </td>
                    <td Class="width1">
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                    </td>
                    <td Class="width1">
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("Total") %>'></asp:Label>
                    </td>
                    <td Class="width1">
                        <asp:Label ID="Label5" runat="server" Text='<%# String.Format("{0:0.00}", Eval("Price")) %>'></asp:Label>
                    </td>
                    <td Class="width1">
                        
                        <asp:Button ID="Button1" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%# Eval("DrawID") %>'/>
                    </td>
                    <td Class="width1">
                        <asp:Button ID="Button2" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("DrawID") %>' />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Gallery.DrawID, Gallery.Name, Gallery.Description, Gallery.Total, Gallery.Price, Gallery.Image, Gallery.ArtistID, Gallery.Category FROM Artist INNER JOIN Gallery ON Artist.ArtistID = Gallery.ArtistID WHERE (Gallery.ArtistID = @ArtistID)">
        <SelectParameters>
            <asp:SessionParameter Name="ArtistID" SessionField="Value" />            
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
