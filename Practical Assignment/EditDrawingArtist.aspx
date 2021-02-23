<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditDrawingArtist.aspx.cs" Inherits="Practical_Assignment.EditDrawingArtist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .tableFormat {
            border-collapse: collapse;
            border: 1px solid grey;
            height: auto;
            width: 700px;
            margin: 0% 25% 0% 25%;
            background-color: white;
        }
        .auto-style2 {
            height: 29px;
        }
        .auto-style3 {
            width: 279px;
        }
        .auto-style4 {
            height: 29px;
            width: 279px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    <table class ="tableFormat">
        <tr>
            <td>
            <asp:Image ID="DrawImg" runat="server" Width="250px" Height="125px"/>
            </td>
        </tr>
        <tr>
            <td>Art name : </td>
            <td class="auto-style3">
                <asp:TextBox ID="ArtName" runat="server" Width="267px"></asp:TextBox></td>
        </tr>   

        <tr>
            <td>
                Art Description :
            </td>
            <td class="auto-style3">
                <asp:TextBox runat="server" ID="ArtDescription" TextMode="Multiline" Columns="20" Name="S1" Rows="2" Height="98px" Width="271px" style="resize:none;"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                Price :
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="Price" runat="server" Width="265px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                Total Art :
            </td>
            <td class="auto-style4">
                <asp:DropDownList ID="TotalArt" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        </table>
    <br />
            &nbsp;
    <div style="text-align: center">
         <asp:Button ID="Cancel" runat="server" Text="Cancel" Width="140px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" Width="139px" />
    </div>
</asp:Content>
