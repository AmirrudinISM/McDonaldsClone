<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="McDonaldClone.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-8">
            <h1>Menu</h1>
            
                <asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="True" CssClass="btn dropdown-header dropdown-toggle">
                <asp:ListItem Value="BURGER">Burger</asp:ListItem>
                <asp:ListItem Value="CHICKEN">Chicken</asp:ListItem>
                <asp:ListItem Value="DESSERT">Dessert</asp:ListItem>
                <asp:ListItem Value="DRINKS">Drinks</asp:ListItem>
            </asp:DropDownList>
           
            
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="FoodID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-hover">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="FoodID" HeaderText="Food ID" InsertVisible="False" ReadOnly="True" SortExpression="FoodID" >
                    <HeaderStyle ForeColor="#666666" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FoodName" HeaderText="Name" SortExpression="FoodName" >
                    <HeaderStyle ForeColor="#666666" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FoodPrice" HeaderText="Price" SortExpression="FoodPrice" DataFormatString="{0:c2}" >
                    <HeaderStyle ForeColor="#666666" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FoodDescription" HeaderText="Description" SortExpression="FoodDescription" >
                    <HeaderStyle ForeColor="#666666" />
                    </asp:BoundField>
                    <asp:ImageField DataImageUrlField="FoodImage" DataImageUrlFormatString="McDonald_Menu_Images/{0}" HeaderText="Image">
                        <ControlStyle Width="120px" />
                    </asp:ImageField>
                </Columns>
            </asp:GridView>
    
            <asp:Label ID="Label5" runat="server" Text="Item selected:"></asp:Label>
            <br />
    
            <asp:Label ID="lblSelectedItem_ID" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="lblSelectedItem_Name" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="lblSelectedItem_Price" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="lblQuantity" runat="server" Text="Quantity: "></asp:Label>
            <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" Text="0"></asp:TextBox><asp:Button ID="addToCart" runat="server" Text="Add to Cart" OnClick="addToCart_Click" />
            <br />
            <asp:Label ID="lblErrorMessage1" runat="server" Text=""></asp:Label>
        </div>
        <div class="col-md-auto">
            <h4>Sales Cart</h4>  
            <asp:GridView ID="GridViewCart" runat="server" DataSourceID="SqlDataSourceCart" AutoGenerateColumns="False" CssClass="table table-sm">
                <Columns>
                    <asp:BoundField DataField="FoodID" HeaderText="FoodID" SortExpression="FoodID" />
                    <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                    <asp:BoundField DataField="FoodPrice" HeaderText="FoodPrice" SortExpression="FoodPrice" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" ReadOnly="True" SortExpression="SubTotal" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="Label1" runat="server" Text="Subtotal: " CssClass="text-left"></asp:Label>
            <asp:Label ID="lblSubtotal" runat="server" Text="" CssClass="text-right"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Service charge (10%): " CssClass="text-left"></asp:Label>
            <asp:Label ID="lblServiceCharge" runat="server" Text="" CssClass="text-right"></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Service tax (6%): " CssClass="text-left"></asp:Label>
            <asp:Label ID="lblServiceTax" runat="server" Text="" CssClass="text-right"></asp:Label >
            <br />
            <h5>
                <asp:Label ID="Label4" runat="server" Text="Grand total: " CssClass="text-left"></asp:Label>
                <asp:Label ID="lblGrandTotal" runat="server" CssClass="text-right" ForeColor="#00CC00"></asp:Label>
            </h5>
            
            <br />
            <asp:Button ID="btnConfirm" runat="server" OnClick="btnConfirm_Click" Text="Confirm Order" />
            <asp:Button ID="btnClearCart" runat="server" Text="Empty Cart" OnClick="btnClearCart_Click" />
            <br />
            <asp:Label ID="lblErrorMessage2" runat="server" Text=""></asp:Label>
        </div>
    </div>
    
    <asp:SqlDataSource ID="SqlDataSourceCart" runat="server" ConnectionString="<%$ ConnectionStrings:connMcDonalds %>" SelectCommand="spGetCartList" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connMcDonalds %>" SelectCommand="SELECT * FROM [FoodItem] WHERE ([FoodCategory] = @FoodCategory)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCategories" Name="FoodCategory" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
