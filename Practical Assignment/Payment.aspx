<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Practical_Assignment.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .width1 {
            width: 20%;
        }
      
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">

    <p>
        Delivery Address</p>
    <table style="width:100%">
        <tr>
            <td style="width:90%"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
            <td><asp:LinkButton ID="EditAddress" runat="server" OnClick="EditAddress_Click">Edit</asp:LinkButton></td>
        </tr>
    </table>
    

    <table class="auto-style1">
                <tr>
                    <td class="width1" style="font-weight: bold">
                        Draw ID
                    </td>

                    <td class="width1" style="font-weight: bold">
                        Image
                    </td>

                    <td class="width1" style="font-weight: bold">
                        Name
                    </td>
                    <td class="width1" style="font-weight: bold">
                        Price
                    </td>
                    <td class="width1" style="font-weight: bold">
                        Customer ID
                    </td>
                    <td class="width1" style="font-weight: bold">
                        Buy
                    </td>
                    <td class="width1" style="font-weight: bold">
                        Delete
                    </td>
                 </tr>
          </table>

    <asp:DataList ID="DataList1" runat="server"  DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound" Width="100%">
        <ItemTemplate>
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:Label class="width1" ID="Label2" runat="server" Text='<%# Eval("DrawID") %>'></asp:Label>
                    </td>

                    <td>
                        <asp:Label class="width1" ID="Label3" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </td>

                    <td>
                        <asp:Image class="width1" ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="100px" Width="100px"/>
                    </td>

                    <td>
                        <asp:Label class="width1" ID="Label6" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                    </td>

                    <td>
                        <asp:Label class="width1" ID="Label5" runat="server" Text='<%# String.Format("RM {0:0.00}",Eval("TotalPrice")) %>'></asp:Label>

                    </td>
                </tr>
            </table>

        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT CheckOut.DrawID, CheckOut.Quantity, CheckOut.TotalPrice, Gallery.Image, Gallery.Name, Gallery.Price FROM CheckOut INNER JOIN Gallery ON CheckOut.DrawID = Gallery.DrawID"></asp:SqlDataSource>
    <br />
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
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter a valid expired date." SetFocusOnError="True" ForeColor="Red" ControlToValidate="Textbox3" ValidationExpression="^\d{0,2}(\/\d{1,2})?$"></asp:RegularExpressionValidator>
        <br />
     </div>
    <asp:Button ID="btnConfirm" runat="server" Text="Confirm Purchase" OnClick="btnConfirm_Click" />

</asp:Content>
