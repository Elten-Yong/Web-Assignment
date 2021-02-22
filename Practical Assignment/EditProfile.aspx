<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Practical_Assignment.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 26px;
            text-align: center;

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
            margin:0% 25% 0% 25%;
            background-color: white;
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
            width: 317px;
        }


        </style>
    <div>
        <asp:MultiView ID="EditPageMultiview" runat="server">
            <asp:View ID="View1" runat="server">
              <table class="tableFormat">
                   <tr style ="border:50px">
                        <td class="auto-style1" colspan="2" ><h1 >
                          Profile</h1><hr /></td>
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
                            <td class="auto-style3">Email:</td>
                            <td class="auto-style2"><asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                
                                Password:</td>
                            <td class="auto-style2">
                                
                                <asp:Label ID="lblPassword" runat="server" Text=""></asp:Label>
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                    
                                Phone No: 
                                                    
                            </td>
                            <td class="auto-style2">
                    
                                <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
                    
                            </td>
                        </tr>
            
                        <tr>
                            <td class="auto-style3">
                        
                         <% if (Session["Bar"] == "C")
                             { %>
                                Delivery Address: 
            
                              <%} 
                         %>
                            </td>
                            <td class="auto-style2">
                        
                                <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
            
                        <tr>
                            <td class="auto-style2" colspan="2"></td>
                        </tr>
                        <tr>
                            <td class="auto-style2" style="text-align: center" colspan="2">
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" Width="166px" OnClick="btnEdit_Click"  />

                                </td>
                        </tr>
                         
                    </table>
                </asp:View>
            <asp:View ID="View2" runat="server">
                              <table class="tableFormat">
                   <tr style ="border:50px">
                        <td class="auto-style1" colspan="2" ><h1 >
                            Edit Profile</h1><hr /></td>
                   </tr>
                    <tr>
                            <td class="auto-style2" colspan="2"></td>
                    </tr>
                    <tr>
                            <td class="auto-style4">
                                Username:</td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    
                                <asp:Label ID="lblDuplicate" runat="server" Text="" ForeColor="Red" Font-Size="small"></asp:Label>
                    
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">Email:</td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter a valid email address" Font-Size="Small" ForeColor="Red" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                
                                Password:</td>
                            <td class="auto-style2">
                                
                                <asp:TextBox ID="txtPassword" runat="server" BorderColor="#E6E6E6" placeholder="Password" Width="230px"></asp:TextBox>
                                
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter a strong password include characters and number with a min length 8" Font-Size="Small" ForeColor="Red" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"></asp:RegularExpressionValidator>
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                    
                                Phone No: 
                                                    
                            </td>
                            <td class="auto-style2">
                    
                                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    
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
                        
                                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                            </td>
                        </tr>
            
                        <tr>
                            <td class="auto-style2" colspan="2"></td>
                        </tr>
                        <tr>
                            <td class="auto-style4" style="text-align: center">
                                <asp:Button ID="btnCancelLogIn" runat="server" Height="30px" OnClick="btnCancelLogIn_Click" style="margin-right:50px; border-color: #4D94FF; background-color: white; color: #284E98;" Text="Cancel" ValidationGroup="none" Width="240px" />

                                </td>
                            <td class="auto-style2" style="text-align: center">
                                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" Width="166px" />
                            </td>
                        </tr>
                         
                    </table>

            </asp:View>

            </asp:MultiView>
                </div>
</asp:Content>
