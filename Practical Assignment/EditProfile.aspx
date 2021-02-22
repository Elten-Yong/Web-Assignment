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


        </style>
    <div>
              <table class="tableFormat">
                   <tr style ="border:50px">
                        <td class="auto-style1" ><h1 >
                          Profile</h1><hr /></td>
                   </tr>
                    <tr>
                            <td class="auto-style2"></td>
                    </tr>
                    <tr>
                            <td class="auto-style2">
                                Username:<asp:TextBox ID="txtUsername" runat="server" value=""></asp:TextBox>
                    
                    <asp:Label ID="lblDuplicate" runat="server" Text="" ForeColor="Red" Font-Size="Small"></asp:Label>
                    
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Email:<asp:TextBox ID="txtEmail" runat="server" value=""></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                
                                Password:<asp:TextBox ID="txtPassword" runat="server" value=""></asp:TextBox>
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                    
                                Phone No: <asp:TextBox ID="txtPhone" runat="server" value=""></asp:TextBox>
                    
                            </td>
                        </tr>
            
                        <tr>
                            <td class="auto-style2">
                        
                         <% if (Session["Bar"] == "C")
                             { %>
                                Delivery Address: <asp:TextBox ID="txtAddress" runat="server" value=""></asp:TextBox>
            
                              <%} 
                         %>
                            </td>
                        </tr>
            
                        <tr>
                            <td class="auto-style2"></td>
                        </tr>
                        <tr>
                            <td class="auto-style2" style="text-align: center">
                                <asp:Button ID="btnSave" runat="server" Text="Save" Width="166px" OnClick="btnSave_Click"  />

                                </td>
                        </tr>
                         
                    </table>
                </div>
</asp:Content>
