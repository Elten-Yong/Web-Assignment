<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CustomerArtManagement.aspx.cs" Inherits="Practical_Assignment.CustomerArtManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            margin-right: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server" >
    <h1 style="text-align: center">Order management</h1><hr/>
    
    <div style="width:75%; margin:0 auto; min-height:400px">
    <table class="table table-bordered" style="width: 100%;">
                <tr>
                    <td>
                        Order ID
                    </td>
                    <td>
                        Name
                    </td>
                    <td>
                        Email
                    </td>
                    <td>
                        Buying Date
                    </td>
                    <td>
                        Delivery Address
                    </td>
                    <td>                       
                        Contact No                    
                    </td>
                    <td>                                                  
                        Quantity
                    </td>
                    <td>                                                  
                        Price
                    </td>
                </tr>
            </table>

        <div style=" text-align:center">
            <asp:Label ID="Label3" runat="server" Text="" style="font-size:x-large;"></asp:Label>
        </div>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="OrderID" DataSourceID="SqlDataSource1" CssClass="auto-style1">
        <ItemTemplate>
            <table class="table table-bordered" style="width: 100%;">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("OrderID") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("Date", "{0:G}") %>'></asp:Label></td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                    </td>
                    <td>                       
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("PhoneNumber") %>'></asp:Label>                       
                    </td>
                    <td>                                                  
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                    </td>
                    <td>                                                  
                        <asp:Label ID="Label9" runat="server" Text='<%# String.Format("RM {0:0.00}",Eval("Price")) %>'></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Customer.Username, Customer.Address, Customer.PhoneNumber, Customer.Email, [Order].CustomerID, [Order].Date, OrderDetails.DrawID, OrderDetails.OrderID, OrderDetails.Quantity, OrderDetails.Price FROM [Order] INNER JOIN Customer ON [Order].CustomerID = Customer.CustomerID INNER JOIN OrderDetails ON [Order].OrderID = OrderDetails.OrderID WHERE (OrderDetails.DrawID = @DrawID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="DrawID" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
</asp:Content>
