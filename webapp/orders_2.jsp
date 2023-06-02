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
<link rel="stylesheet" type="text/css" href="css/list_style.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
</head>
<body>
    <div class="container">
<header>
	<h1>주문하기</h1>
	<hr>


</header>
<main>
<div class="container">

<form method="post" action="insert_values2.jsp" accept-charset="utf-8" id="orderForm">
<!-- 주문할사람 선택 -->
<label for="order">주문자</label>
	<select name="name" id = order>
		<option value="엄마">엄마</option>
		<option value="아들">아들</option>	
		<option value="딸">딸</option>
	
	</select>
<br>



<ul>
<%
//db 세팅

// SQL 실행
//푸드코트별 음식 출력
String sql = "SELECT * FROM food_court;";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

while (rs.next()) {
    out.print("<p>" + rs.getString("fc_name") + "</p>");
	
    String sql_1 = "SELECT food_id, food_name, food_price FROM food WHERE food_court = ?;";
    PreparedStatement pstmt_1 = conn.prepareStatement(sql_1);
    pstmt_1.setString(1, rs.getString("fc_name")); // ?에 음식점 이름(fc_name)을 설정
    ResultSet rs_1 = pstmt_1.executeQuery();

    while (rs_1.next()) {
    	String food_id = rs_1.getString("food_id");
        out.println("<li>");
        out.println("<input type='checkbox' name='food' value='" + food_id + "'/>");	//음식 선택 체크박스, foodid를 넘김
        out.print("<span>" + rs_1.getString("food_name") + "</span>");
        out.print("<span>" + rs_1.getString("food_price") + "</span>");
        out.println("</li>");
    }
}
%>

</ul>

<!-- 장바구니 페이지로 이동 -->
<input type="submit" value="주문하기">
</form>
</div>

</main>





<footer>


</footer>

</div>
<script src="js/bootstrap.js"></script>
</body>
</html>