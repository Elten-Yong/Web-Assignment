<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Practical_Assignment.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 26px;
            text-decoration:underline;

        }
        .auto-style2 {
            height: 26px;
            padding-left: 5px;
        }

        .auto-style3 {
            height: 39px;
        }
        .tableFormat {
            border-collapse: collapse;
            border: 1px solid grey;
            height: auto;
            width :700px;
            margin:0% 25% 0% 25%;
        }
        .btnType{
            text-align:center;
        }

        .auto-style4 {
            text-align: center;
            height: 52px;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">

    <asp:MultiView ID="SignUpMultiView" runat="server">
  
        <asp:View ID="View1" runat="server">

            <table class="tableFormat">
                <tr>
                    <td><h1 style="text-align:center">Register as</h1><hr/></td>
                </tr>
                <tr>
                    <td>
          
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
        <table class="tableFormat">
            <tr style ="border:50px">
                <td class="auto-style1"><h1>
                    Registration</h1></td>
            </tr>
            <tr>
                <td class="auto-style2">Please fill in the registration form. 
                    <br /><hr />
                </td>

            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    Username:</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:TextBox ID="txtUsername" runat="server" placeholder="Goofy"  Width="230px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="usernameRequired" runat="server" ErrorMessage="Username can not be empty." ControlToValidate="txtUsername" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    Email:</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="abc@gmail.com" Width="230px" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="emailRequired" runat="server"  ErrorMessage="Email address can not be empty." ControlToValidate="txtEmail" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>
                       <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter a valid email address" ForeColor="Red" Font-Size="Small"  
                        ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
                    
                </td>
            </tr>
            
            <tr>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    Password:</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"  Width="230px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="passwordRequired" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" ForeColor="Red" Font-Size="Small" ></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter a strong password include characters and number with a min length 8" 
                        ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" ForeColor="Red" Font-Size="Small"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    Confirm Password:</td>
            </tr>
             <tr>
                <td class="auto-style2">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password"  Width="230px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="confirmPasswordRequired" runat="server" ErrorMessage="Confirm password cannot be empty" ControlToValidate="txtConfirmPassword" ForeColor="Red" 
                        Font-Size="Small"></asp:RequiredFieldValidator><br />
                    <asp:CompareValidator ID="comparePass" runat="server" ErrorMessage="Password miss-match, please re-enter the password" Operator="Equal" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ForeColor="Red" 
                        Font-Size="Small" ></asp:CompareValidator>
                 </td>
            </tr>
             <tr>
                <td class="auto-style2">
                    </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlQuestion" runat="server" Width="230px" >
                        <asp:ListItem Selected="True" Value="None">--Choose a question--</asp:ListItem>
                        <asp:ListItem>Primary school&#39;s name.</asp:ListItem>
                        <asp:ListItem>First vehicle&#39;s brand.</asp:ListItem>
                        <asp:ListItem>Current pet&#39;s name.</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="ddlQuestionRequired" runat="server" ErrorMessage="Please choose a question" InitialValue="None" Display="Dynamic" ControlToValidate="ddlQuestion" ForeColor="Red" 
                        Font-Size="Small"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:TextBox ID="txtQuestion" runat="server" Width="230px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="txtQuestionRequired" runat="server" ErrorMessage="Answer cannot be empty"  ForeColor="Red" 
                        Font-Size="Small" ControlToValidate="txtQuestion"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">

                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" style="border-color: #4D94FF; margin-right:110px; background-color: white; color: #284E98;" Height="30px" OnClick="btnCancel_Click" ValidationGroup="none" UseSubmitBehavior="False" />
                    <asp:Button ID="btnRegister" runat="server" Text="Register" style="border-color: #4D94FF; background-color: white; color: #284E98;" OnClick="btnRegister_Click" Height="30px" />
                    
                    <asp:Label ID="lblDuplicate" runat="server" Text="" ForeColor="Red" Font-Size="Small"></asp:Label>
                    
                </td>
            </tr>
        </table>
        </asp:View>
        </asp:MultiView>

</asp:Content>
