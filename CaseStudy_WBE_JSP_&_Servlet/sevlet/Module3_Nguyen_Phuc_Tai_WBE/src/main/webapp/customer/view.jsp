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

        <form class="row g-3" action="/customer?action=edit" method="post">
            <input type="hidden" name="customerId" value="<c:out  value='${customer.id}'/>">
            <div class="col-md-6">
                <label class="form-label font-weight-bold">Customer Id:</label>
                <p>
                    <c:out value='${customer.id}'/>
                </p>
            </div>
            <div class="col-md-6">
                <label class="form-label font-weight-bold">Customer Name:</label>
                <p>
                    <c:out value='${customer.name}'/>
                </p>
            </div>
            <div class="col-md-6">
                <label class="form-label font-weight-bold">Customer Birthday:</label>
                <p>
                    <c:out value='${customer.birthday}'/>
                </p>
            </div>
            <div class="col-md-6">
                <label class="form-label font-weight-bold">Customer IdCard:</label>
                <p>
                    <c:out value='${customer.idCard}'/>
                </p>
            </div>
            <div class="col-md-6">
                <label class="form-label font-weight-bold">Customer Phone:</label>
                <p>
                    <c:out value='${customer.phone}'/>
                </p>
            </div>
            <div class="col-md-6">
                <label class="form-label font-weight-bold">Customer Email:</label>
                <p>
                    <c:out value='${customer.email}'/>
                </p>
            </div>
            <div class="col-md-6">
                <label class="form-label font-weight-bold">Customer Address:</label>
                <p>
                    <c:out value='${customer.address}'/>
                </p>
            </div>
            <div class="col-md-6">
                <label class="form-label font-weight-bold">Customer Code:</label>
                <p>
                    <c:out value='${customer.customerCode}'/>
                </p>
            </div>
            <div class="col-md-6">
                <label class="form-label font-weight-bold">Customer Type:</label>
                <p>
                    <c:out value='${customer.customerType}'/>
                </p>
            </div>
            <div class="col-md-6">
                <label class="form-label font-weight-bold">Customer Gender:</label>
                <p>
                    <c:out value='${customer.customerGender}'/>
                </p>
            </div>
        </form>
    </div>
</div>

<jsp:include page="/layout1/footer.jsp" />

<script src="asset/jquery/jquery-3.5.1.min.js"></script>
<script src="asset/jquery/popper.min.js"></script>
<script src="asset/bootstrap4/js/bootstrap.js"></script>
</body>
</html>