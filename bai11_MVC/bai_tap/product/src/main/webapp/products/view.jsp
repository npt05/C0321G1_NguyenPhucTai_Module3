<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/29/2021
  Time: 9:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View</title>
</head>
<body>
<a href="/products">click để về lại show All bạn ơi</a>
${ product = requestScope["product"] }
<p>ID product: <span>${product.getId()}</span></p>
<p>Product name <input type="text" name="name" value="${product.getName()}" ></p>
<p>Product price <input type="text" name="price" value="${product.getPrice()}" ></p>
<p>Product description <input type="text" name="description" value="${product.getDescription()}" ></p>
<p>Product producer <input type="text" name="producer" value="${product.getProducer()}" ></p>

</body>
</html>