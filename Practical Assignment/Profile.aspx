<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Practical_Assignment.Profile" %>
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
            margin-left: auto;
            margin-right: auto;
            margin-bottom:200px;
            margin-top:100px;
            background-color: rgb(224, 226, 224);
        }
        .btnType{
            text-align:center;
        }


         .auto-style4 {
             height: 25px;
         }


         .auto-style6 {
             height: 50px;
             padding-left: 5px;
             width: 236px;
         }


        </style>

    <h1 style="text-align:center">Profile</h1><hr />

    <% if (Session["Value"] == "0" || Session["Value"] == null)
          { %>
    <table class="tableFormat">
        <tr>
            <td class="auto-style4">
                    <p style="text-align:center; font-size:x-large">Please register / sign in first.</p>
                   </td>
        </tr>
        <tr>
            <td class="auto-style4">
                    &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center">
                   <asp:Button ID="btnSignIn" runat="server" Text="Sign In" style="border-color: #4D94FF; background-color: white; color: #284E98; Font-Size:x-large; text-align:center;"  Width="527px" OnClick="btnSignIn_Click"/>
                    
                
            
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                   &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center">
                   <asp:Button ID="btnRegister" runat="server" Text="Register" style="border-color: #4D94FF; background-color: white; color: #284E98; Font-Size:x-large; text-align:center;" OnClick="btnRegister_Click" Width="527px"/>
                    
                
            
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                   &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align:center">
                   &nbsp;</td>
        </tr>
    </table>
                    
                
            
        <%}
          else{ %>
            <div>
              <table class="tableFormat">
                    <tr>
                            <td class="auto-style2" colspan="2"></td>
                    </tr>
                    <tr>
                            <td class="auto-style6">
                                Username:</td>
                            <td class="auto-style2">
                                <asp:Label ID="lblUsername" runat="server" Text="[username]"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6">Email:</td>
                            <td class="auto-style2"><asp:Label ID="lblEmail" runat="server" Text="[email]"></asp:Label></td>
                        </tr>
       
                        <tr>
                            <td class="auto-style6">
                    
                                Phone No:
                                                    
                            </td>
                            <td class="auto-style2">
                    
                                <asp:Label ID="lblPhoneNo" runat="server" Text="Label"></asp:Label>
                    
                            </td>
                        </tr>
            
                        <tr>
                            <td class="auto-style2">
              
                        <% if (Session["Bar"] == "C")
                             { %>
                                Delivery Address: 
            
                              <%} 
                         %></td>
                            <td class="auto-style2">
              
                                <asp:Label ID="lblAddress" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
            
                        <tr>
                            <td class="auto-style2" colspan="2"></td>
                        </tr>
                        <tr>
                            <td class="auto-style2" style="text-align: center" colspan="2">
                                

                                <asp:Button ID="btnSignOut" runat="server" Text="Sign Out" style="margin-right:50px; border-color: #4D94FF; 
                                background-color: white; color: #284E98;" OnClick="btnSignOut_Click" width="240px" Height="30px" />  

                                <asp:Button ID="EditProfile" runat="server" Text="Edit Profile" Width="240px"  Height="30px" style="border-color: #4D94FF; 
                                background-color: white; color: #284E98;" OnClick="EditProfile_Click" /></td>
                          
                        </tr>
                         
                    </table>
                </div>
                 
          <%} %>

</asp:Content>
