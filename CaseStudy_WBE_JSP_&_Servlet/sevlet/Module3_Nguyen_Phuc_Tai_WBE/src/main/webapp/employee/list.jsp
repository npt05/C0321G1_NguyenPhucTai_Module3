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
    <div class="d-grid gap-2 col-6 mx-auto">
      <button class="btn btn-primary mt-3 mb-3 bg-success" type="button">
        <a href="/employee?action=create" style="color: white">Create</a></button>
    </div>
  </div>
  <div class="col-md-10">
    <h3 class="text-center p-2">Employee List </h3>
    <table class="table table-hover">
      <tr class="p-2">
        <th class="p-2">Employee ID</th>
        <th class="p-2">Name</th>
        <th class="p-2">Birthday</th>
        <th class="p-2">Id Card</th>
        <th class="p-2">Phone</th>
        <th class="p-2">Email</th>
        <th class="p-2">Address</th>
        <th class="p-2">Salary</th>
        <th class="p-2">Position</th>
        <th class="p-2">Education Degree</th>
        <th class="p-2">Division</th>
        <th class="p-2">Username</th>
        <th class="p-2"></th>
      </tr>
      <c:forEach items="${listEmployee}" var="employee">
        <tr>
          <td class="p-2">${employee.id}</td>
          <td class="p-2"><a href="employee?action=view&id=${employee.id}">${employee.name}</a></td>
          <td class="p-2">${employee.birthday}</td>
          <td class="p-2">${employee.idCard}</td>
          <td class="p-2">${employee.phone}</td>
          <td class="p-2">${employee.email}</td>
          <td class="p-2">${employee.address}</td>
          <td class="p-2">${employee.salary}</td>
          <td class="p-2">${employee.position}</td>
          <td class="p-2">${employee.educationDegree}</td>
          <td class="p-2">${employee.division}</td>
          <td class="p-2">${employee.username}</td>
          <td class="p-2"><a href="employee?action=edit&id=${employee.id}">EDIT/DELETE</a></td>
        </tr>
      </c:forEach>
    </table>
  </div>
</div>
<script src="${pageContext.request.contextPath}/asset/jquery/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/jquery/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/bootstrap4/js/bootstrap.js"></script>
<jsp:include page="/layout1/footer.jsp" />

</body>
</html>
