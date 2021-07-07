<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/6/2021
  Time: 8:59 PM
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
        <h5>
            <form class="row g-3" action="/service?action=create" method="post" id="createForm">
                <div class="col-md-5">
                    <label for="serviceCode" class="form-label">Service Code</label>
                    <input type="text" class="form-control" id="serviceCode" name="serviceCode">
                </div>
                <div class="col-md-5">
                    <label for="serviceName" class="form-label">Service Name </label>
                    <input type="text" class="form-control" id="serviceName" name="serviceName">
                </div>
                <div class="col-md-5">
                    <label for="serviceArea" class="form-label">Service Area </label>
                    <input type="text" class="form-control" id="serviceArea" name="serviceArea">
                </div>
                <div class="col-md-5">
                    <label for="serviceCost" class="form-label">Service Cost  </label>
                    <input type="text" class="form-control" id="serviceCost" name="serviceCost">
                </div>
                <div class="col-md-5">
                    <label for="serviceMaxPeople" class="form-label">Service Max People  </label>
                    <input type="email" class="form-control" id="serviceMaxPeople" name="serviceMaxPeople">
                </div>
                <div class="col-md-5">
                    <label for="standardRoom" class="form-label">Standard Room </label>
                    <input type="text" class="form-control" id="standardRoom" name="standardRoom">
                </div>
                <div class="col-md-5">
                    <label for="descriptionOtherConvenience" class="form-label">Description Other Convenience  </label>
                    <input type="text" class="form-control" id="descriptionOtherConvenience" name="descriptionOtherConvenience">
                </div>
                <div class="col-md-5">
                    <label for="poolArea" class="form-label">Pool Area</label>
                    <input type="text" class="form-control" id="poolArea" name="poolArea">
                </div>
                <div class="col-md-5">
                    <label for="numberOfFloor" class="form-label">Number Of Floor</label>
                    <input type="text" class="form-control" id="numberOfFloor" name="numberOfFloor">
                </div>
                <div class="col-md-5 p-2">
                    <label for="rentTypeId" class="form-label">Rent Type</label>
                    <select id="rentTypeId" class="form-select" name="rentTypeId">
                        <option value="1" >Day</option>
                        <option value="2" >Week</option>
                    </select>
                </div>
                <div class="col-md-5 p-2">
                    <label for="serviceTypeId" class="form-label">Service Type</label>
                    <select id="serviceTypeId" class="form-select" name="serviceTypeId">
                        <option value="1">Villa</option>
                        <option value="2">House</option>
                        <option value="3">Room</option>
                    </select>
                </div>
                <div class="col-md-10 p-3">
                    <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#myModal">Add New</button>
                </div>
            </form>
        </h5>
    </div>
</div>

<jsp:include page="/layout1/footer.jsp" />

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