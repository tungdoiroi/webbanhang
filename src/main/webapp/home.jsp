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



    <%--    giang--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link type="text/css" rel="stylesheet" href="https://www.gstatic.com/firebasejs/ui/4.8.1/firebase-ui-auth.css" />

    <%--    giang--%>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    <style>
        .carousel-item{
            height: 700px;
        }
        /*giang*/
        [class*='mdl-shadow']{
            box-shadow: none;
        }
        /*giang*/
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
        .active{
            background-color: #d7d7c8;
        }
    </style>
    <title>Clothes</title>
</head>
<body>

<header>
    <jsp:include page="menu.jsp"></jsp:include>
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
                <img src="https://media.canifa.com/wysiwyg/bst-chom-thu-home.jpg" class="d-block w-100 " alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h5>First slide label</h5>
                    <p>Some representative placeholder content for the first slide.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://media.canifa.com/wysiwyg/cnf-06092021-section1-4.png" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Second slide label</h5>
                    <p>Some representative placeholder content for the second slide.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://media.canifa.com/wysiwyg/bst-chom-thu-listing.jpg" class="d-block w-100" alt="...">
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
    <jsp:include page="navsub.jsp"></jsp:include>

</header>
<!--Main layout-->
<main>


    <div class="container">
        <!--/.Navbar-->
        <%--       <% DAO dao = new DAO();--%>
        <%--        List<Product> list = dao.getAllProduct();--%>
        <%--        //b2:set data to jsp--%>
        <%--        request.setAttribute("list",list);--%>
        <%--       %>--%>
        <!--Section: Products v.3-->
        <section class="text-center mb-4">

            <!--Grid row-->
            <div class="row wow fadeIn">
                <c:forEach items="${listP}" var="o">
                    <!--Grid column-->
                    <div class="col-12 col-lg-4 col-md-6 mb-4">
                        <div class="product-grid">
                            <div class="product-image">
                                <a href="detail?pid=${o.id}" class="image">
                                    <img class="pic-1" src="${o.image}">
                                </a>
                                <span class="product-sale-label">sale!</span>
                                <div class="price"> $${o.price} </div>
                                <a href="#" class="add-to-cart"> add to cart </a>
                            </div>
                            <div class="product-content">
                                <h3 class="title"><a href="detail?pid=${o.id}">${o.name}</a></h3>
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
                    <!--Grid column-->

                </c:forEach>


                <!--Fourth column-->

            </div>
            <!--Grid row-->

            <!--Grid row-->

            <!--Fourth column-->


            <!--Grid row-->

        </section>
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


<footer class="page-footer text-center font-small mt-4 wow fadeIn" style="background-color: #096363">
    <jsp:include page="footer.jsp"></jsp:include>

</footer>


<!--Main layout-->

<!--Footer-->
<!--/.Footer-->



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

<%--footer--%>
<script type="text/javascript" src="node_modules/mdbootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="node_modules/mdbootstrap/js/popper.min.js"></script>
<script type="text/javascript" src="node_modules/mdbootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="node_modules/mdbootstrap/js/mdb.min.js"></script>
<script src="https://kit.fontawesome.com/cb0487757c.js" crossorigin="anonymous"></script>


<%--giang--%>
<script th:src="@{/js/main.js}" src="./js/main.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://www.gstatic.com/firebasejs/8.8.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.8.1/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/ui/4.8.1/firebase-ui-auth.js"></script>

<script type="module">
    const firebaseConfig = {
        apiKey: "AIzaSyCCDuXhP2pXyKcS5s5JJE6fApDlKHoUZEI",
        authDomain: "clothes-12f8a.firebaseapp.com",
        projectId: "clothes-12f8a",
        storageBucket: "clothes-12f8a.appspot.com",
        messagingSenderId: "1068860917688",
        appId: "1:1068860917688:web:3890226b6a54ea4b94f14d",
        measurementId: "G-Y5LB0WWXV0"
    };
    // $(function () {
    //     firebase.initializeApp(firebaseConfig);
    //     alert(firebase.SDK_VERSION)
    // });
    // Initialize Firebase
    var uiConfig = {
        signInFlow: 'popup',
        signInOptions: [
            firebase.auth.EmailAuthProvider.PROVIDER_ID,
            {
                provider: firebase.auth.PhoneAuthProvider.PROVIDER_ID,
                recaptchaParameters: {
                    type: 'image',
                    size: 'normal',
                    badge: 'bottomleft'
                },
                defaultCountry: 'VN'
            },
            firebase.auth.FacebookAuthProvider.PROVIDER_ID
        ],
        callbacks: {
            signInSuccessWithAuthResult: function (authResult) {
                if (authResult.user) {
                    handleSignedInUser(authResult.user);
                }
                return false;
            },
            signInFailure: function (error) {
            }
        },
        autoUpgradeAnonymousUsers: true
    };
    //--------------
    var ui
    $(function () {
        firebase.initializeApp(firebaseConfig);
        ui = new firebaseui.auth.AuthUI(firebase.auth());
        ui.start('#firebaseui-auth-container', uiConfig);
        firebase.auth().onAuthStateChanged(function (user) {
            user ? handleSignedInUser(user) : handleSignedOutUser();
            $("#login-spinner").addClass("d-none")
        });
    });
    function handleSignedInUser(user) {
        $(".user").removeClass("d-none")
        $(".guest").addClass("d-none")
        $("#name").text(user.displayName);
        $("#email").text(user.email);
        $("#phone").text(user.phoneNumber);
        if (user.photoURL) {
            $(".avatar").attr("src",user.photoURL);
        } else {
            $(".avatar").attr("src","/assets/avatar.jpg");
        }
        $('#modal-login').modal('hide');
    }
    function handleSignedOutUser() {
        ui.start("#firebaseui-auth-container", uiConfig);
        $(".user").addClass("d-none")
        $(".guest").removeClass("d-none")
    }
    // function handleSignedInUser(user) {
    //     document.write("<pre>" + JSON.stringify(user, undefined, 2) + "</pre>")
    // }
</script>
<%--giang--%>

</body>
</html>