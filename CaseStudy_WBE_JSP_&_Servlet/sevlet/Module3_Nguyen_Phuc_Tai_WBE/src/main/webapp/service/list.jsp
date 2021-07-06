
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/5/2021
  Time: 4:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Welcome To Furama</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="asset/bootstrap4/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="/layout1/header.jsp" />

<div class="container-fluid row">
  <div class="col-md-2 border-right border-dark">
    <div class="d-grid gap-2 col-6 mx-auto">
      <button class="btn btn-primary mt-3 mb-3 bg-success" type="button">
        <a href="/service?action=create" style="color: white">Create</a></button>
    </div>
  </div>
  <div class="col-md-10">
    <h3 class="text-center p-2">Service List </h3>
    <table class="table table-hover">
      <tr class="p-2">
        <th class="p-2">Service ID</th>
        <th class="p-2">Service Code</th>
        <th class="p-2">Service Name</th>
        <th class="p-2">Service Area</th>
        <th class="p-2">Service Cost</th>
        <th class="p-2">Service Max People</th>
        <th class="p-2">Standard Room</th>
        <th class="p-2">Description Other Convenience</th>
        <th class="p-2">Pool Area</th>
        <th class="p-2">Number Of Floor</th>
        <th class="p-2">Rent Type</th>
        <th class="p-2">Service Type</th>
        <th class="p-2">Rent Type Cost </th>
      </tr>
      <c:forEach items="${listService}" var="service">
        <tr>
          <td class="p-2">${service.id}</td>
          <td class="p-2">${service.serviceCode}</td>
          <td class="p-2">${service.serviceName}</td>
          <td class="p-2">${service.serviceArea}</td>
          <td class="p-2">${service.serviceCost}</td>
          <td class="p-2">${service.serviceMaxPeople}</td>
          <td class="p-2">${service.standardRoom}</td>
          <td class="p-2">${service.descriptionOtherConvenience}</td>
          <td class="p-2">${service.poolArea}</td>
          <td class="p-2">${service.numberOfFloor}</td>
          <td class="p-2">${service.rentTypeName}</td>
          <td class="p-2">${service.serviceTypeName}</td>
          <td class="p-2">${service.rentTypeCost}</td>
        </tr>
      </c:forEach>
    </table>
  </div>
</div>

<jsp:include page="/layout1/footer.jsp" />

<script src="asset/jquery/jquery-3.5.1.min.js"></script>
<script src="asset/jquery/popper.min.js"></script>
<script src="asset/bootstrap4/js/bootstrap.js"></script>
</body>
</html>
