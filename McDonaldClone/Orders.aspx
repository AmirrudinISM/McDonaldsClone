<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="McDonaldClone.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSourceOrders" runat="server" ConnectionString="<%$ ConnectionStrings:connMcDonalds %>" SelectCommand="SELECT Orders.OrderID, Orders.OrderDateTime, Orders.OrderPrice, Users.UserName  
FROM [Orders]
LEFT JOIN Users ON Orders.CustomerID = Users.UserID"></asp:SqlDataSource>
    <asp:GridView ID="GridViewOrderList" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSourceOrders" OnSelectedIndexChanged="GridViewOrderList_SelectedIndexChanged" DataKeyNames="OrderID" CssClass="table table-hover" AutoGenerateColumns="False">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
            <asp:BoundField DataField="OrderDateTime" HeaderText="OrderDateTime" SortExpression="OrderDateTime" />
            <asp:BoundField DataField="OrderPrice" HeaderText="OrderPrice" SortExpression="OrderPrice" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
        </Columns>
    </asp:GridView>
    <b>Order ID: <asp:Label ID="lblOrderID" runat="server" Text=""></asp:Label></b>
    <br />
    <b>Customer Name: </b><asp:Label ID="lblCustomerName" runat="server" Text=""></asp:Label>
    <br />
    <asp:GridView ID="GridViewOrderDetail" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceOrderDetail" CssClass="table table-light">
        <Columns>
            <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
        </Columns>
    </asp:GridView>
    <b>Subtotal : </b><asp:Label ID="lblSubtotal" runat="server" Text=""></asp:Label>
    <br />
    <b>Service charge (10%): </b><asp:Label ID="lblServiceCharge" runat="server" Text=""></asp:Label>
    <br />
    <b>Service tax (6%): </b><asp:Label ID="lblServiceTax" runat="server" Text=""></asp:Label>
    <br />
    <b>Total amount before rounding: </b><asp:Label ID="lblTotalAmountBeforeRounding" runat="server" Text=""></asp:Label>
    <br />
    <b>Rounding: </b><asp:Label ID="lblRounding" runat="server" Text=""></asp:Label>
    <br />
    <b>Grand Total: </b><asp:Label ID="lblGrandTotal" runat="server" Font-Size="Large" ForeColor="#009933"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSourceOrderDetail" runat="server" ConnectionString="<%$ ConnectionStrings:connMcDonalds %>" SelectCommand="SELECT FoodItem.FoodName, OrderDetail.Quantity 
FROM OrderDetail
INNER JOIN FoodItem ON OrderDetail.FoodID = FoodItem.FoodID
WHERE OrderID = @orderid">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewOrderList" Name="orderid" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
