<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditProfilePicture.aspx.cs" Inherits="Practical_Assignment.EditProfilePicture" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

         <style type="text/css">
        .auto-style2 {
            height: 50px;
            width:300px;
            padding-left:80px;
            
            border-right:1px solid black;
        }

        .profilePic{
            margin:10%;
        }

        .tableFormat {
            border-collapse: collapse;
            border: 1px solid grey;
            height: auto;
            width :1000px;
            margin-left: auto;
            margin-right: auto;
            margin-bottom:200px;
            margin-top:100px;
            background-color: rgb(224, 226, 224);
        }
        .btnType{
            text-align:center;
        }


         .auto-style6 {
             height: 50px;
             padding-left: 5px;
             width: 236px;
         }
    </style>
    </asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    <h1 style="text-align:center">Edit Profile Picture</h1><hr />
    <div>
              <table class="tableFormat">
                    <tr>
                        <td class="auto-style2" >
                            

                               
                            <br /><br /><br /><h2>Account Settings</h2><br />
                            
                                <asp:Button ID="btnProfile" runat="server" Text="Profile" Width="240px"  Height="30px" style="border-color: #4D94FF; 
                                background-color: white; color: #284E98;" OnClick="btnProfile_Click" /><br />
                            <br />
                                <asp:Button ID="EditProfilePic" runat="server" Text="Change Profile Picture" Width="240px"  Height="30px" style="border-color: #4D94FF; 
                                background-color: white; color: #284E98;" OnClick="EditProfilePic_Click"  />
                            <br /><br />
                                <asp:Button ID="EditProfile" runat="server" Text="Account Privacy setting" Width="240px"  Height="30px" style="border-color: #4D94FF; 
                                background-color: white; color: #284E98;" OnClick="EditProfile_Click" />


                            </td>
                        <td class="auto-style6" rowspan="10">
                            

                               

                            
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>">
                         <SelectParameters>
                             <asp:SessionParameter Name="ArtistID" SessionField="Value" />
                             <asp:SessionParameter Name="CustomerID" SessionField="Value" />
                        </SelectParameters>
                            </asp:SqlDataSource>

                            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound">
                                <ItemTemplate>

                                    
                                    <asp:Image ID="Image1" Width="200"  Height="250" CssClass="profilePic" runat="server" ImageUrl='<%# Eval("ProfilePicture") %>' />
                                    
                                    <br />
                                    <br />

                                </ItemTemplate>

                            </asp:DataList>


                            <asp:FileUpload ID="FileUpload1" runat="server" accept="image/*"/>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="FileUpload1" ValidationGroup="va1" ForeColor="red" Font-Size="small"></asp:RequiredFieldValidator>
                            <asp:Button ID="Change" runat="server" Text="Change" ValidationGroup="va1" OnClick="Change_Click" style="height: 35px" />


                            </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" >
                            

                               
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2" >
                            

                               
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2" >
                            

                               
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2" >
                            

                               
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2" >
                            

                               
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            

                               

                            
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            

                               

                            
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            

                               

                            
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            

                               

                            
                            &nbsp;</td>
                    </tr>
                    <tr>
                            <td class="auto-style2">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2" style="text-align: center">
                                

                                &nbsp;</td>
                          
                            <td class="auto-style6" style="text-align: center">
                                

                                <asp:Button ID="btnSignOut" runat="server" Text="Sign Out" style="margin-right:50px; border-color: #4D94FF; 
                                background-color: white; color: #284E98;" OnClick="btnSignOut_Click" width="240px" Height="30px" />  

                                </td>
                          
                        </tr>
                         
                    </table>
                </div>
 
</asp:Content>
