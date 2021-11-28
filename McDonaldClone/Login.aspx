<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="McDonaldClone.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <br />
    <div class="col-6 card">
        <h3>Welcome. Please login to start ordering.</h3>
        
        <div class="form-group">
            <p>Email: <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox></p>
        </div>
        <div class="form-group">
           <p>Password: <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox></p>
        </div>
        <p><asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-primary" /> Order as <a href="Menu.aspx" class="text-primary">guest.</a></p>
        <asp:Label ID="lblloginStatus" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
