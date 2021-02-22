<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="Practical_Assignment.Wishlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataSourceID="SqlDataSource1">
        <Columns>

             
            <asp:BoundField DataField ="Price" HeaderText="Total Price"/>
            <asp:TemplateField HeaderText="Drawing">
                 <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="100px" Width="100px"
                    ImageUrl='<%# "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])Eval("Image")) %>' /> 
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
    
</asp:Content>
