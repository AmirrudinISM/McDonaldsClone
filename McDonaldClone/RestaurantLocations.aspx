<%@ Page Title="Locations" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RestaurantLocations.aspx.cs" Inherits="McDonaldClone.RestaurantLocations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/GoogleMapsStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Dine With Us!</h1>
    <h3>Use the map below to look for any nearby restaurants.</h3>
    <iframe width="800" height="450" style="border: 0" loading="lazy" allow="fullscreen" runat="server" src="" id="mapFrame"></iframe>
    
</asp:Content>
