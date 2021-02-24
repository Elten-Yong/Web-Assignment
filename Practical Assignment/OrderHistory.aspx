<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="Practical_Assignment.OrderHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border:2px solid black;
        }

        .width1{
            width: 16%;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    <h2 style="text-align:center">Order History</h2><hr />
    <div style="width:75%; margin:0 auto auto auto; min-height:400px">
    <table class="auto-style1">
                <tr>
                    <th class="width1">
                        Order ID
                    </th>

                    <th class="width1">
                        Draw ID
                    </th>

                    <th class="width1">
                        Image
                    </th>
                    <th class="width1">
                        Name
                    </th>
                    <th class="width1">
                        Price
                    </th>
                    <th class="width1">
                        Date
                    </th>
                </tr>
            </table>
    <div style=" text-align:center">
        <asp:Label ID="Label3" runat="server" Text="" style="font-size:x-large;"></asp:Label></div>
    <asp:DataList runat="server" DataKeyField="OrderID" DataSourceID="SqlDataSource1"  OnItemDataBound="DataList1_ItemDataBound"  Height="16px" Width="100%">
        <ItemTemplate>     
            <br/>
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
        
        </ItemTemplate>

    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Order].OrderID, [Order].CustomerID, Gallery.DrawID, Gallery.Price, Gallery.Name, Gallery.Image, [Order].Date FROM [Order] INNER JOIN Gallery ON [Order].DrawID = Gallery.DrawID WHERE ([Order].CustomerID = @CustomerID)">
        <SelectParameters>
            <asp:SessionParameter Name="CustomerID" SessionField="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
        <br/>
        </div>
    
</asp:Content>
