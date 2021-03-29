<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Practical_Assignment.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    <style type="text/css">
                
         .form{
            position :relative;
            border: none;
            border-bottom : 1px solid black;
            Width: 230px ;
            background-color: rgb(224, 226, 224);
        }

        .auto-style2 {
            height: 50px;
            padding-left: 5px;
        }

        
        .tableFormat {
            border-collapse: collapse;
            border: 1px solid grey;
            height: auto;
            width :700px;
            margin:4% auto 4% auto;
            background-color: rgb(224, 226, 224);
        }
        .btnType{
            text-align:center;
        }


        .auto-style3 {
            height: 50px;
            padding-left: 5px;
            width: 236px;
        }


        .auto-style4 {
            height: 50px;
            padding-left: 5px;
            width: 173px;
        }


        </style>
    <div>
        <h1 style="text-align:center">Edit Profile</h1><hr />
        <asp:MultiView ID="EditPageMultiview" runat="server">
            <asp:View ID="View1" runat="server">
              <table class="tableFormat">
                    <tr>
                            <td class="auto-style2" colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2" colspan="2"></td>
                   </tr>
                    <tr>
                            <td class="auto-style2">
                                Username:</td>
                            <td class="auto-style2">
                                <asp:Label ID="lblUsername" runat="server" Text=""></asp:Label>
                    
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Password:</td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="confirmValidator" runat="server" ErrorMessage="Confirm Your Password to proceed." ControlToValidate="txtConfirmPassword" ForeColor="red" Font-Size="Small"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red" Font-Size="small"></asp:Label>


                            </td>
                   </tr>
            
                        <tr>
                            <td class="auto-style2" colspan="2"></td>
                        </tr>
                        <tr>
                            <td class="auto-style2" style="text-align: center" colspan="2">
                                <asp:Button ID="btnCancelEdit" runat="server" Height="30px" style="margin-right:50px; border-color: #4D94FF; background-color: white; color: #284E98;" Text="Cancel" ValidationGroup="none" Width="240px" OnClick="btnCancelEdit_Click" />
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" Width="240px" style="border-color: #4D94FF; 
                                background-color: white; color: #284E98;" OnClick="btnEdit_Click"   Height="30px"/>

                                </td>
                        </tr>
                         
                    </table>
                </asp:View>
            <asp:View ID="View2" runat="server">
                              <table class="tableFormat">
                    <tr>
                            <td class="auto-style2" colspan="2">&nbsp;</td>
                    </tr>
                                  <tr>
                                      <td class="auto-style2" colspan="2"></td>
                                  </tr>
                    <tr>
                            <td class="auto-style4">
                                Username:</td>
                            <td class="auto-style2">
                                <asp:Label ID="lblUsername0" runat="server" Text=""></asp:Label>
                    
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">Email:</td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter a valid email address" Font-Size="Small" ForeColor="Red" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                
                                Password:</td>
                            <td class="auto-style2">
                                
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form" Width="230px"></asp:TextBox>
                                
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter a strong password include characters and number with a min length 8" Font-Size="Small" ForeColor="Red" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"></asp:RegularExpressionValidator>
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                    
                                Phone No: 
                                                    
                            </td>
                            <td class="auto-style2">
                    
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form"></asp:TextBox>
                    
                            </td>
                        </tr>
            
                        <tr>
                            <td class="auto-style4">
                        
                         <% if (Session["Bar"] == "C")
                             { %>
                                Delivery Address: 
            
                              <%} 
                         %>
                            </td>
                            <td class="auto-style2">
                        
                                
                         <% if (Session["Bar"] == "C")
                             { %>
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form"></asp:TextBox>
            
                              <%} 
                            %> 

                            </td>
                        </tr>
            
                        <tr>
                            <td class="auto-style2" colspan="2"></td>
                        </tr>
                        <tr>
                            <td class="auto-style2" style="text-align: center" colspan="2">
                                <asp:Button ID="btnCancelLogIn" runat="server" Height="30px" OnClick="btnCancelLogIn_Click" style="margin-right:50px; border-color: #4D94FF; background-color: white; color: #284E98;" Text="Cancel" ValidationGroup="none" Width="240px" />

                                <asp:Button ID="btnSave" runat="server" Height="30px" OnClick="btnSave_Click" style="border-color: #4D94FF; 
                                background-color: white; color: #284E98;" Text="Save" Width="240px" />

                                </td>
                        </tr>
                         
                    </table>

            </asp:View>

            </asp:MultiView>
                </div>
</asp:Content>
