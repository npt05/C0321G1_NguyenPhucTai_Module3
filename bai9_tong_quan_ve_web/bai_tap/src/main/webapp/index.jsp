<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/26/2021
  Time: 7:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Currency Converter</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h2>Product Discount Calculator</h2>
<form action="/discount" method="post">
  <label>Product Description: </label><br/>
  <input type="text" name="rate" placeholder="Product Description"/><br/>
  <label>List Price: </label><br/>
  <input type="text" name="price" placeholder="USD" /><br/>
  <label>Discount Percent: </label><br/>
  <input type="text" name="percent" placeholder="%" /><br/>
  <input type = "submit" id = "submit" value = "Discount"/>
</form>
</body>
</html>
