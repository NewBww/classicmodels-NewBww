// --- Utility Functions
function setLoading(on_off) {
    let loading = document.getElementById("loading");
    if (on_off) {
        loading.classList.remove("d-none");
        loading.classList.add("d-inline");
    } else {
        loading.classList.remove("d-inline");
        loading.classList.add("d-none");
    }
}

// --- Page Loaders
function login(userName, password) {
    if (userName === undefined || userName.trim().length === 0 || password.trim().length === 0) {
        document.getElementById("login-message").innerHTML = "Invalid user name or password !!!";
    }
    setLoading(true);
    const xhttp = new XMLHttpRequest();
    xhttp.onload = function () {
        setLoading(false);
        if (xhttp.status == 200) {
            $('#modalLoginForm').modal('hide');
            document.getElementById("login-menu").innerHTML = "<i class='bi bi-box-arrow-left'></i> Logout"
        } else if (xhttp.status > 400) {
            document.getElementById("login-message").innerHTML = xhttp.statusText;
        } else {
            document.getElementById("login-message").innerHTML = "Wrong user name or password !!!";
        }
    }
    let urlEncodedData = "", urlEncodedDataPairs = [];
    urlEncodedDataPairs.push(encodeURIComponent("userName") + '=' + encodeURIComponent(userName));
    urlEncodedDataPairs.push(encodeURIComponent("password") + '=' + encodeURIComponent(password));
    urlEncodedData = urlEncodedDataPairs.join('&').replace(/%20/g, '+');
    xhttp.open("POST", "login");
    xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhttp.send(urlEncodedData);
}
function loadPages(path, callbackFn) {
    setLoading(true)
    const xhttp = new XMLHttpRequest();
    xhttp.onload = function () {
        setLoading(false);
        callbackFn(xhttp)
    }
    xhttp.open("GET", path);
    xhttp.send();
}
function loadHome() {
    loadPages("components/home-info.html", (xhttp) => {document.getElementById("body-content").innerHTML = xhttp.responseText})
}
function loadOffice(officeCode) {
    loadPages("office-list?officeCode=" + officeCode, (xhttp) => {
        document.getElementById("body-content").innerHTML = xhttp.responseText
    })
}
function loadProduct(page, pageSize = document.getElementById("itemsPage").value) {
    // alert('page: '+ page + ", size: "+ pageSize)
    loadPages("product-list?page=" + page + "&pageSize=" + pageSize, (xhttp) => {
        document.getElementById("body-content").innerHTML = xhttp.responseText
    })
}
let cachedOrderNumber;
function loadOrder(orderNumber) {
    if (cachedOrderNumber === orderNumber) {
        cachedOrderNumber = null
    } else {
        cachedOrderNumber = orderNumber
    }
    loadPages(cachedOrderNumber ? "order-list?orderNumber=" + cachedOrderNumber : "order-list", (xhttp) => {
        document.getElementById("body-content").innerHTML = xhttp.responseText
    })
}
function addToCart(productCode) {
    loadPages("add-to-cart?productCode=" + productCode, (xhttp) => {
        const cartInfo = document.getElementById("noOfItemInCart");
        const noOfItem = xhttp.responseText;
        if (noOfItem > 0) {
            cartInfo.style.display = 'inline'
        } else {
            cartInfo.style.display = 'none'
        }
        cartInfo.innerHTML = noOfItem;
    })
}
function viewCart() {
    loadPages("components/ViewCart.jsp", (xhttp) => {
        document.getElementById("view-cart").innerHTML = xhttp.responseText;
        $('#viewCartModal').modal('show');
    })
}
function logout() {
    loadPages("logout", (xhttp) => {
        document.getElementById("login-menu").innerHTML = "<i class='bi bi-box-arrow-right'></i> Login"
    })
}

// --- General Functions
function showLoginForm() {
    let menu = document.getElementById("login-menu").innerHTML;
    if (menu.includes('Logout')) {
        logout();
    } else {
        $('#modalLoginForm').modal('show');
    }
}