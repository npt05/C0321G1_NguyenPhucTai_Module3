<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/6/2021
  Time: 9:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <form action="/employee?action=delete" method="post" id="deleteForm">
        <input type="hidden" name="employeeId" value="<c:out  value='${employee.id}'/>">
      </form>
      <form class="row g-3" action="/employee?action=edit" method="post" id="editForm">
        <input type="hidden" name="employeeId" value="<c:out  value='${employee.id}'/>">
        <div class="col-md-5">
          <label for="employeeName" class="form-label">Employee Name</label>
          <input type="text" class="form-control" id="employeeName" name="employeeName"
                 value="<c:out  value='${employee.name}'/>">
        </div>
        <div class="col-md-5">
          <label for="employeeBirthday" class="form-label">Employee Birthday</label>
          <input type="date" class="form-control" id="employeeBirthday" name="employeeBirthday"
                 value="<c:out  value='${employee.birthday}'/>">
        </div>
        <div class="col-md-5">
          <label for="employeeIdCard" class="form-label">Employee IdCard</label>
          <input type="text" class="form-control" id="employeeIdCard" name="employeeIdCard"
                 value="<c:out  value='${employee.idCard}'/>">
        </div>
        <div class="col-md-5">
          <label for="employeePhone" class="form-label">Employee Phone</label>
          <input type="text" class="form-control" id="employeePhone" name="employeePhone"
                 value="<c:out  value='${employeePhone.phone}'/>">
        </div>
        <div class="col-md-5">
          <label for="employeeEmail" class="form-label">Employee Email </label>
          <input type="email" class="form-control" id="employeeEmail" name="employeeEmail"
                 value="<c:out  value='${employee.email}'/>">
        </div>
        <div class="col-md-5">
          <label for="employeeAddress" class="form-label">Employee Address </label>
          <input type="text" class="form-control" id="employeeAddress" name="employeeAddress"
                 value="<c:out  value='${employee.address}'/>">
        </div>
        <div class="col-md-5">
          <label for="employeeSalary" class="form-label">Employee Salary</label>
          <input type="text" class="form-control" id="employeeSalary" name="employeeSalary"
                 value="<c:out  value='${employee.salary}'/>">
        </div>
        <div class="col-md-5">
          <label for="username" class="form-label">Employee Username</label>
          <input type="text" class="form-control" id="username" name="username"
                 value="<c:out  value='${employee.username}'/>">
        </div>
        <div class="col-md-5 p-2">
          <label for="positionId" class="form-label">Position</label>
          <select id="positionId" class="form-select" name="positionId">
            <option value="1" >Receptionist</option>
            <option value="2" >Waiter</option>
            <option value="3" >Expert</option>
            <option value="4" >Supervisor</option>
            <option value="5" >manager</option>
            <option value="6" >director</option>
          </select>
        </div>
        <div class="col-md-5 p-2">
          <label for="educationDegreeId" class="form-label">Education Degree</label>
          <select id="educationDegreeId" class="form-select" name="educationDegreeId">
            <option value="1">Secondary Schools</option>
            <option value="2">College</option>
            <option value="3">University</option>
            <option value="4">After University</option>
          </select>
        </div>
        <div class="col-md-5 p-2">
          <label for="divisionId" class="form-label">Division</label>
          <select id="divisionId" class="form-select" name="divisionId">
            <option value="1">Sales - Marketing</option>
            <option value="2">Administration</option>
            <option value="3">Serve</option>
            <option value="4">Manage</option>
          </select>
        </div>
        <div class="col-md-5 p-3">
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
            UPDATE
          </button>
        </div>
        <div class="col-md-5 p-3">
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
<script src="${pageContext.request.contextPath}/asset/jquery/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/jquery/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/asset/bootstrap4/js/bootstrap.js"></script>
</body>
</html>
