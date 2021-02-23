<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Practical_Assignment.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
  
  
        <% if (Session["Value"] == "0" || Session["Value"] == null)
          { %>

            <div>
                 <p style="text-align:center; font-size:x-large">Please log in to view your cart.</p>
                <div style=" text-align: center">
                <asp:Button ID="btnSignIn" runat="server" Text="Sign In" style="border-color: #4D94FF;
                background-color: white; color: #284E98; Font-Size:x-large; text-align:center;" 
                    OnClick="btnSignIn_Click" Width="527px"/>
                </div>
            </div>
        <%}
          else{ %>
        
    <div style="margin: 0px 500px 0px 500px; width: 2000px">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
        <Columns>
        
           <asp:BoundField HeaderText="No." DataField="DrawID" ItemStyle-Width="50px"/>

            <asp:TemplateField HeaderText="Drawing">
                 <ItemTemplate >
                    <asp:Image ID="Image1" runat="server" Height="100px" Width="150px"
                    ImageUrl='<%# "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])Eval("Image")) %>' /> 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField ="Price" HeaderText=" Price" ItemStyle-Width="100px"/>
            
        </Columns>
    </asp:GridView>
        <br />
    </div>
    

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [CartGallery]"></asp:SqlDataSource>

    <%} %>
</asp:Content>
