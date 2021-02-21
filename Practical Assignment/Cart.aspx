<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Practical_Assignment.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" >
        <Columns>
            <asp:TemplateField HeaderText="Drawing">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="100px" Width="100px"
                    ImageUrl='<%# "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])Eval("ImageData")) %>' /> 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField ="TotalNumber" HeaderText="Total Number"/>
            <asp:BoundField DataField ="Price" HeaderText="Total Price"/>
        </Columns>
    </asp:GridView>
</asp:Content>
