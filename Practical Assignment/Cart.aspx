<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Practical_Assignment.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
  
    <style type="text/css">
        
        
        .tableFormat {
            border-collapse: collapse;
            border: 1px solid grey;
            height: auto;
            width :700px;
            margin:4% 25% 7% 25%;
            background-color: white;
        }

         .auto-style {
             height: 25px;
         }


        </style>
  
        <% if (Session["Value"] == "0" || Session["Value"] == null)
          { %>

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
                            OnClick="btnSignIn_Click" Width="527px"/>
                
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
          
        <%}
          else{ %>
        
    <div style="margin: 0px 500px 0px 500px; " >
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DrawID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="DrawID" HeaderText="DrawID" ReadOnly="True" SortExpression="DrawID" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            </Columns>
        </asp:GridView>
        <br />
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [CartGallery] WHERE [DrawID] = @DrawID" InsertCommand="INSERT INTO [CartGallery] ([DrawID], [Name], [Price], [Image], [CustomerID]) VALUES (@DrawID, @Name, @Price, @Image, @CustomerID)" SelectCommand="SELECT CartGallery.DrawID, CartGallery.CustomerID, CartGallery.Name, CartGallery.Price, CartGallery.Image FROM CartGallery INNER JOIN Customer ON CartGallery.CustomerID = Customer.CustomerID INNER JOIN Gallery ON CartGallery.DrawID = Gallery.DrawID" UpdateCommand="UPDATE [CartGallery] SET [Name] = @Name, [Price] = @Price, [Image] = @Image, [CustomerID] = @CustomerID WHERE [DrawID] = @DrawID">
        <DeleteParameters>
            <asp:Parameter Name="DrawID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DrawID" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="Image" Type="Object" />
            <asp:Parameter Name="CustomerID" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="Image" Type="Object" />
            <asp:Parameter Name="CustomerID" Type="String" />
            <asp:Parameter Name="DrawID" Type="String" />
        </UpdateParameters>
        </asp:SqlDataSource>


    <%} %>
</asp:Content>
