<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Random" %>
<%@ include file="nav.jsp" %>
<%@ include file="db_setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/table_style.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
</head>
<body>
<header>

</header>

<main>
    <div class="container">
<!-- 테이블에 쿠폰번호 출력 -->
<h2>쿠폰번호</h2>
<div class="col-md-6">
<table border="1" id="table" class="table table-bordered border-black text-center">
<tr>
	<th>고객</th>
	<th>음식점</th>
	<th>음식</th>
	<th>가격</th>
	<th>주문번호</th>
</tr>

<%
//SQL 실행
String sql = "SELECT * FROM orders ORDER BY cus_name desc;;";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

// orders table 출력
while (rs.next()) {	
    out.println("<tr>");
    out.print("<td>" + rs.getString("cus_name") + "</td>");
    out.print("<td>" + rs.getString("fc_name") + "</td>");
    out.print("<td>" + rs.getString("food_name") + "</td>");
    out.print("<td>" + rs.getString("food_price") + "</td>");
    out.print("<td>" + rs.getString("coupon_num") + "</td>");
    out.println("</tr>");
}
rs.close();
%>
</table>
</div>
</div>
</main>

<footer>

</footer>

</body>
<script src="js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</html>