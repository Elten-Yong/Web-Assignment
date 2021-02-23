<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="Practical_Assignment.ForgetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
           .tableFormat {
            border-collapse: collapse;
            border: 1px solid grey;
            height: auto;
            width :700px;
            margin:4% 25% 4% 25%;
            background-color: rgb(224, 226, 224);
        }
        .txtType{
            text-align:center;
        }
        .auto-style3 {
            height: 39px;
           
        }
        .auto-style4 {
            text-align: center;
            height: 24px;
        }
        .auto-style5 {
            height: 24px;
            text-align:center;
        }
        .auto-style6 {
            height: 24px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    <h1 style="text-align:center;margin-right:5%">Reset Password</h1><hr />
    <asp:MultiView ID="ForgetPasswordMultiView" runat="server">
                    <asp:View ID="View1" runat="server">

            <table class="tableFormat">
                <tr>
                    <td >
                          
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblAttempt" runat="server" Font-Size="Small" ForeColor="Red" Text=""></asp:Label>
                    </td>
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
                    <td class="btnType" style="text-align:center">Back to   <a href="SignIn.aspx">Sign In</a></td>
                   
                </tr>
                <tr>
                    <td class="btnType">&nbsp;</td>
                </tr>
            </table>
        </asp:View>

        <asp:View ID="View2" runat="server">
                <table class="tableFormat">
                <tr>
                    <td class="auto-style5" >
                          
                        &nbsp;</td>
                </tr>
                    <tr>
                        <td class="auto-style5">Enter Your Username.</td>
                    </tr>
                <tr>
                    <td class="auto-style6"></td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        
                        <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" Width="230px" BorderColor="#E6E6E6"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="txtUserRequired" runat="server" ErrorMessage="Username can not be empty." ControlToValidate="txtUsername" ForeColor="red" Font-Size ="Small"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblUsernameError" runat="server" Text="" ForeColor="Red" Font-Size="Small"></asp:Label>
                    </td>
                </tr>
                    <tr>
                        <td class="auto-style5">&nbsp;</td>
                    </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Button ID="btnCancelForgot" runat="server" Height="30px" style="margin-right:50px; border-color: #4D94FF; background-color: white; color: #284E98;" Text="Cancel" ValidationGroup="none" Width="240px" OnClick="btnCancelForgot_Click" />
                        <asp:Button ID="btnProceed" runat="server" Height="30px"  style="border-color: #4D94FF; background-color: white; color: #284E98;" Text="Proceed" Width="240px" OnClick="btnProceed_Click"  />
                    </td>
                </tr>
                <tr>
                    <td class="btnType">&nbsp;</td>
                </tr>
                <tr>
                    <td class="btnType">&nbsp;</td>
                </tr>
            </table>
            </asp:View>

            <asp:View ID="View3" runat="server">
                <table class="tableFormat">
                <tr>
                    <td class="auto-style5" >
                          
                        &nbsp;</td>
                </tr>
                    <tr>
                        <td class="auto-style5">Please answer the security question.</td>
                    </tr>
                <tr>
                    <td class="auto-style6"></td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        
                        <asp:Label ID="lblQuestion" runat="server" Text="Label"></asp:Label>
                        
                    </td>
                </tr>
                <tr>
                    <td >
                       </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtAnswerQuestion" runat="server" placeholder="Security Answer" Width="230px" BorderColor="#E6E6E6"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="txtAnswerRequired" runat="server" ErrorMessage="Answer can not be empty." ControlToValidate ="txtAnswerQuestion" ForeColor="red" Font-Size ="Small" ></asp:RequiredFieldValidator>
                    </td>
                </tr>
                    <tr>
                        <td class="auto-style4">
                            <asp:Label ID="lblSecurityQuestion" runat="server" Text="" ForeColor="Red" Font-Size="Small"></asp:Label>
                        </td>
                    </tr>
                <tr>
                    <td class="btnType">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Button ID="btnCancelForgot2" runat="server" Height="30px" style="margin-right:50px; border-color: #4D94FF; background-color: white; color: #284E98;" Text="Cancel" ValidationGroup="none" Width="240px" OnClick="btnCancelForgot2_Click" />
                        <asp:Button ID="btnProceed2" runat="server" Height="30px" style="border-color: #4D94FF; background-color: white; color: #284E98;" Text="Proceed" Width="240px" OnClick="btnProceed2_Click" />
                    </td>
                </tr>
                    <tr>
                        <td class="auto-style4">&nbsp;</td>
                    </tr>
            </table>
            </asp:View>
                <asp:View ID="View4" runat="server">
                <table class="tableFormat">
                <tr>
                    <td><h1 style="text-align:center">Forget Password</h1><hr/></td>
                </tr>
                <tr>
                    <td class="auto-style5" >
                          
                        Please enter your new password.</td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                </tr>
                <tr>
                    <td class="auto-style3">
                       </td>
                </tr>
                              <tr>
                <td class="auto-style5">
                    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" placeholder="Password"  Width="230px" BorderColor="#E6E6E6"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="passwordRequired" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="Password is required" ForeColor="Red" Font-Size="Small" ></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="Please enter a strong password include characters and number with a min length 8" 
                        ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" ForeColor="Red" Font-Size="Small"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
            </tr>
             <tr>
                <td class="auto-style5">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password"  Width="230px" BorderColor="#E6E6E6"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="confirmPasswordRequired" runat="server" ErrorMessage="Confirm password cannot be empty" ControlToValidate="txtConfirmPassword" ForeColor="Red" 
                        Font-Size="Small"></asp:RequiredFieldValidator><br />
                    <asp:CompareValidator ID="comparePass" runat="server" ErrorMessage="Password miss-match, please re-enter the password" Operator="Equal" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" ForeColor="Red" 
                        Font-Size="Small" ></asp:CompareValidator>
                 </td>
                <tr>
                    <td class="auto-style6"></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Button ID="btnCancelForgot3" runat="server" Height="30px" style="margin-right:50px; border-color: #4D94FF; background-color: white; color: #284E98;" Text="Cancel" ValidationGroup="none" Width="240px" OnClick="btnCancelForgot3_Click" />
                        <asp:Button ID="btnReset" runat="server" Height="30px" style="border-color: #4D94FF; background-color: white; color: #284E98;" Text="Reset" Width="240px" OnClick="btnReset_Click" />
                    </td>
                </tr>
                    <tr>
                        <td class="auto-style5">&nbsp;</td>
                    </tr>
            </table>
            </asp:View>

        </asp:MultiView>
</asp:Content>
