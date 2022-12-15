<%--
  Created by IntelliJ IDEA.
  User: newbww
  Date: 2/11/2022 AD
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <title>Offices</title>--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
    <div class="row bg-primary">
        <h2>Classic Model Offices ::</h2>
    </div>
    <div class="row">
        <%--@elvariable id="offices" type="java.util.List"--%>
        <c:forEach items="${offices}" var="office">
            <div onclick="loadOffice('${office.officeCode}')"
                    class="div-link col-2 border border-secondary p-2 m-2 ${office.officeCode == selectedOffice.officeCode ? 'bg-warning' : ''}">
                <div>
                    ${office.city}, ${office.country}
                </div>
                <div> ${office.phone}</div>
            </div>
        </c:forEach>
    </div>
    <br>
    <div class="row bg-light">
        <strong>Employees ::</strong>
    </div>
    <div class="row">
        <%--@elvariable id="selectedOffice" type="java.util.List"--%>
        <c:forEach items="${selectedOffice.employeeList}" var="employee">
            <div class="col-2 pl-2 m-2 border border-secondary rounded-pill">
                <div> ${employee.firstName}
                        ${employee.lastName} - ${employee.jobTitle}
                </div>
            </div>
        </c:forEach>
    </div>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
