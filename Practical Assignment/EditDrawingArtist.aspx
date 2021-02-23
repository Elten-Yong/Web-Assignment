<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditDrawingArtist.aspx.cs" Inherits="Practical_Assignment.EditDrawingArtist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    <div style="width:600px; margin-left: auto; margin-right: auto; ">
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound" OnItemCommand="DataList1_ItemCommand" >
            <ItemTemplate>
                <table style="width: 100%;">
                    <tr>
                        <td>
                            Image:
                        </td>
                        <td>
                            Confirm
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" Width="100px" Height="75px" ImageUrl='<%# Eval("Image") %>' />
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Confirm" CommandName="ConfirmEdit" CommandArgument='<%# Eval("DrawID") %>'/>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <table>
            <tr>
                <td>
                    Name:
                </td>
                <td>
                    Description:
                </td>
                <td>
                    Price:
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="NameTxt" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="DescriptionTxt" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="PriceTxt" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Gallery.* FROM Gallery WHERE (Gallery.DrawID=@DrawID)" >
        <SelectParameters>
            <asp:QueryStringParameter Name="DrawID" QueryStringField="id" Type="String"/>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
