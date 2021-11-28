﻿<%@ Page Title="Menu" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="McDonaldClone.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Menu</title>
    <style type="text/css">
        .auto-style1 {
            display: block;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: .25rem;
            transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Menu</h1>
    <table>
        <tr>
            <td>
                <div class="col-8">
                <asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="True" CssClass="btn dropdown-header dropdown-toggle">
                <asp:ListItem Value="BURGER">Burger</asp:ListItem>
                <asp:ListItem Value="CHICKEN">Chicken</asp:ListItem>
                <asp:ListItem Value="DESSERT">Dessert</asp:ListItem>
                <asp:ListItem Value="DRINKS">Drinks</asp:ListItem>
            </asp:DropDownList>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="FoodID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-hover" BorderStyle="None">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass="btn btn-outline-primary" />
                    <asp:BoundField DataField="FoodID" HeaderText="Food ID" InsertVisible="False" ReadOnly="True" SortExpression="FoodID" >
                    <HeaderStyle ForeColor="#666666" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FoodName" HeaderText="Name" SortExpression="FoodName" >
                    <HeaderStyle ForeColor="#666666" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FoodPrice" HeaderText="Price" SortExpression="FoodPrice" DataFormatString="{0:c2}" >
                    <HeaderStyle ForeColor="#666666" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FoodDescription" HeaderText="Description" SortExpression="FoodDescription" >
                    <HeaderStyle ForeColor="#666666" />
                    </asp:BoundField>
                    <asp:ImageField DataImageUrlField="FoodImage" DataImageUrlFormatString="McDonald_Menu_Images/{0}" HeaderText="Image">
                        <ControlStyle Width="120px" />
                    </asp:ImageField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="Label5" runat="server" Text="Item selected:"></asp:Label>
            <br />
            <asp:Label ID="lblSelectedItem_ID" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="lblSelectedItem_Name" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="lblSelectedItem_Price" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="lblQuantity" runat="server" Text="Quantity: "></asp:Label>
            <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" Text="0" CssClass="auto-style1" Width="398px" min="0"></asp:TextBox>
            <asp:Button ID="addToCart" runat="server" Text="Add to Cart" OnClick="addToCart_Click" CssClass="btn" />
            <br />
            <asp:Label ID="lblErrorMessage1" runat="server" Text="" ForeColor="Red"></asp:Label>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Please enter a number greater than 0 or enter 0 to remove from cart" Display="Dynamic" ControlToValidate="txtQuantity" MinimumValue="0" Type="Integer" MaximumValue="999" ForeColor="Red"></asp:RangeValidator>
        </div>
            </td>
            <td style="vertical-align:top; width:500px;">
                <div class="col card" style="margin-top:35px">
                    <h4>Sales Cart</h4>  
                    <asp:GridView ID="GridViewCart" runat="server" DataSourceID="SqlDataSourceCart" AutoGenerateColumns="False" CssClass="table table-sm">
                        <Columns>
                            <asp:BoundField DataField="FoodID" HeaderText="FoodID" SortExpression="FoodID" />
                            <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                            <asp:BoundField DataField="FoodPrice" HeaderText="FoodPrice" SortExpression="FoodPrice" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" ReadOnly="True" SortExpression="SubTotal" />
                        </Columns>
                    </asp:GridView>
                    <p class="text-left">Subtotal: <asp:Label ID="lblSubtotal" runat="server" Text="" CssClass="text-right"></asp:Label></p>
                    
                    <p>Service charge (10%): <asp:Label ID="lblServiceCharge" runat="server" Text="" CssClass="text-right"></asp:Label></p>
                   
                    <p>Service tax (6%): <asp:Label ID="lblServiceTax" runat="server" Text="" CssClass="text-right"></asp:Label ></p>

                    <p>Total before rounding: <asp:Label ID="lblBeforeRounding" runat="server" Text="" CssClass="text-right"></asp:Label ></p>
                    
                    <p>Rounding: <asp:Label ID="lblRounding" runat="server" Text=""></asp:Label></p>
                    <br />
                    <h5>Grand total: <asp:Label ID="lblGrandTotal" runat="server" CssClass="text-right" ForeColor="#00CC00"></asp:Label></h5>
                    
                    <asp:Button ID="btnConfirm" runat="server" OnClick="btnConfirm_Click" Text="Confirm Order" CssClass="btn btn-primary" />
                    <br />
                    <asp:Button ID="btnClearCart" runat="server" Text="Empty Cart" OnClick="btnClearCart_Click" CssClass="btn btn-secondary" />
                    <br />
                    <asp:Label ID="lblErrorMessage2" runat="server" Text=""></asp:Label>
                </div>
            </td>
        </tr>
    </table>
    <div class="row">
        
        
    </div>
    
    <asp:SqlDataSource ID="SqlDataSourceCart" runat="server" ConnectionString="<%$ ConnectionStrings:connMcDonalds %>" SelectCommand="spGetCartList" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connMcDonalds %>" SelectCommand="SELECT * FROM [FoodItem] WHERE ([FoodCategory] = @FoodCategory)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCategories" Name="FoodCategory" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
