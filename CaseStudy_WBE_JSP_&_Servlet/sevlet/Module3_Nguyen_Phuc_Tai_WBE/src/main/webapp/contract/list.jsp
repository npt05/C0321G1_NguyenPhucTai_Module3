<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/6/2021
  Time: 9:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Welcome To Furama</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
<jsp:include page="/layout1/header.jsp" />

<div class="container-fluid row">
  <div class="col-md-2 border-right border-dark">
    <div class="d-grid gap-2 col-6 mx-auto">
      <button class="btn btn-primary mt-3 mb-3 bg-success" type="button">
        <a href="/contract?action=create" style="color: white">Create contract</a></button>
      <button class="btn btn-primary mt-3 mb-3 bg-success" type="button">
        <a href="/contractDetail?action=create" style="color: white">Create contract detail</a></button>
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
        <th class="p-2">Contract Id</th>
        <th class="p-2">Service Id</th>
        <th class="p-2">Contract Detail Id</th>
        <th class="p-2">Quantity</th>
      </tr>
      <c:forEach items="${listCustomer}" var="customer">
        <tr>
          <td class="p-2">${customer.id}</td>
          <td class="p-2">${customer.name}</td>
          <td class="p-2">${customer.birthday}</td>
          <td class="p-2">${customer.idCard}</td>
          <td class="p-2">${customer.phone}</td>
          <td class="p-2">${customer.email}</td>
          <td class="p-2">${customer.address}</td>
          <td class="p-2">${customer.contractId}</td>
          <td class="p-2">${customer.serviceId}</td>
          <td class="p-2">${customer.contractDetailId}</td>
          <td class="p-2">${customer.quantity}</td>
        </tr>
      </c:forEach>
    </table>
  </div>
</div>

<jsp:include page="/layout1/footer.jsp" />


</body>
</html>