<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="Practical_Assignment.SignIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .tableFormat {
            border-collapse: collapse;
            border: 1px solid grey;
            height: auto;
            width :700px;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 100px;
            margin-top: 50px;
            background-color: lightgray;
        }
        .tableFormat1 {
            border-collapse: collapse;
            border: 1px solid grey;
            height: auto;
            width :700px;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 180px;
            margin-top: 100px;
            background-color: lightgray;
        }
        .txtType{
            text-align:center;
        }
        .auto-style2 {
            text-align: center;
            height: 27px;
        }
        .auto-style3 {
            height: 39px;
           
        }
        .auto-style4 {
            text-align: center;
            height: 24px;
        }
        .auto-style7 {
            height: 24px;
            width: 233px;
        }
        .auto-style9 {
            width: 370px;
        }

        .form{
            position :relative;
            border: none;
            border-bottom : 1px solid black;
            Width: 230px ;
            background-color: lightgray;
        }

 
        .auto-style10 {
            height: 39px;
            width: 233px;
        }

 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    
    <h1 style="text-align:center">Sign In</h1><hr />

    <asp:MultiView ID="SignInMultiView" runat="server">
            <asp:View ID="View1" runat="server">

            <table class="tableFormat1">
                <tr>
                    <td>
                  </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Button ID="btnArtist" runat="server" Text="Artist" Width="400px" Height="50px" style="border-color: #4D94FF; background-color: white; color: #284E98;" OnClick="btnArtist_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                       </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Button ID="btnCustomer" runat="server" style="border-color: #4D94FF; background-color: white; color: #284E98;" OnClick="btnCustomer_Click" Text="Customer" Width="400" Height="50"/>
                    </td>
                </tr>
                <tr>
                    <td class="btnType">&nbsp;</td>
                </tr>
                <tr>
                    <td class="btnType" style="text-align:center">Do not have an account?  <a href="SignUp.aspx">Register</a></td>
                   
                </tr>
                <tr>
                    <td class="btnType">&nbsp;</td>
                </tr>
            </table>
        </asp:View>
    <asp:View ID="View2" runat="server">
    <table class="tableFormat">
        <tr>
            <td colspan="4">
                <asp:Label ID="lblSignIn" runat="server" Text=""></asp:Label>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4"><img src="Sample Images/baseline_person_black_48dp.png" alt="profile" width="150" height="150" style="margin-left:290px ; margin-bottom:10px" /> 
</td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="txtType" colspan="4">
                <asp:Label runat="server" ID="lblUsername" text="Username :"></asp:Label>
                <asp:TextBox ID="txtUsername" runat="server"  Cssclass="form"></asp:TextBox><br />
                
                <asp:RequiredFieldValidator ID="usernameRequired" runat="server" ErrorMessage="Username cannot be empty." ControlToValidate="txtUsername" ForeColor="red" Font-Size="Small" SetFocusOnError="True"></asp:RequiredFieldValidator>
                
            </td>
        </tr>
        <tr>
            <td class="auto-style10"></td>
            <td class="auto-style10" colspan="2"></td>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td class="auto-style2" colspan="4">
                <asp:Label runat="server" ID="lblPassword" text="Password :"></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server"  TextMode="Password" Cssclass="form"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="passwordRequired" runat="server" ErrorMessage="Password can not be empty." ControlToValidate="txtPassword" Font-Size="Small" ForeColor="red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4" colspan="4">
                </td>
        </tr>
        <tr>
            <td class="txtType" colspan="4">&nbsp;</td>
        </tr>
        <tr>
            <td  colspan="2" class="auto-style9" >
                <div style="text-align:left ; padding-left:5px">
                    <asp:CheckBox ID="chkBoxRememberMe" runat="server" text="Remember me next time."/>
                </div>
 
            </td>


            <td style="text-align:right; padding-right:5px"colspan="2" >
                <a href="ForgetPassword.aspx">Forget Password?</a></td>


        </tr>

        <tr>
            <td class="auto-style9" colspan="2">&nbsp;</td>
            <td colspan="2" style="text-align:right; padding-right:5px">&nbsp;</td>
        </tr>

        <tr>
            <td class="txtType" colspan="4">
                <asp:Button ID="btnCancelLogIn" runat="server" Height="30px" OnClick="btnCancelLogIn_Click" style="margin-right:50px; border-color: #4D94FF; background-color: white; color: #284E98;" Text="Cancel" ValidationGroup="none" Width="240px" />
                <asp:Button ID="btnLogIn" runat="server" Height="30px" OnClick="btnLogIn_Click" style="border-color: #4D94FF; background-color: white; color: #284E98;" Text="Sign In" Width="240px" /><br />
                <asp:Label ID="lblError" runat="server" Font-Size="Small" ForeColor="red" Text="" ></asp:Label>
            </td>
        </tr>

        <tr>
            <td class="txtType" colspan="4">&nbsp;</td>
        </tr>

        <tr>
            <td class="txtType" colspan="4" style="text-align:right">
                Don't have an account? <a href="SignUp.aspx">Register</a> now!</td>
        </tr>
    </table>
       </asp:View>
    </asp:MultiView>
    
</asp:Content>
