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

    </div>
    <div class="col-md-10">
        <h5>
            <form class="row g-3" action="/customer?action=create" method="post" id="createForm">
                <div class="col-md-5">
                    <label for="customerName" class="form-label">Customer Name</label>
                    <input type="text" class="form-control" id="customerName" name="customerName" value="${name}">

                </div>
                <div class="col-md-5">
                    <label for="customerBirthday" class="form-label">Customer Birthday</label>
                    <input type="date" class="form-control" id="customerBirthday" name="customerBirthday" value="${birthday}">
                </div>
                <div class="col-md-5">
                    <label for="customerIdCard" class="form-label">Customer IdCard</label>
                    <input type="text" class="form-control" id="customerIdCard" name="customerIdCard" value="${idCard}">
                    <c:if test="${MessIdCard!=null}">
                        <small class="text-danger">${MessIdCard}</small>
                    </c:if>
                </div>
                <div class="col-md-5">
                    <label for="customerPhone" class="form-label">Customer Phone </label>
                    <input type="text" class="form-control" id="customerPhone" name="customerPhone"value="${phone}">
                    <c:if test="${MessPhone!=null}">
                        <small class="text-danger">${MessPhone}</small>
                    </c:if>
                </div>
                <div class="col-md-5">
                    <label for="customerEmail" class="form-label">Customer Email </label>
                    <input type="email" class="form-control" id="customerEmail" name="customerEmail" value="${email}">
                    <c:if test="${MessEmail!=null}">
                        <small class="text-danger">${MessEmail}</small>
                    </c:if>
                </div>
                <div class="col-md-5">
                    <label for="customerAddress" class="form-label">Customer Address </label>
                    <input type="text" class="form-control" id="customerAddress" name="customerAddress" value="${address}">
                </div>
                <div class="col-md-5">
                    <label for="customerCode" class="form-label">Customer Code </label>
                    <input type="text" class="form-control" id="customerCode" name="customerCode" value="${customerCode}">
                    <c:if test="${MessCustomerCode!=null}">
                        <small class="text-danger">${MessCustomerCode}</small>
                    </c:if>
                </div>
                <div class="col-md-5 p-2">
                    <label for="customerTypeId" class="form-label">Customer Type</label>
                    <select id="customerTypeId" class="form-select" name="customerTypeId">
                        <option value="1" ${customerTypeId==1? "selected":""}>Diamond</option>
                        <option value="2" ${customerTypeId==2? "selected":""} >Platinum</option>
                        <option value="3" ${customerTypeId==3? "selected":""} >Gold</option>
                        <option value="4" ${customerTypeId==4? "selected":""} >Silver</option>
                        <option value="5" ${customerTypeId==5? "selected":""} >Member</option>
                    </select>
                </div>
                <div class="col-md-5 p-2">
                    <label for="customerGenderId" class="form-label">Customer Gender</label>
                    <select id="customerGenderId" class="form-select" name="customerGenderId">
                        <option value="0" ${customerGenderId==0? "selected":""}>Male</option>
                        <option value="1" ${customerGenderId==1? "selected":""}>Female</option>
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
