<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Practical_Assignment.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .auto-style2 {
            height: 26px;
            padding-left: 100px;
            padding-right: 100px;
        }

        .auto-style3 {
            height: 39px;
        }
        .tableFormat1 {
            border-collapse: collapse;
            border: 1px solid grey;
            height: auto;
            width :700px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 100px;
            margin-bottom: 180px;
            background-color: lightgray;
            
        }
        .tableFormat2 {
            border-collapse: collapse;
            border: 1px solid grey;
            height: auto;
            width :250px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 180px;
            margin-bottom: 50px;
            background-color: lightgray;
            
        }
        .btnType{
            text-align:center;

        }
         .form{
            position :relative;
            border: none;
            border-bottom : 1px solid black;
            Width: 230px ;
            background-color: lightgray;
        }

        .auto-style4 {
            height: 27px;
            padding-left: 100px;
            padding-right: 100px;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    
    <h1 style="text-align:center">Registration</h1><hr />

    <asp:MultiView ID="SignUpMultiView" runat="server">
  
        <asp:View ID="View1" runat="server">

            <table class="tableFormat1">
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="btnType">
                        <asp:Button ID="btnArtist" runat="server" Text="Artist" Width="400px" Height="50px" style="border-color: #4D94FF; background-color: white; color: #284E98;" OnClick="btnArtist_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                       </td>
                </tr>
                <tr>
                    <td class="btnType">
                        <asp:Button ID="btnCustomer" runat="server" style="border-color: #4D94FF; background-color: white; color: #284E98;" OnClick="btnCustomer_Click" Text="Customer" Width="400" Height="50"/>
                    </td>
                </tr>
                <tr>
                    <td class="btnType">&nbsp;</td>
                </tr>
                <tr>
                    <td class="btnType">Already have an account?  <a href="SignIn.aspx">Sign In</a></td>
                   
                </tr>
                <tr>
                    <td class="btnType">&nbsp;</td>
                </tr>
            </table>
        </asp:View>

        <asp:View ID="View2" runat="server">
        <table class="tableFormat2" style="margin-top:1%">
            <tr>
                
                <td class="auto-style2">
                    <asp:Label ID="lblSignUp" runat="server" ForeColor="#666666"></asp:Label>&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <tr>
                    <td class="auto-style2" colspan="2" style="border-bottom:1px solid">Please fill in the registration form.
                        <br />
                        <br/>
                        
                    </td>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Username:</td>
                        <td class="auto-style2">Email:</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtUsername" runat="server" Cssclass="form" Width="230px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="usernameRequired" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username can not be empty." Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtEmail" runat="server" Cssclass="form"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="emailRequired" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email address can not be empty." Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter a valid email address" Font-Size="Small" ForeColor="Red" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Password:</td>
                        <td class="auto-style2">Confirm Password:</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtPassword" runat="server" Cssclass="form" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="passwordRequired" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter a strong password include characters and number with a min length 8" Font-Size="Small" ForeColor="Red" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtConfirmPassword" runat="server" Cssclass="form" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="confirmPasswordRequired" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm password cannot be empty" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <br />
                            <asp:CompareValidator ID="comparePass" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Password miss-match, please re-enter the password" Font-Size="Small" ForeColor="Red" Operator="Equal" SetFocusOnError="True"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:DropDownList ID="ddlQuestion" runat="server">
                                <asp:ListItem Selected="True" Value="None">--Choose a question--</asp:ListItem>
                                <asp:ListItem>Primary school&#39;s name.</asp:ListItem>
                                <asp:ListItem>First vehicle&#39;s brand.</asp:ListItem>
                                <asp:ListItem>Current pet&#39;s name.</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ddlQuestionRequired" runat="server" ControlToValidate="ddlQuestion" ErrorMessage="Please choose a question" Font-Size="Small" ForeColor="Red" InitialValue="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtQuestion" runat="server" Cssclass="form"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txtQuestionRequired" runat="server" ControlToValidate="txtQuestion" ErrorMessage="Answer cannot be empty" Font-Size="Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style4" colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Button ID="btnCancel" runat="server" Height="30px" OnClick="btnCancel_Click" style="border-color: #4D94FF; margin-right:150px; background-color: white; color: #284E98;" Text="Cancel" UseSubmitBehavior="False" ValidationGroup="none" />
                        </td>
                        <td class="auto-style2">
                            <asp:Button ID="btnRegister" runat="server" Height="30px" OnClick="btnRegister_Click" style="border-color: #4D94FF; background-color: white; color: #284E98;" Text="Register" />
                            <asp:Label ID="lblDuplicate" runat="server" Font-Size="Small" ForeColor="Red" Text=""></asp:Label>
                        </td>
                    </tr>
                </tr>
            
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
            
        </table>
        </asp:View>
        </asp:MultiView>

</asp:Content>
