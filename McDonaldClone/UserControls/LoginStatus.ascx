<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginStatus.ascx.cs" Inherits="McDonaldClone.UserControls.LoginStatus" %>
<div style="width:100%">
    <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label>&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx" CssClass="text-primary">Login</asp:HyperLink>&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Register.aspx" CssClass="text-primary">Register</asp:HyperLink>&nbsp;&nbsp;
    <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-light" BorderColor="Black" BorderStyle="Solid" OnClick="btnLogout_Click" />
</div>
