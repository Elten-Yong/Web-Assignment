<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="Practical_Assignment.Wishlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 88px;
        }
        .auto-style3 {
            width: 76px;
        }
        .auto-style4 {
            width: 84px;
        }
        .auto-style5 {
            width: 876px;
            height: 346px;
        }
        .auto-style6 {
            width: 114px;
        }
        .auto-style7 {
            width: 166px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">

    <div style="margin:0 auto;" class="auto-style5">
    
        <asp:DataList ID="DataList1" runat="server" DataKeyField="CustomerID" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound" OnItemCommand="DataList1_ItemCommand" Height="16px" Width="672px">
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">
                            
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("DrawID") %>'></asp:Label>
                        </td>
                        <td class="auto-style3">
                            
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </td>
                        <td class="auto-style4">
                            
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="100px" Width="100px" />
                        </td>
                        <td class="auto-style6">
                            
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                        </td>
                        <td class="auto-style7">
                            
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("DrawID") %>'/>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Gallery.Name, Gallery.Price, Gallery.Description, WishlistGallery.CustomerID, WishlistGallery.DrawID, Gallery.Image FROM WishlistGallery INNER JOIN Gallery ON WishlistGallery.DrawID = Gallery.DrawID WHERE (WishlistGallery.CustomerID = @CustomerID)">
            <SelectParameters>
                <asp:SessionParameter Name="CustomerID" SessionField="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>