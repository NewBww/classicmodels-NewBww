<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Classic Model</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="styles/style.css">
    <script src="scripts/main.js" async></script>
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand text-warning" href="javascript:loadHome()">Classic Model</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="javascript:loadOffice('')">Office</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:loadProduct(1,15)">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:loadOrder()">Order History</a>
                </li>
                <li class="nav-item ml-4">
                    <a id="login-menu" class="nav-link text-light" href="javascript:showLoginForm()"><i class="bi bi-box-arrow-in-right"></i> Login</a>
                </li>
            </ul>

            <form class="d-flex">
                <div>
                    <a href="javascript:viewCart()">
                        <img src="assets/images/cart.png" alt="Cart Icon" width="48"/>
                    </a>
                    <button id="noOfItemInCart" type="button" class="cart-info" onclick="viewCart()"></button>
                </div>
                <input id="searchBox" class="form-control ms-3 me-2" type="text" placeholder="Search">
                <button class="btn btn-primary" type="button" onclick="search(thisContent)">Search</button>
            </form>
        </div>
    </div>
</nav>
<div class="container" id="body-content">
    <jsp:include page="components/home-info.html"/>
</div>
<div class="d-flex justify-content-center modal d-none" id="loading">
    <div class="spinner-border text-primary"
         style="margin-top: 10%; width: 6rem; height: 6rem;"></div>
</div>
<%--<c:if test="${cookie.lastpage != null}">--%>
<script>
    window.onload = (ev) => {
        <%--                ${cookie.lastpage.value ==--%>
        <%--                'office-list' ? 'loadOffice()' : 'loadProduct(1,15)'}--%>
        addToCart('');
    };
</script>
<%--</c:if>--%>
<div class="modal" tabindex="-1" id="viewCartModal">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Your Cart</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                        onclick="$('#viewCartModal').modal('hide')">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="view-cart">
                <p>Modal body text goes here.</p>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Sign in</h4>
                <button type="button" class="close"
                        onclick="$('#modalLoginForm').modal('hide')">&times;</span>
                </button>
            </div>
            <div class="modal-body mx-3">
                <div class="md-form mb-2">
                    <i class="bi bi-person-lines-fill h3"></i>
                    <input type="email" id="defaultForm-user" class="form-control validate">
                    <label data-error="wrong" data-success="right" for="defaultForm-user">User name</label>
                </div>
                <div class="md-form mb-2">
                    <i class="bi bi-key h3"></i>
                    <input type="password" id="defaultForm-pass" class="form-control validate">
                    <label data-error="wrong" data-success="right" for="defaultForm-pass">Your password</label>
                </div>
                <div class="md-form mt-2">
                    <label class="text-danger" id="login-message"></label>
                </div>
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <button class="btn btn-primary"
                        onclick="login($('#defaultForm-user').val(), $('#defaultForm-pass').val())">Login
                </button>
            </div>
        </div>
    </div>
</div>
</body>
</html>