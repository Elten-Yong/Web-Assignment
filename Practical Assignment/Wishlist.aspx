<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="Practical_Assignment.Wishlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">

    <div style="width:1000px; margin:0 auto;">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
        <Columns>
        
           <asp:BoundField HeaderText="No." DataField="DrawID"/>

            <asp:TemplateField HeaderText="Drawing">
                 <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="100px" Width="100px"
                    ImageUrl='<%# "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])Eval("Image")) %>' /> 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField ="Price" HeaderText="Total Price"/>
            <asp:TemplateField>
                 <ItemTemplate>
                    <asp:LinkButton ID="lnkUpdate" Text="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this rows?');" CommandName="DeleteRow" CommandArgument='<%# Bind("DrawID") %>'/>
                 </ItemTemplate>
             </asp:TemplateField>
            
            
        </Columns>
    </asp:GridView>
    </div>
</asp:Content>
