﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="Practical_Assignment.OrderHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border:2px solid black;
        }

        .width1{
            width: 16%;
        }
        .tableFormat {
            border-collapse: collapse;
            border: 1px solid grey;
            height: auto;
            width :700px;
            margin-left: auto;
            margin-right: auto;
            margin-bottom:200px;
            margin-top:100px;
            background-color: rgb(224, 226, 224);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    <h1 style="text-align:center">Order History</h1><hr />
    <% if (Session["Value"] == "0" || Session["Value"] == null)
          { %>
        <div style="height:400px">
            <table class="tableFormat">
                <tr>
                    <td class="auto-style">
                        <p style="text-align:center; font-size:x-large">Please log in to view your order history.</p>
                           </td>
                </tr>
                <tr>
                    <td class="auto-style">
                            &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align:center">
                          
                            <asp:Button ID="btnSignIn" runat="server" Text="Sign In" style="border-color: #4D94FF;
                            background-color: white; color: #284E98; font-size:x-large; text-align:center;" 
                            OnClick="btnSignIn_Click" Width="320px"/>
                
                    </td>
                </tr>
                <tr>
                    <td style="text-align:center">
                           &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align:center">
                           &nbsp;</td>
                </tr>
               
            </table>
            </div>

     <%}
         else{ %>
    <div style="width:75%; margin:0 auto; min-height:400px">
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
     <%} %>
</asp:Content>
