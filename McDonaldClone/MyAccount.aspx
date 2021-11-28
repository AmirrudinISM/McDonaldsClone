<%@ Page Title="My Account" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="McDonaldClone.MyAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>My Account</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>My Account</h1>
    <asp:SqlDataSource ID="SqlDataSourceCustomerOrders" runat="server" ConnectionString="<%$ ConnectionStrings:connMcDonalds %>" SelectCommand="SELECT * FROM Orders WHERE CustomerID = @customerid ORDER BY OrderDateTime DESC">
        <SelectParameters>
            <asp:SessionParameter Name="customerid" SessionField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCustomerOrderDetails" runat="server" ConnectionString="<%$ ConnectionStrings:connMcDonalds %>" SelectCommand="SELECT FoodItem.FoodName, OrderDetail.Quantity FROM FoodItem INNER JOIN OrderDetail ON FoodItem.FoodID = OrderDetail.FoodID INNER JOIN Orders ON OrderDetail.OrderID = Orders.OrderID WHERE (OrderDetail.OrderID = @orderID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewMyOrders" Name="orderID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridViewMyOrders" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="SqlDataSourceCustomerOrders" OnSelectedIndexChanged="GridViewMyOrders_SelectedIndexChanged" CssClass="table">
        <Columns>
            <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass="btn btn-outline-primary">
                <ControlStyle CssClass="btn btn-outline-primary"></ControlStyle>
            </asp:CommandField>
            <asp:BoundField DataField="OrderID" HeaderText="Order ID" ReadOnly="True" SortExpression="OrderID" />
            <asp:BoundField DataField="OrderDateTime" HeaderText="Order Date &amp; Time" SortExpression="OrderDateTime" />
            <asp:BoundField DataField="OrderPrice" HeaderText="Price (RM)" SortExpression="OrderPrice" />
        </Columns>
    </asp:GridView>
    <hr />
    <div id="detail" style="display: none" runat="server">
        <p>
            <b>Order ID: </b>
            <asp:Label ID="lblOrderID" runat="server" Text=""></asp:Label>
        </p>
        <p>
            <b>Order Date & Time: </b>
            <asp:Label ID="lblOrderDateTime" runat="server" Text=""></asp:Label>
        </p>
        <asp:GridView ID="GridViewMyOrderDetails" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCustomerOrderDetails" CssClass="table">
            <Columns>
                <asp:BoundField DataField="FoodName" HeaderText="Food Name" SortExpression="FoodName" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            </Columns>
        </asp:GridView>

        <p>
            <b>Subtotal: </b>
            <asp:Label ID="lblSubtotal" runat="server" Text=""></asp:Label>
        </p>
        <p>
            <b>Service Charge (10%): </b>
            <asp:Label ID="lblServiceCharge" runat="server" Text=""></asp:Label>
        </p>
        <p>
            <b>Service Tax (6%): </b>
            <asp:Label ID="lblServiceTax" runat="server" Text=""></asp:Label>
        </p>
        <p>
            <b>Total Before Rounding: </b>
            <asp:Label ID="lblTotalBeforeRounding" runat="server" Text=""></asp:Label>
        </p>
        <p>
            <b>Rounding: </b>
            <asp:Label ID="lblRounding" runat="server" Text=""></asp:Label>
        </p>
        <p>
            <b>Grand total: </b>
            <asp:Label ID="lblGrandTotal" runat="server" Text=""></asp:Label>
        </p>
    </div>

</asp:Content>
