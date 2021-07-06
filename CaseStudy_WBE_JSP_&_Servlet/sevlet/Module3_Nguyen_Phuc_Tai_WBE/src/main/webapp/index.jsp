<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/5/2021
  Time: 11:39 AM
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
<jsp:include page="layout1/header.jsp"/>

<div class="container-fluid row">
  <div class="col-md-2 border-right border-dark">
    <div class="d-grid gap-2 col-6 mx-auto">
      <button class="btn btn-primary mt-3 mb-3" type="button">Button</button>
      <button class="btn btn-primary mt-3 mb-3" type="button">Button</button>
      <button class="btn btn-primary mt-3 mb-3" type="button">Button</button>
    </div>
  </div>
  <div class="col-md-10">
    <h1>Body</h1>
  </div>
</div>

<jsp:include page="/layout1/footer.jsp" />
<script src="asset/jquery/jquery-3.5.1.min.js"></script>
<script src="asset/jquery/popper.min.js"></script>
<script src="asset/bootstrap4/js/bootstrap.js"></script>
</body>
</html>