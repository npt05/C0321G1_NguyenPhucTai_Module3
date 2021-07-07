<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/6/2021
  Time: 9:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    </div>
    <div class="col-md-10">

        <form class="row g-3" action="/employee?action=edit" method="post">
            <input type="hidden" name="employeeId" value="<c:out  value='${employee.id}'/>">
            <div class="col-md-5">
                <label class="form-label font-weight-bold">Employee Id:</label>
                <p>
                    <c:out value='${employee.id}'/>
                </p>
            </div>
            <div class="col-md-5">
                <label class="form-label font-weight-bold">Employee Name:</label>
                <p>
                    <c:out value='${employee.name}'/>
                </p>
            </div>
            <div class="col-md-5">
                <label class="form-label font-weight-bold">Employee Birthday:</label>
                <p>
                    <c:out value='${employee.birthday}'/>
                </p>
            </div>
            <div class="col-md-5">
                <label class="form-label font-weight-bold">Employee IdCard:</label>
                <p>
                    <c:out value='${employee.idCard}'/>
                </p>
            </div>
            <div class="col-md-5">
                <label class="form-label font-weight-bold">Employee Phone:</label>
                <p>
                    <c:out value='${employee.phone}'/>
                </p>
            </div>
            <div class="col-md-5">
                <label class="form-label font-weight-bold">Employee Email:</label>
                <p>
                    <c:out value='${employee.email}'/>
                </p>
            </div>
            <div class="col-md-5">
                <label class="form-label font-weight-bold">Employee Address:</label>
                <p>
                    <c:out value='${employee.address}'/>
                </p>
            </div>
            <div class="col-md-5">
                <label class="form-label font-weight-bold">Employee Salary</label>
                <p>
                    <c:out value='${employee.salary}'/>
                </p>
            </div>
            <div class="col-md-5">
                <label class="form-label font-weight-bold">Position</label>
                <p>
                    <c:out value='${employee.position}'/>
                </p>
            </div>
            <div class="col-md-5">
                <label class="form-label font-weight-bold">Education Degree</label>
                <p>
                    <c:out value='${employee.educationDegree}'/>
                </p>
            </div>
            <div class="col-md-5">
                <label class="form-label font-weight-bold">Division</label>
                <p>
                    <c:out value='${employee.division}'/>
                </p>
            </div>
            <div class="col-md-5">
                <label class="form-label font-weight-bold">Username</label>
                <p>
                    <c:out value='${employee.username}'/>
                </p>
            </div>
        </form>
    </div>
</div>

<jsp:include page="/layout1/footer.jsp" />

<script src="${pageContext.request.contextPath}/asset/jquery/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/jquery/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/bootstrap4/js/bootstrap.js"></script>
</body>
</html>

