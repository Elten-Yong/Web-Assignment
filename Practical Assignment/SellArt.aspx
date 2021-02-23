<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SellArt.aspx.cs" Inherits="Practical_Assignment.SellArt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .tableFormat {
            border-collapse: collapse;
            border: 1px solid grey;
            height: auto;
            width: 700px;
            background-color: white;
            margin-bottom :1%;
            height:300px;
            width:1000px;
        }
        .auto-style2 {
            height: 29px;
            width: 118px;
        }
        .auto-style3 {
            width: 279px;
        }
        .auto-style4 {
            height: 29px;
            width: 279px;
        }
        .auto-style5 {
            height: 24px;
            width: 118px;
        }
        .auto-style6 {
            width: 279px;
            height: 24px;
        }
        .auto-style7 {
            width: 118px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
     <% if (Session["Value"] == "0" || Session["Value"] == null)
          { %>
             <p>Please log in before updating your.</p>
      <%}
          else{ %>
                 <h1 style="text-align:center;margin-right:5%">Post Art</h1><hr />   
    
            <h1>Welcome to Alzenda Artwork Sales Gallery , select upload to post the art online !!!</h1>
            <p>
                Wanted to sell your masterpiece online? Want to let youur art to be recognized by others? Post your art now online at Alzenda Artwork Sales Gallery !
            <p>
            <br />
    <table class ="tableFormat">

        <tr>
            <td class="auto-style5">Art Details</td>
            <td class="auto-style6">
                </td>
        </tr>   

        <tr>
            <td class="auto-style7">Art name : </td>
            <td class="auto-style3">
                <asp:TextBox ID="ArtName" runat="server" Width="267px"></asp:TextBox></td>
        </tr>   

        <tr>
            <td class="auto-style7">
                Art Description :
            </td>
            <td class="auto-style3">
                <asp:TextBox runat="server" ID="ArtDescription" TextMode="Multiline" Columns="20" Name="S1" Rows="2" Height="98px" Width="271px" style="resize:none;"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td class="auto-style7">
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

        <tr>
            <td class="auto-style7">Art Drawing :</td>
            <td class="auto-style3">
                <asp:FileUpload ID="Drawing" runat="server" /></td>
        </tr>

        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style3">
                &nbsp;</td>
        </tr>

        <tr>
            <td class="auto-style7">
         <asp:Button ID="Cancel" runat="server" Text="Cancel" Width="140px"  />
            </td>
            <td class="auto-style3">
        <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" Width="139px" />
            </td>
        </tr>
        </table>

          <%} %>
    <br />
            &nbsp;
    <div >
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    

</asp:Content>
