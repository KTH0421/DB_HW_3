<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="nav.jsp" %>
<%@ include file="db_setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>메인페이지</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/table_style.css">

</head>
<div>

<div class="container">
    <div class="container">
        <div class="col-md-3">
<header>
	<h2>MENU</h2>
</header>

	<hr>
<main>
<h3>음식점</h3>
<!-- 음식점 출력 -->
<table border="1" id="table" class="table w-50 table-bordered border-black text-center">
<tr>
	<th>ID</th>
	<th>Name</th>
</tr>

<%

// SQL 실행
String sql = "SELECT * FROM food_court;";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

// 쿼리 결과 출력
while (rs.next()) {
    out.println("<tr>");
    out.print("<td>" + rs.getString("fc_id") + "</td>");
    out.print("<td>" + rs.getString("fc_name") + "</td>");
    out.println("</tr>");            
}    
%>

</table>
</div>	
</div>
<!-- 	음식점별 메뉴 출력 -->


<div class="container text-center">
    <h3 class="text-start">메뉴</h3>   
    <div class="row">

    <div class="col-md-3">

<table border="1" id="table" class="table w-100 table-bordered border-black">
<tr>
	<th>음식점</th>
	<th>음식</th>
	<th>가격</th>
</tr>

<%
// SQL 실행
String sql_1 = "select food_court, food_name, food_price from food where food_court like '상하이';";
PreparedStatement pstmt_1 = conn.prepareStatement(sql_1);
ResultSet rs_1 = pstmt_1.executeQuery();

// 쿼리 결과 출력
while (rs_1.next()) {
    out.println("<tr>");
    out.print("<td>" + rs_1.getString("food_court") + "</td>");
    out.print("<td>" + rs_1.getString("food_name") + "</td>");
    out.print("<td>" + rs_1.getInt("food_price") + "</td>");
    out.println("</tr>");
    
}
rs_1.close();
pstmt_1.close();
%>
</table>
</div>

<div class="col-md-3">
<table border="1" id="table" class="table w-100 table-bordered border-black">
<tr>
	<th>음식점</th>
	<th>음식</th>
	<th>가격</th>
</tr>

<%

// SQL 실행
String sql_2 = "select food_court, food_name, food_price from food where food_court like '한성면옥';";
PreparedStatement pstmt_2 = conn.prepareStatement(sql_2);
ResultSet rs_2 = pstmt_2.executeQuery();

// 쿼리 결과 출력
while (rs_2.next()) {
    out.println("<tr>");
    out.print("<td>" + rs_2.getString("food_court") + "</td>");
    out.print("<td>" + rs_2.getString("food_name") + "</td>");
    out.print("<td>" + rs_2.getInt("food_price") + "</td>");
    out.println("</tr>");
    
}
rs_2.close();
pstmt_2.close();
%>
	</table>
</div>
</div>
</div>
<div class="container text-center">
    <div class="row">
        <div class="col-md-3">
<table border="1" id="table" class="table w-100 table-bordered border-black">
    <thead>
	<tr>
		<th>음식점</th>
		<th>음식</th>
		<th>가격</th>
	</tr>
</thead>
<%
// SQL 실행
String sql_3 = "select food_court, food_name, food_price from food where food_court like '전주한식';";
PreparedStatement pstmt_3 = conn.prepareStatement(sql_3);
ResultSet rs_3 = pstmt_3.executeQuery();

// 쿼리 결과 출력
while (rs_3.next()) {

    out.println("<tr>");
    out.print("<td>" + rs_3.getString("food_court") + "</td>");
    out.print("<td>" + rs_3.getString("food_name") + "</td>");
    out.print("<td>" + rs_3.getInt("food_price") + "</td>");
    out.println("</tr>");

}
rs_3.close();
pstmt_3.close();
%>
</table>
</div>
<div class="col-md-3">
<table border="1" id=table class="table w-100 table-bordered border-black">
<tr>
	<th>음식점</th>
	<th>음식</th>
	<th>가격</th>
</tr>

<%
// SQL 실행
String sql_4 =  "select food_court, food_name, food_price from food where food_court like '돈이돈가스';";
PreparedStatement pstmt_4 = conn.prepareStatement(sql_4);
ResultSet rs_4 = pstmt_4.executeQuery();

// 쿼리 결과 출력
while (rs_4.next()) {
    out.println("<tr>");
    out.print("<td>" + rs_4.getString("food_court") + "</td>");
    out.print("<td>" + rs_4.getString("food_name") + "</td>");
    out.print("<td>" + rs_4.getInt("food_price") + "</td>");
    out.println("</tr>");
    
}
rs_4.close();
pstmt_4.close();
conn.close();
%>
</table>
</div>
</div>
</div>
</main>


<footer>
<!-- 주문 페이지로 이동 -->
<form method="post" action="orders_2.jsp">
	<input type="submit" value="주문하러가기">
</form>
</div>
</div>
asdfdghgfjkdfsdgfhg
</footer>
<script src="js/bootstrap.js"></script>
</html>
