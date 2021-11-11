<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="McDonaldClone.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Register New Account</h1>
    <div class="col-4">
        <p>Email: <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox></p>
        <p>Password: <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox></p>
        <br />
        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
    </div>
    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
    
    
</asp:Content>
