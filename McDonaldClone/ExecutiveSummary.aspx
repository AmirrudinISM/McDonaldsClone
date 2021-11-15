<%@ Page Title="Executive Summary" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ExecutiveSummary.aspx.cs" Inherits="McDonaldClone.ExecutiveSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Executive Summary</h1>
    <p>
        Lifetime Revenue:
        <asp:Label ID="lblRevenue" runat="server" Font-Size="Large" ForeColor="#00CC00"></asp:Label>
    </p>
    <p class="text-primary"><a href="Orders.aspx">View all orders</a></p>
    <p>
        Total Registered Customers:
        <asp:Label ID="lblCustomerCount" runat="server" Text=""></asp:Label>
    </p>
    <p class="text-primary"><a href="Accounts.aspx">View all customers</a></p>
    <h3>Most Popular Products</h3>
    <table>
        <tr>
            <td>
                <h4>Burger:</h4>
            </td>
            <td>
                <asp:Label ID="lblBurgerName" runat="server" Font-Bold="True"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <h4>Sold:</h4>
            </td>
            <td>
                <asp:Label ID="lblBurgerCount" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <h4>Chicken:</h4>
            </td>
            <td>
                <asp:Label ID="lblChickenName" runat="server" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <h4>Sold:</h4>
            </td>
            <td>
                <asp:Label ID="lblChickenCount" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <h4>Dessert:</h4>
            </td>
            <td>
                <asp:Label ID="lblDessertName" runat="server" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <h4>Sold:</h4>
            </td>
            <td>
                <asp:Label ID="lblDessertCount" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <h4>Drinks:</h4>
            </td>
            <td>
                <asp:Label ID="lblDrinkName" runat="server" Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <h4>Sold:</h4>
            </td>
            <td>
                <asp:Label ID="lblDrinkCount" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    <hr />
    <h2>Overall Sales of Items</h2>
    <asp:GridView ID="GridViewAllFoodCount" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceSummary" CssClass="table">
        <Columns>
            <asp:BoundField DataField="FoodName" HeaderText="Food Name" SortExpression="FoodName" />
            <asp:BoundField DataField="TotalSold" HeaderText="Total Sold" ReadOnly="True" SortExpression="TotalSold" NullDisplayText="0" />
            <asp:BoundField DataField="TotalRevenue" DataFormatString="{0:c}" HeaderText="Total Revenue" ReadOnly="True" SortExpression="TotalRevenue" NullDisplayText="RM0.00" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceSummary" runat="server" ConnectionString="<%$ ConnectionStrings:connMcDonalds %>" SelectCommand="SELECT FoodItem.FoodName,SUM(FoodItem.FoodPrice * OrderDetail.Quantity) AS TotalRevenue, SUM(OrderDetail.Quantity) AS TotalSold
FROM FoodItem 
LEFT JOIN OrderDetail ON OrderDetail.FoodID = FoodItem.FoodID
GROUP BY FoodName"></asp:SqlDataSource>
    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
</asp:Content>
