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
//sql문 orders테이블에서 모든 컬럼의 정보를 cus_name으로 내림차순으로 뽑아옴
String sql = "select * from orders ORDER BY cus_name desc;";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

//주문한 음식의 이름, 가격 출력
//받아온 값들을 따로 변수에 저장해 출력하지않고 rs.getString으로 바로 출력
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
//집계함수 sum을 이용해 선택하여 orders테이블에 저장된 모든 음식의 가격 합계를 rs_1에 저장
String sql_1 = "select sum(food_price) as '주문 금액' from orders;";
PreparedStatement pstmt_1 = conn.prepareStatement(sql_1);
ResultSet rs_1 = pstmt_1.executeQuery();

//총가격 출력
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
//js를 사용하여 페이지 이동과 팝업을 모두 한번에 함
<button id="money">결제</button>			<!-- 결제 버튼 -->


</footer>
</div>
<script src="js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>