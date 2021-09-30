<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 26/09/2021
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: THU HUONG
  Date: 9/15/2021
  Time: 12:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-expand-lg navbar-dark "  style="background-color: #169090" >
    <div class="container" >
        <a class="navbar-brand " style="color:#f802c2 ;font-size:35px;font-family: Florence, cursive;" href="home">LOVE</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent" >
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" style="color:#afafd0 ;font-size:20px;" aria-current="page" href="home.">Home</a>
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
<%--    <c:if test="${sessionScope.acc.isSell == 1}">&ndash;%&gt;--%>
    <li class="nav-item">
    <a class="nav-link" href="manager">Manager Product</a>
    </li>
    <%--                    </c:if>--%>
    <%--                    <c:if test="${sessionScope.acc != null}">--%>
    <li class="nav-item">
    <a class="nav-link" href="#">Hello ${sessionScope.acc.user}</a>
    </li>
    <%--                    </c:if>--%>
    <%--                    <c:if test="${sessionScope.acc == null}">--%>
    <li class="nav-item">
    <a class="nav-link" href="login.jsp">login</a>
    </li>
    <%--                    </c:if>--%>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="print">Cart</a>
                </li>
            </ul>


            <form class="d-flex" style="margin-top: 1px; margin-bottom: 1px;" >
                <button class="btn hover" type="submit"><span><img src="https://cdn-icons-png.flaticon.com/128/3144/3144456.png" style="width: 25px; margin-right: 10px"></span></button>
                <%--                    giang--%>
                <%--                    <button class="b.n btn-outline-success" type="submit" id="login" formaction="/login.jsp">Login</button>--%>
                <button id="login" type="button" class="guest btn btn-primary ms-3 d-none" data-bs-toggle="modal" data-bs-target="#modal-login"><span>Login</span></button>
                <div id="login-spinner" class="spinner-border text-light ms-3" role="status"></div>
                <div class="dropdown">
                    <img id="avatar" th:src="@{/assets/avatar.jpg}" src="./assets/avatar.jpg" data-bs-toggle="dropdown" width="38x" height="38x"
                         class="user avatar rounded-circle ms-3 d-none dropdown-toggle">
                    <ul class="dropdown-menu dropdown-menu-center text-small" aria-labelledby="dropdownUser1">
                        <li><a class="dropdown-item" href="#">Settings</a></li>
                        <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#modal-login">Profile</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#" onclick="firebase.auth().signOut();">Sign out</a></li>
                    </ul>
                </div>
                <div class="modal d-block1" id="modal-login" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content shadow">
                            <div class="modal-header">
                                <h5 class="modal-title">Login</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div id="firebaseui-auth-container" class="guest"></div>
                                <div id="user-signed-in" class="d-none d-flex user">
                                    <div class="flex-grow-1 d-flex justify-content-center">
                                        <img th:src="@{/assets/avatar.jpg}" src="./assets/avatar.jpg" width="110px" height="110px" class="avatar rounded-circle">
                                    </div>
                                    <div class="flex-grow-1  d-flex flex-column align-self-center me-4">
                                        <div id="name" class="align-self-center text-primary fs-5">Name</div>
                                        <div id="email" class="align-self-center ">Email</div>
                                        <div id="phone">Phone</div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer d-none user">
                                <button id="sign-out" type="button" class="btn btn-danger" onclick="firebase.auth().signOut();">Sign out</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%--                    giang--%>
            </form>
        </div>
    </div>
</nav>


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
