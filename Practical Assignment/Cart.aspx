<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Practical_Assignment.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
  <!--  
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" >
        <Columns>
            <asp:TemplateField HeaderText="Drawing">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="100px" Width="100px"
                    ImageUrl= /> 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField ="TotalNumber" HeaderText="Total Number"/>
            <asp:BoundField DataField ="Price" HeaderText="Total Price"/>
        </Columns>
    </asp:GridView>
   -->
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
        <Columns>
            
            <asp:TemplateField HeaderText="No."></asp:TemplateField>
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="50px" Width="100px" 
                        ImageUrl='<%# Eval("Image") %>''/>
                </ItemTemplate>
            </asp:TemplateField>

            
            <asp:TemplateField HeaderText="Customer"></asp:TemplateField>

            
        </Columns>

    </asp:GridView>
    

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [CartGallery]"></asp:SqlDataSource>

</asp:Content>
