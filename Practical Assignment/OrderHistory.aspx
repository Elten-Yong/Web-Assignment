<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="Practical_Assignment.OrderHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .width1{
            width: 16%;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    <table class="auto-style1">
                <tr>
                    <td class="width1">
                        Order ID
                    </td>

                    <td class="width1">
                        Draw ID
                    </td>

                    <td class="width1">
                        Image
                    </td>
                    <td class="width1">
                        Name
                    </td>
                    <td class="width1">
                        Price
                    </td>
                    <td class="width1">
                        Date
                    </td>
                </tr>
            </table>
    <div style=" text-align:center">
        <asp:Label ID="Label3" runat="server" Text="" style="font-size:x-large;"></asp:Label></div>
    <asp:DataList runat="server" DataKeyField="OrderID" DataSourceID="SqlDataSource1"  OnItemDataBound="DataList1_ItemDataBound"  Height="16px" Width="100%">
        <ItemTemplate>
            <br />

            <table class="auto-style1">
                <tr>
                    <td class="width1">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("OrderID") %>'></asp:Label>
                    </td>
                    <td class="width1">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("DrawID") %>'></asp:Label>
                    </td>
                    <td class="width1">
                        <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("Image") %>' Width="100px" />
                    </td>
                    <td class="width1">
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </td>
                    <td class="width1">
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                    </td>
                    <td class="width1">
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                    </td>
                </tr>
            </table>
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Order].OrderID, [Order].CustomerID, Gallery.DrawID, Gallery.Price, Gallery.Name, Gallery.Image, [Order].Date FROM [Order] INNER JOIN Gallery ON [Order].DrawID = Gallery.DrawID WHERE ([Order].CustomerID = @CustomerID)">
        <SelectParameters>
            <asp:SessionParameter Name="CustomerID" SessionField="Value" />
        </SelectParameters>
    </asp:SqlDataSource>

    
</asp:Content>
