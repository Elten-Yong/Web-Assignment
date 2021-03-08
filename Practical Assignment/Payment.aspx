<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Practical_Assignment.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .width1 {
            width: 20%;
        }
      
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">

    <p>
        Delivery Address</p>
    
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

    <table class="auto-style1">
                <tr>
                    <td class="width1" style="font-weight: bold">
                        Draw ID
                    </td>

                    <td class="width1" style="font-weight: bold">
                        Image
                    </td>

                    <td class="width1" style="font-weight: bold">
                        Name
                    </td>
                    <td class="width1" style="font-weight: bold">
                        Price
                    </td>
                    <td class="width1" style="font-weight: bold">
                        Customer ID
                    </td>
                    <td class="width1" style="font-weight: bold">
                        Buy
                    </td>
                    <td class="width1" style="font-weight: bold">
                        Delete
                    </td>
                 </tr>
          </table>

    <asp:DataList ID="DataList1" runat="server"  DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound" Width="100%">
        <ItemTemplate>
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:Label class="width1" ID="Label2" runat="server" Text='<%# Eval("DrawID") %>'></asp:Label>
                    </td>

                    <td>
                        <asp:Label class="width1" ID="Label3" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </td>

                    <td>
                        <asp:Image class="width1" ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="100px" Width="100px"/>
                    </td>

                    <td>
                        <asp:Label class="width1" ID="Label6" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                    </td>

                    <td>
                        <asp:Label class="width1" ID="Label5" runat="server" Text='<%# Eval("TotalPrice") %>'></asp:Label>

                    </td>
                </tr>
            </table>

        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT CheckOut.DrawID, CheckOut.Quantity, CheckOut.TotalPrice, Gallery.Image, Gallery.Name, Gallery.Price FROM CheckOut INNER JOIN Gallery ON CheckOut.DrawID = Gallery.DrawID"></asp:SqlDataSource>

    <asp:Button ID="btnConfirm" runat="server" Text="Confirm Purchase" OnClick="btnConfirm_Click" />

</asp:Content>
