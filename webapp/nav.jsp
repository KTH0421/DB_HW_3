<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 상단 메뉴바 -->
<style>
    nav ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
      display: flex;
    }

    nav li {
      margin-right: 10px;
    }
	nav a:link,
    nav a:visited {
      color: black;
      text-decoration: none;
      
    }
  </style>
  	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
</head>
<body>
  <div class="container">
	<nav>
		<ul>
        <li><a href="main.jsp">메뉴판</a></li>
        <li><a href="orders_2.jsp">주문</a></li>
        <li><a href="info.jsp">장바구니</a></li>
        <li><a href="coupon2.jsp">쿠폰</a></li>
      </ul>
	</nav>
</div>
	<hr>


  <script src="js/bootstrap.js"></script>
</body>
</html>