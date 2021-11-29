<%@ Page Title="User Accounts" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Accounts.aspx.cs" Inherits="McDonaldClone.Accounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Registered Customers</h1>
    <asp:SqlDataSource ID="SqlDataSourceAccounts" runat="server" ConnectionString="<%$ ConnectionStrings:connMcDonalds %>" SelectCommand="SELECT [UserName], [UserID] FROM [Users] WHERE IsAdmin = 0"></asp:SqlDataSource>
    <p class="text-primary"><a href="ExecutiveSummary.aspx">Return to home</a></p>
    <asp:GridView ID="GridViewCustomers" runat="server" CssClass="table" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAccounts" DataKeyNames="UserID" OnSelectedIndexChanged="GridViewCustomers_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass="text-primary" />
            <asp:BoundField DataField="UserID" HeaderText="User ID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
            <asp:BoundField DataField="UserName" HeaderText="Username" SortExpression="UserName" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceOrdersFromSelectedAccount" runat="server" ConnectionString="<%$ ConnectionStrings:connMcDonalds %>" SelectCommand="SELECT [OrderID], [OrderDateTime], [OrderPrice] FROM [Orders] WHERE ([CustomerID] = @CustomerID) ORDER BY [OrderDateTime] DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewCustomers" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <hr />
    <h5>Customer:
        <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label></h5>
    <asp:GridView ID="GridViewOrders" runat="server" CssClass="table" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="SqlDataSourceOrdersFromSelectedAccount" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridViewOrders_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass="text-primary">
                <ControlStyle CssClass="text-primary"></ControlStyle>
            </asp:CommandField>
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
            <asp:BoundField DataField="OrderDateTime" HeaderText="Order Date &amp; Time" SortExpression="OrderDateTime" />
            <asp:BoundField DataField="OrderPrice" HeaderText="Price (RM)" SortExpression="OrderPrice" DataFormatString="{0:c}" />
        </Columns>
    </asp:GridView>
    <hr />
    <div id="detail" style="display:none" runat="server">
        <h5>Order:
        <asp:Label ID="lblOrderID" runat="server" Text=""></asp:Label></h5>
        <asp:SqlDataSource ID="SqlDataSourceSelectedOrder" runat="server" ConnectionString="<%$ ConnectionStrings:connMcDonalds %>" SelectCommand="SELECT FoodItem.FoodName, OrderDetail.Quantity FROM OrderDetail INNER JOIN FoodItem ON OrderDetail.FoodID = FoodItem.FoodID
WHERE OrderDetail.OrderID = @orderid">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridViewOrders" Name="orderid" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridViewOrderDetails" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="SqlDataSourceSelectedOrder">
            <Columns>
                <asp:BoundField DataField="FoodName" HeaderText="Food Name" SortExpression="FoodName" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
