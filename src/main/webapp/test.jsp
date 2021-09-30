<%@ page import="entity.Product" %>
<%@ page import="entity.Category" %>

<%@ page import="java.util.List" %>
<%@ page import="dao.DAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link  rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link  rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link href="/your-path-to-fontawesome/css/fontawesome.css" rel="stylesheet">
    <link href="/your-path-to-fontawesome/css/brands.css" rel="stylesheet">
    <link href="/your-path-to-fontawesome/css/solid.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <style>
        .carousel-item{
            height: 700px;
        }
        .mau{
            background-color: #929FBA;
        }
        body{
            background-image: url("https://www.mechatronicsart.com/wp-content/uploads/2016/06/Vilarpac_website_background.jpg");
            background-attachment: fixed;

        }
        .text:hover{
            background-color: #8b8b89;
        }
        .demo{ background-color: #e7e7e7; }
        .product-grid{
            font-family: 'Montserrat', sans-serif;
            text-align: center;
            margin: 5px 15px 0;
            border-radius: 10px;
            box-shadow:  0 0 3px rgba(0,0,0,0.1);
            transition: all 0.5s;
        }
        .product-grid:hover{ box-shadow:  0 0 15px rgba(0,0,0,0.1); }
        .product-grid .product-image{ position: relative; }
        .product-grid .product-image a.image{
            border-radius: 10px 10px 0 0;
            overflow: hidden;
            display: block;
        }
        .product-grid .product-image img{
            width: 100%;
            height: auto;
        }
        .product-grid .product-sale-label{
            color: #fff;
            background: #009de1;
            font-size: 13px;
            text-transform: uppercase;
            padding: 2px 6px;
            border-radius: 3px;
            position: absolute;
            left: -4px;
            top: -2px;
        }
        .product-grid .price{
            color: #fff;
            background: #009de1;
            font-size: 13px;
            padding: 2px 6px 2px 18px;
            border: 1px solid rgba(0,0,0,0.08);
            border-radius: 1px 3px 3px 1px;
            position: absolute;
            top: 25px;
            left: -15px;
            clip-path: polygon(10% 0, 100% 0, 100% 100%, 10% 100%, 0 50%);
        }
        .product-grid  .price span{
            font-weight: 400;
            text-decoration: line-through;
            opacity: 0.5;
        }
        .product-grid .price:before{
            content: "";
            background: #fff;
            width: 6px;
            height: 6px;
            border-radius: 50%;
            position: absolute;
            top: 8px;
            left: 7px;
        }
        .product-grid .price.fixed{
            background: #b71540;
            top: -4px;
        }
        .product-grid .add-to-cart{
            color: #fff;
            background: #b71540;
            font-size: 13px;
            text-transform: uppercase;
            padding: 8px 10px;
            border-radius: 3px;
            box-shadow: 0px 8px 8px 0px rgba(0,0,0,0.1);
            opacity: 0;
            position: absolute;
            right: 10px;
            bottom: 10px;
            transition: all 0.2s ease-out;
        }
        .product-grid .add-to-cart:hover{ text-shadow: 0 0 5px #000; }
        .product-grid:hover .add-to-cart{ opacity:1; }
        .product-grid .product-content{
            background-color: #fff;
            text-align: left;
            padding: 15px 10px;
            border-top: 1px solid transparent;
            border-radius: 0 0 10px 10px;
            transition: all 0.3s;
        }
        .product-grid:hover .product-content{ border-top-color: #dbdbdb; }
        .product-grid .title{
            font-size: 15px;
            font-weight: 500;
            text-transform: capitalize;
            margin: 0;
        }
        .product-grid .title a{
            color: #323b45;
            transition: all 0.4s ease-out;
        }
        .product-grid .title a:hover{ color: #b71540; }
        .product-grid .rating{
            padding: 0;
            margin: 0;
            list-style: none;
        }
        .product-grid .rating li{
            color: #f1c40f;
            font-size: 12px;
            display: inline-block;
        }
        .product-grid .rating li.far{ color: #dbdbdb; }
        @media screen and (max-width:990px){
            .product-grid{ margin: 5px 15px 30px; }
        }
        .a{
            color:blue;
        }
        .d{
            color:#f802c2 ;font-size:35px;font-family: Florence, cursive;
        }
    </style>
    <title>Clothes</title>
</head>
<body>

<header>

    <nav class="navbar navbar-expand-lg navbar-dark mau "  style="background-color: #169090" >
        <div class="container" >
            <a class="navbar-brand " style="color:#f802c2 ;font-size:35px;font-family: Florence, cursive;" href="home">LOVE</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent" >
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" style="color:#afafd0 ;font-size:20px;" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" style="color:#afafd0 ;font-size:20px;" href="#">Hot</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" style="color:#afafd0 ;font-size:20px;" href="#">Trending</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" style="color:#afafd0 ;font-size:20px;" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Genres
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>

                </ul>
                <form class="d-flex" style="margin-top: 1px; margin-bottom: 1px;" >
                    <button class="btn hover" type="submit"><span><img src="./assets/shopping-cart.png" style="width: 25px; margin-right: 10px"></span></button>
                    <button class="btn btn-outline-success" type="submit">Login</button>
                </form>
            </div>
        </div>
    </nav>

    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                    aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                    aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://media.canifa.com/wysiwyg/bst-chom-thu-home.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h5>First slide label</h5>
                    <p>Some representative placeholder content for the first slide.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://media.canifa.com/wysiwyg/ao-moi-den-truong-home.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Second slide label</h5>
                    <p>Some representative placeholder content for the second slide.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://media.canifa.com/wysiwyg/giam-gia-cuoi-mua-home.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Third slide label</h5>
                    <p>Some representative placeholder content for the third slide.</p>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</header>

<!--Main layout-->
<main>
    <div class="container">

        <!--Navbar-->
        <nav class="navbar navbar-expand-lg navbar-light lighten-3 mt-3 mb-5 " style="background-color: #aef6f6">


            <!-- Navbar brand -->
            <span class="navbar-brand" style="color:#0209f3 ;font-size:28px; ">Categories:</span>

            <!-- Collapse button -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicExampleNav"
                    aria-controls="basicExampleNav"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Collapsible content -->
            <div class="collapse navbar-collapse" id="basicExampleNav">

                <!-- Links -->
                <ul class="navbar-nav mr-auto">

                    <c:forEach items="${listC}" var="o">
                        <li class="nav-item ">
                            <a class="nav-link ${cat == o.cid ? "active":""} " style="color:#3333ee;font-size: 20px; " href="category?cid=${o.cid}">${o.cname}</a>
                        </li>
                    </c:forEach>




                </ul>
                <!-- Links -->

                <form class="form-inline" style="margin-top: 1px; margin-bottom: 1px;">
                    <div class="md-form my-0">
                        <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
                    </div>
                </form>
            </div>
            <!-- Collapsible content -->

        </nav>
        <!--/.Navbar-->
        <%--       <% DAO dao = new DAO();--%>
        <%--        List<Product> list = dao.getAllProduct();--%>
        <%--        //b2:set data to jsp--%>
        <%--        request.setAttribute("list",list);--%>
        <%--       %>--%>
        <!--Section: Products v.3-->
        <section class="text-center mb-4 ">

            <!--Grid row-->
            <div class="row wow fadeIn ">
                <div class="container">
                    <div class="row wow fadeIn">
                        <div class="col-12 col-lg-4 col-md-6 mb-4">
                            <div class="product-grid">
                                <div class="product-image">
                                    <a href="#" class="image">
                                        <img class="pic-1" src="https://media.canifa.com/catalog/product/1/o/1ot21s001-sy007-1.jpg">
                                    </a>
                                    <span class="product-sale-label">sale!</span>
                                    <div class="price"> $35.50 - $19.99 </div>
                                    <a href="#" class="add-to-cart"> add to cart </a>
                                </div>
                                <div class="product-content">
                                    <h3 class="title"><a href="#">Women's Cotton Top</a></h3>
                                    <ul class="rating">
                                        <li class="fas fa-star"></li>
                                        <li class="fas fa-star"></li>
                                        <li class="fas fa-star"></li>
                                        <li class="fas fa-star"></li>
                                        <li class="fas fa-star"></li>
                                    </ul>
                                </div>
                            </div>
                        </div>



                    </div>

                    <!--Fourth column-->

                </div>
        <%--        <c:forEach items="${list}" var="u">--%>
        <%--            <tr>--%>
        <%--                <td>${u.name}</td>--%>


        <%--            </tr>--%>
        <%--        </c:forEach>--%>
        <!--Section: Products v.3-->

        <!--Pagination-->
        <nav class="d-flex justify-content-center wow fadeIn">
            <ul class="pagination pg-blue">

                <!--Arrow left-->
                <li class="page-item disabled">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>

                <li class="page-item active">
                    <a class="page-link" href="#">1
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">4</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">5</a>
                </li>

                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul>
        </nav>
        <!--Pagination-->

    </div>
</main>
<!--Main layout-->

<!--Footer-->
<footer class="page-footer text-center font-small mt-4 wow fadeIn" style="background-color: darkgray">

    <!--Call to action-->
    <div class="pt-4">
        <a class="btn btn-outline-white" href="https://mdbootstrap.com/docs/jquery/getting-started/download/" target="_blank" role="button">Download MDB
            <i class="fas fa-download ml-2"></i>
        </a>
        <a class="btn btn-outline-white" href="https://mdbootstrap.com/education/bootstrap/" target="_blank" role="button">Start free tutorial
            <i class="fas fa-graduation-cap ml-2"></i>
        </a>
    </div>
    <!--/.Call to action-->

    <hr class="my-4">

    <!-- Social icons -->
    <div class="pb-4">
        <a href="https://www.facebook.com/mdbootstrap" target="_blank">
            <i class="fab fa-facebook-f mr-3"></i>
        </a>

        <a href="https://twitter.com/MDBootstrap" target="_blank">
            <i class="fab fa-twitter mr-3"></i>
        </a>

        <a href="https://www.youtube.com/watch?v=7MUISDJ5ZZ4" target="_blank">
            <i class="fab fa-youtube mr-3"></i>
        </a>

        <a href="https://plus.google.com/u/0/b/107863090883699620484" target="_blank">
            <i class="fab fa-google-plus-g mr-3"></i>
        </a>

        <a href="https://dribbble.com/mdbootstrap" target="_blank">
            <i class="fab fa-dribbble mr-3"></i>
        </a>

        <a href="https://pinterest.com/mdbootstrap" target="_blank">
            <i class="fab fa-pinterest mr-3"></i>
        </a>

        <a href="https://github.com/mdbootstrap/bootstrap-material-design" target="_blank">
            <i class="fab fa-github mr-3"></i>
        </a>

        <a href="http://codepen.io/mdbootstrap/" target="_blank">
            <i class="fab fa-codepen mr-3"></i>
        </a>
    </div>
    <!-- Social icons -->

    <!--Copyright-->
    <div class="footer-copyright py-3">
        © 2018 Copyright:
        <a href="https://mdbootstrap.com/education/bootstrap/" target="_blank"> MDBootstrap.com </a>
    </div>
    <!--/.Copyright-->

</footer>
<!--/.Footer-->



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

<%--footer--%>
<script type="text/javascript" src="node_modules/mdbootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="node_modules/mdbootstrap/js/popper.min.js"></script>
<script type="text/javascript" src="node_modules/mdbootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="node_modules/mdbootstrap/js/mdb.min.js"></script>
<script src="https://kit.fontawesome.com/cb0487757c.js" crossorigin="anonymous"></script>

</body>
</html>
