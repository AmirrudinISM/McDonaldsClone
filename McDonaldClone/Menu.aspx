<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="McDonaldClone.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/StyleSheet1.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="left">
        <h1>Menu</h1>
        <asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="True">
            <asp:ListItem Value="BURGER">Burger</asp:ListItem>
            <asp:ListItem Value="CHICKEN">Chicken</asp:ListItem>
            <asp:ListItem Value="DESSERT">Dessert</asp:ListItem>
            <asp:ListItem Value="DRINKS">Drinks</asp:ListItem>
        </asp:DropDownList>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="FoodID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="FoodID" HeaderText="FoodID" InsertVisible="False" ReadOnly="True" SortExpression="FoodID" />
                <asp:BoundField DataField="FoodCategory" HeaderText="FoodCategory" SortExpression="FoodCategory" />
                <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                <asp:BoundField DataField="FoodPrice" HeaderText="FoodPrice" SortExpression="FoodPrice" DataFormatString="{0:c2}" />
                <asp:BoundField DataField="FoodDescription" HeaderText="FoodDescription" SortExpression="FoodDescription" />
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
    <div class="receipt">
        <h4>Sales Cart</h4>  
        <asp:GridView ID="GridViewCart" runat="server" DataSourceID="SqlDataSourceCart" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="FoodID" HeaderText="FoodID" SortExpression="FoodID" />
                <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                <asp:BoundField DataField="FoodPrice" HeaderText="FoodPrice" SortExpression="FoodPrice" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" ReadOnly="True" SortExpression="SubTotal" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="Label1" runat="server" Text="Subtotal: "></asp:Label>
        <asp:Label ID="lblSubtotal" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Service charge (10%): "></asp:Label>
        <asp:Label ID="lblServiceCharge" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Service tax (6%): "></asp:Label>
        <asp:Label ID="lblServiceTax" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Grand total: "></asp:Label>
        <asp:Label ID="lblGrandTotal" runat="server" Text=""></asp:Label>
        <br />
        <asp:Button ID="btnConfirm" runat="server" OnClick="btnConfirm_Click" Text="Confirm Order" />
        <asp:Button ID="btnClearCart" runat="server" Text="Empty Cart" />
        <br />
        <asp:Label ID="lblErrorMessage2" runat="server" Text=""></asp:Label>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceCart" runat="server" ConnectionString="<%$ ConnectionStrings:connMcDonalds %>" SelectCommand="spGetCartList" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connMcDonalds %>" SelectCommand="SELECT * FROM [FoodItem] WHERE ([FoodCategory] = @FoodCategory)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCategories" Name="FoodCategory" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
