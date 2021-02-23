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
            margin:0% 25% 0% 25%;
            background-color: white;
        }
        .btnType{
            text-align:center;
        }


         .auto-style3 {
             margin: 0 450px ;
         }


        </style>

    <% if (Session["Value"] == "0" || Session["Value"] == null)
          { %>
                <div>
                    <p style="text-align:center; font-size:x-large">Please register / sign in first.</p>
                   <asp:Button ID="btnRegister" runat="server" Text="Register" style="border-color: #4D94FF; background-color: white; color: #284E98; Font-Size:x-large; text-align:center;" OnClick="btnRegister_Click" Width="527px" CssClass="auto-style3"/>
                    
                 </div>
            
        <%}
          else{ %>
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
                                Username:<asp:Label ID="lblUsername" runat="server" Text="[username]"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Email:<asp:Label ID="lblEmail" runat="server" Text="[email]"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                
                                Password:<asp:Label ID="lblPassword" runat="server" Text="[password]"></asp:Label>
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                    
                                Phone No:
                                <asp:Label ID="lblPhoneNo" runat="server" Text="Label"></asp:Label>
                    
                            </td>
                        </tr>
            
                        <tr>
                            <td class="auto-style2">
              
                                <asp:Label ID="lblAddress" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
            
                        <tr>
                            <td class="auto-style2"></td>
                        </tr>
                        <tr>
                            <td class="auto-style2" style="text-align: center">
                                <asp:Button ID="EditProfile" runat="server" Text="Edit Profile" Width="166px" OnClick="EditProfile_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnSignOut" runat="server" Text="Sign Out" style="border-color: #4D94FF; 
                                background-color: white; color: #284E98;" OnClick="btnSignOut_Click" width="240px" Height="30px" /></td>
                        </tr>
                         
                    </table>
                </div>
                 
          <%} %>

</asp:Content>
