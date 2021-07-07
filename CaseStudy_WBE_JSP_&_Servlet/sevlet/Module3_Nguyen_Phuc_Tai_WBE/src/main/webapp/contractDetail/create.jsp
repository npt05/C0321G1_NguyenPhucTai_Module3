<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/6/2021
  Time: 9:05 PM
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

<jsp:include page="/layout1/header.jsp"/>

<div class="container-fluid row">
  <div class="col-md-2 border-right border-dark">

  </div>
  <div class="col-md-10">
    <h5>
      <form class="row g-3" action="/contractDetail?action=create" method="post" id="createForm">
        <div class="col-md-5">
          <label for="contractId" class="form-label">Contract Id</label>
          <input type="text" class="form-control" id="contractId" name="contractId">
        </div>
        <div class="col-md-5">
          <label for="attachServiceId" class="form-label">Attach Service Id</label>
          <input type="text" class="form-control" id="attachServiceId" name="attachServiceId">
        </div>
        <div class="col-md-5">
          <label for="quantity" class="form-label">Quantity</label>
          <input type="text" class="form-control" id="quantity" name="quantity">
        </div>
        <div class="col-md-10 p-3">
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Add New
          </button>
        </div>
      </form>
    </h5>
  </div>
</div>

<jsp:include page="/layout1/footer.jsp"/>

<div id="myModal" class="modal fade" tabindex="-2" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title ">Confirm Create</h4>
      </div>
      <div class="modal-body">
        <p>Are you sure you want to create ?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="confirmCreate()">Create</button>
      </div>
    </div>
  </div>
</div>

<script>
  function confirmCreate() {
    document.getElementById("createForm").submit();
  }
</script>

<script src="${pageContext.request.contextPath}/asset/jquery/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/jquery/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/bootstrap4/js/bootstrap.js"></script>
</body>
</html>
