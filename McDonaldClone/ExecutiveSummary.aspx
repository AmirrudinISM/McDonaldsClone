<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ExecutiveSummary.aspx.cs" Inherits="McDonaldClone.ExecutiveSummary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Executive Summary</h1>
    <p>Lifetime Revenue: <asp:Label ID="lblRevenue" runat="server" Text=""></asp:Label></p>
    <p>Total Registered Customers: <asp:Label ID="lblCustomerCount" runat="server" Text=""></asp:Label></p>
    <h3>Most Popular Products</h3>
    <p>Main: <asp:Label ID="lblMainName" runat="server" Text=""></asp:Label></p>
    <p>Dessert: <asp:Label ID="lblDessertName" runat="server" Text=""></asp:Label></p>
    <p>Drink: <asp:Label ID="lblDrinkName" runat="server" Text=""></asp:Label></p>
</asp:Content>
