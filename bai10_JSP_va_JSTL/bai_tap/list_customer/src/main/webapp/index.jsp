<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/29/2021
  Time: 8:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>$Title$</title>
</head>
<style>
  table tr td {
    border: 1px solid red ;
    padding: 5px;
    border-collapse: collapse;
  }
  img {
    width: 50px;
    height: 50px;
  }
</style>
<body>
<table style="border: aqua solid 10px;border-collapse: collapse;text-align: center;display: flex;
  justify-content: center; padding: 10px; width: 50%">
  <h1>Customer List</h1>
  <tr>
    <th>Name</th>
    <th>Date of birth</th>
    <th>Address</th>
    <th>Picture</th>
  </tr>
  <c:forEach items='${requestScope["customerList"]}' var="customer">
    <tr style="border: yellowgreen solid">
      <th>${customer.getName()}</th>
      <th>${customer.getDateOfBirth()}</th>
      <th>${customer.getAddress()}</th>
      <th width="50" height="50"><img src="${customer.getImg()}" alt="Lag rồi bạn ơi"></th>
    </tr>
  </c:forEach>
</table>

</body>
</html>
