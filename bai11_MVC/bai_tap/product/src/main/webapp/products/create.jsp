<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/29/2021
  Time: 9:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Create New Product</title>
</head>
<body>

<a href="/products">click để về lại show All bạn ơi</a>
<form method="post">
  <p> New Product Name <input type="text" name="name" placeholder="New Product Name"></p>
  <p> New Product Price <input type="text" name="price" placeholder="New Product Price"></p>
  <p> New Product Description <input type="text" name="description" placeholder="New Product Description"></p>
  <p> New Product Producer <input type="text" name="producer" placeholder="New Product Producer"></p>
  <button type="submit">Bấm vào đây để tạo mới bạn ơi</button>
</form>
<h1>${requestScope["message"]} </h1>

</body>
</html>
