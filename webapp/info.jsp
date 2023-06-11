<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ include file="nav.jsp" %>
<%@ include file="db_setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/popup.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="css/list_style.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
</head>
<body>
<div class="container">
<header>

<h2>장바구니</h2>
<hr>
</header>

<main>
<ol>

<%
//sql문
String sql = "select * from orders ORDER BY cus_name desc;";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

//주문한 음식의 이름, 가격 출력
while (rs.next()) {
    out.println("<li>");
	out.print("<span>" + rs.getString("cus_name")+ ":" + "</span>");
    out.print("<span>" + rs.getString("fc_name") + ":" +"</span>");
    out.print("<span>" + rs.getString("food_name") + ":" +"</span>");
    out.print("<span>" + rs.getString("food_price") + "</span>");
    out.println("</li>");    
}       
%>


</ol>
<hr>

<%

//총 금액 출력
String sql_1 = "select sum(food_price) as '주문 금액' from orders;";
PreparedStatement pstmt_1 = conn.prepareStatement(sql_1);
ResultSet rs_1 = pstmt_1.executeQuery();


while (rs_1.next()) {
	out.print("<span>" + "총 주문금액 : " + "</span>");
	out.print("<span>" + rs_1.getString("주문 금액") + "</span>");
}
%>

</main>

<footer>
<form method="post" action="main.jsp">		<!-- 메뉴판으로 이동 -->
	<input type="submit" value="메뉴판으로 가기">
</form>
<form method="post" action="orders_2.jsp">
	<input type="submit" value="주문하러 가기">		<!-- 	주문 페이지로 이동 -->
</form>
<button id="money">결제</button>			<!-- 결제 버튼 -->


</footer>
</div>
<script src="js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>