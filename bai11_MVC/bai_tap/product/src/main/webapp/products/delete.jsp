<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/29/2021
  Time: 9:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Delete</title>
</head>
<body>
<a href="/products">click để về lại show All bạn ơi</a>
<form method="post">
  ${ product = requestScope["product"] }
  <p>ID product: <span>${product.getId()}</span></p>
  <p>Product name:  <span>${product.getName()}</span></p>
  <p>Product price: <span>${product.getPrice()}</span></p>
  <p>Product description: <span>${product.getDescription()}</span></p>
  <p>Product producer: <span>${product.getProducer()}</span></p>
  <button type="submit" onclick='alert("Bạn đã xóa thành công")'>Click để delete bạn ơi</button>
</body>
<script>
  // function alertInfo() {
  //     alert()
  // }
</script>
</html>
