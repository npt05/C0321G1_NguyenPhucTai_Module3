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
    <link rel="stylesheet" href="asset/bootstrap4/css/bootstrap.min.css">
</head>
<body>

<jsp:include page="/layout1/header.jsp" />

<div class="container-fluid row">
    <div class="col-md-2 border-right border-dark">
    </div>
    <div class="col-md-10">
        <h5>
            <form action="/customer?action=delete" method="post" id="deleteForm">
                <input type="hidden" name="customerId" value="<c:out  value='${customer.id}'/>">
            </form>
            <form class="row g-3" action="/customer?action=edit" method="post" id="editForm">
                <input type="hidden" name="customerId" value="<c:out  value='${customer.id}'/>">
                <div class="col-md-6">
                    <label for="customerName" class="form-label">Customer Name</label>
                    <input type="text" class="form-control" id="customerName" name="customerName"
                           value="<c:out  value='${customer.name}'/>">
                </div>
                <div class="col-md-6">
                    <label for="customerBirthday" class="form-label">Customer Birthday</label>
                    <input type="date" class="form-control" id="customerBirthday" name="customerBirthday"
                           value="<c:out  value='${customer.birthday}'/>">
                </div>
                <div class="col-md-6">
                    <label for="customerIdCard" class="form-label">Customer IdCard</label>
                    <input type="text" class="form-control" id="customerIdCard" name="customerIdCard"
                           value="<c:out  value='${customer.idCard}'/>">
                </div>
                <div class="col-md-6">
                    <label for="customerPhone" class="form-label">Customer Phone </label>
                    <input type="text" class="form-control" id="customerPhone" name="customerPhone"
                           value="<c:out  value='${customer.phone}'/>">
                </div>
                <div class="col-md-6">
                    <label for="customerEmail" class="form-label">Customer Email </label>
                    <input type="email" class="form-control" id="customerEmail" name="customerEmail"
                           value="<c:out  value='${customer.email}'/>">
                </div>
                <div class="col-md-6">
                    <label for="customerAddress" class="form-label">Customer Address </label>
                    <input type="text" class="form-control" id="customerAddress" name="customerAddress"
                           value="<c:out  value='${customer.address}'/>">
                </div>
                <div class="col-md-6">
                    <label for="customerCode" class="form-label">Customer Code</label>
                    <input type="text" class="form-control" id="customerCode" name="customerCode"
                           value="<c:out  value='${customer.customerCode}'/>">
                </div>
                <div class="col-md-3 p-3">
                    <label for="customerTypeId" class="form-label">Customer Type</label>
                    <select id="customerTypeId" class="form-select" name="customerTypeId">
                        <option value="1">Diamond</option>
                        <option value="2">Platinum</option>
                        <option value="3">Gold</option>
                        <option value="4">Silver</option>
                        <option value="5">Member</option>
                    </select>
                </div>
                <div class="col-md-3 p-3">
                    <label for="customerGender" class="form-label">Customer Gender</label>
                    <select id="customerGender" class="form-select" name="customerGender">
                        <option value="0">Male</option>
                        <option value="1">Female</option>
                    </select>
                </div>
                <div class="col-md-1 p-3">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                        UPDATE
                    </button>
                </div>
                <div class="col-md-1 p-3">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#delete">
                        DELETE
                    </button>
                </div>
            </form>

        </h5>
    </div>
</div>


<jsp:include page="/layout1/footer.jsp" />

<%--EDIT POPUP--%>
<div id="myModal" class="modal fade" tabindex="-2" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title ">Confirm Update</h4>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to update ?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="confirmEdit()">Save changes</button>
            </div>
        </div>
    </div>
</div>
<%--DELETE POPUP--%>
<div id="delete" class="modal fade" tabindex="-2" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title ">Confirm Delete</h4>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete ?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="confirmDelete()">Delete</button>
            </div>
        </div>
    </div>
</div>



<script>
    function confirmEdit() {
        document.getElementById("editForm").submit();
    }
    function confirmDelete() {
        document.getElementById("deleteForm").submit();
    }
</script>
<script src="asset/jquery/jquery-3.5.1.min.js"></script>
<script src="asset/jquery/popper.min.js"></script>
<script src="asset/bootstrap4/js/bootstrap.js"></script>
</body>
</html>