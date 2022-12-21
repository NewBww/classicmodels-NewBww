<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="row bg-primary">
    <%--@elvariable id="user" type="sit.int202.classicmodels.entities.Customer"--%>
    <h2>Order History of Customer #${user.customerNumber}</h2>
</div>
<div class="column">
    <%--@elvariable id="orders" type="java.util.List"--%>
    <%--@elvariable id="selectedOrder" type="sit.int202.classicmodels.entities.Order"--%>
    <c:forEach items="${orders}" var="order">
        <div onclick="loadOrder('${order.orderNumber}')"
             class="div-link p-2 m-2 ${order.orderNumber == selectedOrder.orderNumber ? 'bg-light' : ''}">
            <div>Order#${order.orderNumber} | ${order.orderDate} | ${order.shippedDate} | ${order.status}</div>
            <c:choose>
                <c:when test="${order.orderNumber == selectedOrder.orderNumber}">
                    <hr>
                    <table class="table table-striped table-bordered w-100">
                        <thead>
                        <th>#</th>
                        <th>Order Line Number</th>
                        <th>Product Code</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                        </thead>
                        <c:forEach items="${selectedOrder.orderItemList}" var="orderItem" varStatus="vs">
                            <tr>
                                <td>${vs.count}</td>
                                <td>${orderItem.orderLineNumber}</td>
                                <td>${orderItem.productCode}</td>
                                <td>${orderItem.quantity}</td>
                                <td>${orderItem.priceEach}</td>
                                <td>${orderItem.total}</td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="5" style="text-align: right;margin-right: 5px">Total</td>
                            <td>${totalPrice}</td>
                        </tr>
                    </table>
                </c:when>
            </c:choose>
        </div>
    </c:forEach>
</div>
<%--<table class="table table-striped table-bordered w-100">
            <thead>
            <th>#</th>
            <th>Code</th>
            <th>Description</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Total</th>
            </thead>
            <tbody>
            <c:forEach items="${cart.allItem}" var="lineItem" varStatus="vs">
                <tr>
                    <td>${vs.count}</td>
                    <td>${lineItem.product.productCode}</td>
                    <td>${lineItem.product.productName}</td>
                    <td>${lineItem.quantity}</td>
                    <td>${lineItem.product.msrp}</td>
                    <td>${lineItem.total}</td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="5" style="text-align: right;margin-right: 5px">Total</td>
                <td>${cart.totalPrice}</td>
            </tr>
            </tbody>
        </table>--%>