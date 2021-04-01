<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Practical_Assignment.Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
    <style>
        
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Display" runat="server">

    <h1 style="text-align:center;">Photo Gallery</h1><br />
    
    <hr />
              <div class="container">
                
                <asp:LinkButton ID="ShowAll" runat="server" OnClick="ShowAll_Click" CssClass="linkBtn">Show All</asp:LinkButton><br />
                <asp:LinkButton ID="DrawingFilter" runat="server" OnClick="LinkButton1_Click" CssClass="linkBtn">Drawing</asp:LinkButton><br />
                <asp:LinkButton ID="SculptureFilter" runat="server" OnClick="SculptureFilter_Click" CssClass="linkBtn">Sculpture</asp:LinkButton><br />
                <asp:LinkButton ID="Painting" runat="server" OnClick="Painting_Click" CssClass="linkBtn">Painting</asp:LinkButton>
             </div>

 
    <table>
        <tr>

            <td>
                <link href="Gallery.css" rel="stylesheet" type="text/css" />
   

                <div style="width:1200px ; font-size:20px ;margin-left: 33% ; margin-right :auto; margin-bottom:5% ; background-color:lightgray">
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" CellPadding="50" RepeatColumns="2" RepeatDirection="Horizontal" OnItemDataBound="DataList1_ItemDataBound" OnItemCommand="DataList1_ItemCommand"  AllowPaging="true" PageSize ="2">
                        <ItemTemplate>
                  
                            <asp:Image ID="Image1" CssClass="Img" runat="server" ImageUrl='<%# Eval("Image") %>' />
                            <br />
                            <br/>
                            <a style="margin-left: 10px">Artist:</a><asp:Label ID="Label3" runat="server" Text='<%# Eval("Name") %>' ></asp:Label>
                            <br />
                            <a style="margin-left: 10px">Description:</a><asp:Label ID="Label1" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                            <br/>
                            <a style="margin-left: 10px">Price:</a><asp:Label ID="Label2" runat="server" Text='<%#Eval("Price") %>'></asp:Label>
                            <br />
                            <br/>
                            <asp:Button CssClass="Button" ID="Button7" runat="server" Text="Buy" CommandName="BuyDrawing" CommandArgument='<%# Eval("DrawID") %>'/>&nbsp
                            <asp:Button CssClass="Button" ID="Button1" runat="server" Text="Add to cart" CommandName="AddToCart" CommandArgument='<%# Eval("DrawID") %>'/>&nbsp
                            <asp:Button CssClass="Button" ID="Button15" runat="server" Text="Add to Wishlist" CommandName="Wishlist" CommandArgument='<%# Eval("DrawID") %>'/>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="">
                        <%--<SelectParameters>
                                <asp:Parameter DefaultValue="" Name="Category" Type="String" />
                        </SelectParameters>--%>
                     </asp:SqlDataSource>
                        
                </div>
    </td>
   </tr>
 </table>
    
</asp:Content>
