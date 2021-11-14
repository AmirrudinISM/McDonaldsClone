<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="McDonaldClone.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="McDonald_Menu_Images/1600-x-676-(Promo-Page)-Revised-6.png" alt="First slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="McDonald_Menu_Images\3ccbffd5481262430bff58be1cf86825.png" alt="Second slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="McDonald_Menu_Images\McD-Site-Promo-Banners-(ONLY-ENG)1600x676_5Nov2021_rev2.png" alt="Third slide">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <hr />
    <div class="card-group">
        <div class="card">
            <img class="card-img-top" src="McDonald_Menu_Images\home_promo_10394_Promo_BM_1.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">Up to 45% Discount!</h5>
                <p class="card-text">Use our delivery service and you'll get loads of awesome discounts! See our promos!</p>
            </div>
        </div>
        <div class="card">
            <img class="card-img-top" src="McDonald_Menu_Images\home_promo_13312_300X200_BM.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">Order Through The McDonald's App</h5>
                <p class="card-text">Make your orders easier by donwloading and installing the McDonald's App! Convinience at your fingertips!</p>
            </div>
        </div>
        <div class="card">
            <img class="card-img-top" src="McDonald_Menu_Images\home_promo_31640_20210728_McD_EndTag_BM_16kb.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">Free Delivery on Your First Order!</h5>
                <p class="card-text">Install the McDonald's app now and get your first delivery free of charge!</p>
            </div>
        </div>
    </div>
</asp:Content>
