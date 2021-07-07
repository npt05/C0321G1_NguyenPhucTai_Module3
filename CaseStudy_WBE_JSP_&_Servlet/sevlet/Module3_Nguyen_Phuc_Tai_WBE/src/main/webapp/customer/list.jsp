<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/29/2021
  Time: 5:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome To Furama</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/bootstrap4/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="/layout1/header.jsp" />

<div class="container-fluid row">
    <div class="col-md-2 border-right border-dark">
        <div class="d-grid gap-2 col-6 mx-auto">
            <button class="btn btn-primary mt-3 mb-3 bg-success" type="button">
                <a href="/customer?action=create" style="color: white">Create</a></button>
        </div>
    </div>
    <div class="col-md-10">
        <h3 class="text-center p-2">Customer List </h3>
        <table class="table table-hover">
            <tr class="p-2">
                <th class="p-2">Customer ID</th>
                <th class="p-2">Name</th>
                <th class="p-2">Birthday</th>
                <th class="p-2">Id Card</th>
                <th class="p-2">Phone</th>
                <th class="p-2">Email</th>
                <th class="p-2">Address</th>
                <th class="p-2">Type</th>
                <th class="p-2">Gender</th>
                <th class="p-2">Customer Code</th>
                <th class="p-2"></th>
                <th class="p-2"></th>
            </tr>
            <c:forEach items="${listCustomer}" var="customer">
                <tr>
                    <td class="p-2">${customer.id}</td>
                    <td class="p-2"><a href="customer?action=view&id=${customer.id}">${customer.name}</a></td>
                    <td class="p-2">${customer.birthday}</td>
                    <td class="p-2">${customer.idCard}</td>
                    <td class="p-2">${customer.phone}</td>
                    <td class="p-2">${customer.email}</td>
                    <td class="p-2">${customer.address}</td>
                    <td class="p-2">${customer.customerType}</td>
                    <td class="p-2">${customer.customerGender}</td>
                    <td class="p-2">${customer.customerCode}</td>
                    <td class="p-2"><a href="customer?action=edit&id=${customer.id}">EDIT/DELETE</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<jsp:include page="/layout1/footer.jsp" />

<script src="${pageContext.request.contextPath}/asset/jquery/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/jquery/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/bootstrap4/js/bootstrap.js"></script>
</body>
</html>
