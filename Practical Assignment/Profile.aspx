<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Practical_Assignment.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">


     <style type="text/css">
        .auto-style1 {
            height: 26px;
            text-decoration:underline;

        }
        .auto-style2 {
            height: 50px;
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

 <table class="tableFormat">
            <tr style ="border:50px">
                <td ><h1 style="text-align: center">
                    Profile</h1></td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    Username:</td>
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
                    
                </td>
            </tr>
            
            <tr>
                <td class="auto-style2">
                    Password:</td>
            </tr>
            
            <tr>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    Confirm Password:</td>
            </tr>
             <tr>
               
            </tr>
            
        </table>

</asp:Content>
