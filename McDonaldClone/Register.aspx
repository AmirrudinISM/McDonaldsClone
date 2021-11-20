<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="McDonaldClone.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Register</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Register New Account</h3>
    <div>
        <p><asp:Label ID="lblStatus" runat="server" Text=""></asp:Label></p>
    </div>
    <form>
        <div class="col-4">
            <p>Email: <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox></p>
            <asp:RequiredFieldValidator ID="rvalidUserName" runat="server" ErrorMessage="Email cannot be empty" ControlToValidate="txtUserName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            <p>Password: <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox></p>
            <asp:RequiredFieldValidator ID="rvalidPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
        </div>
    </form>
    <br />
    <br />
    
    
    
    
</asp:Content>
