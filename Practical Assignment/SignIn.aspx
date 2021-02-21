<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="Practical_Assignment.SignIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 25px;
            text-align:center;
        }
        .tableFormat {
            border-collapse: collapse;
            border: 1px solid grey;
            height: auto;
            width :700px;
            margin:0% 25% 0% 25%;
        }
        .txtType{
            text-align:center;
        }
        .auto-style2 {
            text-align: center;
            height: 27px;
        }
        .auto-style3 {
            height: 24px;
            width: 234px;
        }
        .auto-style4 {
            text-align: center;
            height: 24px;
        }
        .auto-style5 {
            text-align: center;
            height: 32px;
        }
        .auto-style6 {
            text-align: center;
            height: 23px;
        }
        .auto-style7 {
            height: 24px;
            width: 233px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    <table class="tableFormat">
        <tr>
            <td class="auto-style1" colspan="4"><h1>Sign In</h1><hr /></td>
        </tr>
        <tr>
            <td class="txtType" colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="txtType" colspan="4">
                <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" Width="230px"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="usernameRequired" runat="server" ErrorMessage="Username cannot be empty." ControlToValidate="txtUsername" ForeColor="red" Font-Size="Small"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7"></td>
            <td class="auto-style7" colspan="2"></td>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td class="auto-style2" colspan="4">
                <asp:TextBox ID="txtPassword" runat="server" placeholder="password" Width="230px" TextMode="Password"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="passwordRequired" runat="server" ErrorMessage="Password can not be empty." ControlToValidate="txtPassword" Font-Size="Small" ForeColor="red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4" colspan="4">
                </td>
        </tr>
        <tr>
            <td class="auto-style5" colspan="4">
                <asp:Button ID="btnLogIn" runat="server" Text="Log In"  style="border-color: #4D94FF; background-color: white; color: #284E98;" Width="240px" Height="30px"/>
            </td>
        </tr>
        <tr>
            <td class="txtType" colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td  colspan="2" >
                <div style="text-align:left ; padding-left:5px">
                    <asp:CheckBox ID="CheckBox1" runat="server" text="Remember me next time."/>
                </div>
 
            </td>


            <td style="text-align:right; padding-right:5px"colspan="2" >
                <a href="#">Forget Password?</a></td>


        </tr>

        <tr>
            <td class="txtType" colspan="4">
                &nbsp;</td>
        </tr>

        <tr>
            <td class="txtType" colspan="4" style="text-align:right">
                Don't have an account? <a href="SignUp.aspx">Sign Up</a> now!</td>
        </tr>
    </table>
</asp:Content>
