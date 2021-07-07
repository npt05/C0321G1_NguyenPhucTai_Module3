<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/6/2021
  Time: 9:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <div class="img-thumbnail">
                <img src="asset/img/4.jpg" alt="" style="height: 168px; width: 300px">
            </div>
        </a>
        <span class="navbar-text" style="color: white">
    </span>
    </div>
</nav>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <div class="col-md-1"></div>
        <div class="col-md-8">
            <a class="navbar-brand col-md-2 m-0" href="${pageContext.request.contextPath}/index.jsp">Home</a>
            <a class="navbar-brand col-md-2 m-0" href="${pageContext.request.contextPath}/employee/create.jsp">Employee</a>
            <a class="navbar-brand col-md-2 m-0" href="${pageContext.request.contextPath}/customer/create.jsp">Customer</a>
            <a class="navbar-brand col-md-2 m-0" href="${pageContext.request.contextPath}/service/create.jsp">Service</a>
            <a class="navbar-brand col-md-2 m-0" href="${pageContext.request.contextPath}/contract/create.jsp">Contract</a>
        </div>
        <div class="col-md-3">
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>

</body>
</html>
