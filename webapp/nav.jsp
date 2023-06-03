<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 상단 메뉴바 -->

    <script src="js/bootstrap.js"></script>
  	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
</head>
<body>
  <!-- <div class="container">
	<nav>
		<ul>
        <li><a href="main.jsp">메뉴판</a></li>
        <li><a href="orders_2.jsp">주문</a></li>
        <li><a href="info.jsp">장바구니</a></li>
        <li><a href="coupon2.jsp">쿠폰</a></li>
      </ul>
	</nav>
</div> -->

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container px-4 px-lg-5">
      <a class="navbar-brand" href="#!">FOOD COURT</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
              <li class="nav-item"><a class="nav-link active" aria-current="page" href="main.jsp">MENU</a></li>
              <li class="nav-item"><a class="nav-link active" aria-current="page" href="orders_2.jsp">Order</a></li>
              <!-- <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" id="navbarDropdown" href="orders_2.jsp" role="button" data-bs-toggle="dropdown" aria-expanded="false">Orders</a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <li><a class="dropdown-item" href="">상하이</a></li>

                      <li><a class="dropdown-item" href="#!">한성면옥</a></li>
                      <li><a class="dropdown-item" href="#!">전주한식</a></li>
                      <li><a class="dropdown-item" href="#!">돈이돈가스</a></li>
                    </ul>
              </li> -->
              
          </ul>
          <form class="d-flex" action="info.jsp">
              <button class="btn btn-outline-dark " type="submit">
                  <i class="bi-cart-fill me-1"></i>
                  Cart
                  <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
              </button>
          </form>
      </div>
  </div>
</nav>


	<hr>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>