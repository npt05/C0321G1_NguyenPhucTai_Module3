<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/29/2021
  Time: 8:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>$Title$</title>
</head>
<body>
<h1>SIMPLE CAlCULATOR</h1>
<H5>Calculator</H5>
<form action="/caculator" method="post">
  <p>First Operator <label>
    <input type="text" name="first operator">
  </label></p>
  <select name="operator">
    <option value="+">Addition</option>
    <option value="-">Subtraction</option>
    <option value="*">Multiplication</option>
    <option value="/">Division</option>
  </select>
  <p>Second Operator <label>
    <input type="text" name="second operator">
  </label></p>
  <button type="submit">Calculate</button>
</form>
</body>
</html>
