<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Practical_Assignment.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
  
    <style type="text/css">
        
        
        .tableFormat {
            border-collapse: collapse;
            border: 2px solid black;
            height: auto;
            width :700px;
            margin-left: auto;
            margin-right: auto;
            margin-bottom:200px;
            margin-top:100px;
            background-color: rgb(224, 226, 224);

            
        }

        .auto-style {
            padding-top:20px;
            height: 25px;
            
        }

        .auto-style1 {
            width: 100%;
            border: 2px solid black;

        }
        .width1 {
            width: 16%;
        }

        </style>
        

            <h1 style="text-align:center">Cart</h1><hr />
        
        <div style="width:75%; margin:0 auto; min-height:400px">
        <% if (Session["Value"] == "0" || Session["Value"] == null)
          { %>
            <div style="height:400px">
            <table class="tableFormat">
                <tr>
                    <td class="auto-style">
                        <p style="text-align:center; font-size:x-large">Please log in to view your cart.</p>
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
        <div style=" text-align:center">
            <asp:Label ID="Label3" runat="server" Text="" style="font-size:x-large;"></asp:Label>
        </div>
          
        <asp:DataList ID="DataList1" runat="server" DataKeyField="CustomerID" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound" OnItemCommand="DataList1_ItemCommand" Height="16px" Width="100%">
            <ItemTemplate>
                <br/>
                <table class="auto-style1">
                    <tr>
                        <td class="width1">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("DrawID") %>'></asp:Label>
                        </td>
                        <td class="width1">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="100px" Width="100px"/> 
                        </td>
                        <td class="width1">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </td>
                        <td class="width1">
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                        </td>
                        <td class="width1">
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("CustomerID") %>'></asp:Label>
                        </td>
                        <td class="width1">
                            <asp:Button ID="Button2" runat="server" Text="Buy Now" CommandName="BuyDrawing" CommandArgument='<%# Eval("DrawID") %>'/>
                        </td>
                        <td class="width1">
                            <asp:Button ID="Button1" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("DrawID") %>'/>
                        </td>
                    </tr>
                </table>
                
            </ItemTemplate>
        </asp:DataList>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Gallery.Name, Gallery.Price, CartGallery.CustomerID, CartGallery.DrawID, Gallery.Image FROM CartGallery INNER JOIN Gallery ON CartGallery.DrawID = Gallery.DrawID WHERE (CartGallery.CustomerID = @CustomerID)">
            <SelectParameters>
                <asp:SessionParameter Name="CustomerID" SessionField="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <br />

    <%} %>
    </div>
</asp:Content>
