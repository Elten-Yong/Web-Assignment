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

    <asp:DataList ID="DataList1" runat="server" DataKeyField="OrderID" DataSourceID="SqlDataSource1" CssClass="auto-style1">
        <ItemTemplate>
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("OrderID") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("CustomerID") %>'></asp:Label>
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
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Customer.Username, Customer.Address, Customer.PhoneNumber, Customer.Email, [Order].OrderID, [Order].CustomerID, [Order].DrawID, [Order].Date, [Order].[Quantity] FROM [Order] INNER JOIN Customer ON [Order].CustomerID = Customer.CustomerID WHERE ([Order].DrawID = @DrawID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="DrawID" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
