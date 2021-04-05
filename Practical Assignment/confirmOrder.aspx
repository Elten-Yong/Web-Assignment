<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="confirmOrder.aspx.cs" Inherits="Practical_Assignment.confirmOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 125px;
        }
        .myButton {
	        box-shadow:inset 0px 1px 0px 0px #9acc85;
	        background:linear-gradient(to bottom, #74ad5a 5%, #68a54b 100%);
	        border-radius:3px;
	        border:1px solid #3b6e22;
	        display:inline-block;
	        cursor:pointer;
	        color:#ffffff;
	        font-family:Arial;
	        font-size:13px;
	        font-weight:bold;
	        padding:6px 12px;
	        text-decoration:none;
        }
        .myButton:hover {
	        background:linear-gradient(to bottom, #68a54b 5%, #74ad5a 100%);
	        background-color:#68a54b;
        }
        .myButton:active {
	        position:relative;
	        top:1px;
        }

        .myButton1 {
	        box-shadow:inset 0px 1px 0px 0px #cf866c;
	        background:linear-gradient(to bottom, #d0451b 5%, #bc3315 100%);
	        background-color:#d0451b;
	        border-radius:3px;
	        border:1px solid #942911;
	        display:inline-block;
	        cursor:pointer;
	        color:#ffffff;
	        font-family:Arial;
	        font-size:13px;
	        padding:6px 12px;
            font-weight:bold;
	        text-decoration:none;
	        text-shadow:0px 1px 0px #854629;
        }
        }
        .myButton1:hover {
	        background:linear-gradient(to bottom, #bc3315 5%, #d0451b 100%);
	        background-color:#bc3315;
        }
        .myButton1:active {
	        position:relative;
	        top:1px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">
    <div style="margin:0 10%">
        <table style="width:100%">
            <tr>
                <td style="width:90%"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
                <td>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Edit</asp:LinkButton></td>
            </tr>
        </table>
        
    <asp:DataList ID="DataList1" runat="server" DataKeyField="DrawID" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
            <table class="auto-style1">
         <!--       <tr>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text='<%# Eval("DrawID") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <a style="margin-left: 10px">Artist:</a><asp:Label ID="Label2" runat="server" Font-Size="Large" Text='<%# Eval("Name") %>'></asp:Label>
                    </td>
                </tr>
                <tr>-->
                    <td class="auto-style2" colspan="2">
                        <asp:Image ID="Image1" runat="server" Height="213px" ImageUrl='<%# Eval("Image") %>' Width="199px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <a style="margin-left: 10px">Name:</a><asp:Label ID="Label3" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <a style="margin-left: 10px">Description:</a><asp:Label ID="Label4" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <a style="margin-left: 10px">Price:</a><asp:Label ID="Label5" runat="server" Text='<%# String.Format("RM {0:0.00}",Eval("Price")) %>'></asp:Label>
                    </td>
                </tr>
            <!--    <tr>
                    <td colspan="2"><asp:Label ID="Label6" runat="server" Text='<%# Eval("Total") %>'></asp:Label></td>
                </tr> -->
                
            </table>
            
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [DrawID], [Name], [Description], [Price], [Image], [Total] FROM [Gallery] WHERE ([DrawID] = @DrawID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="DrawID" QueryStringField="id" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
        <p>Select Payment method</p>
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="true">
        <asp:ListItem>Master/Visa Card</asp:ListItem>
        <asp:ListItem>Online Banking</asp:ListItem>
    </asp:RadioButtonList>
    <div runat="server" id="CreditDetail" Visible="False" >
        <p> Card No : </p><asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*This field is required." SetFocusOnError="True" ForeColor="Red" ControlToValidate="Textbox1"></asp:RequiredFieldValidator>
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter a valid card no." SetFocusOnError="True" ForeColor="Red" ControlToValidate="Textbox1" ValidationExpression="\d{4}(\-\d{4}(\-\d{4}(\-\d{4})))"></asp:RegularExpressionValidator>
       
        <p> CVV : </p> <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*This field is required." SetFocusOnError="True" ForeColor="Red" ControlToValidate="Textbox2"></asp:RequiredFieldValidator>
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter a cvv no." SetFocusOnError="True" ForeColor="Red" ControlToValidate="Textbox2" ValidationExpression="^\d{3}"></asp:RegularExpressionValidator>
        
        <p> Expired Date : </p> <asp:TextBox ID="TextBox3" runat="server"  ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*This field is required." SetFocusOnError="True" ForeColor="Red" ControlToValidate="Textbox3"></asp:RequiredFieldValidator>
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter a valid expired date." SetFocusOnError="True" ForeColor="Red" ControlToValidate="Textbox3" ValidationExpression="^\d{0,2}(\/\d{1,2})"></asp:RegularExpressionValidator>
        <br />
     </div>
        <asp:Button ID="Button2" runat="server" Text="Confirm payment" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Cancel" />
    </div>
</asp:Content>
