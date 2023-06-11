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
		<option value="부모">부모</option>
		<option value="아들">아들</option>	
		<option value="딸">딸</option>
	
	</select>
<br>

<ul>
<%
//푸드코트별 음식 출력
//SQL 실행

//음식점 출력 될때마다 음식점별 메뉴 정보를 카드에 출력

String sql = "SELECT * FROM food_court;";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

while (rs.next()) {
    out.print("<p>" + rs.getString("fc_name") + "</p>");
	
    String sql_1 = "SELECT food_id, food_name, food_price, food_img FROM food WHERE food_court = ?;";
    PreparedStatement pstmt_1 = conn.prepareStatement(sql_1);
    pstmt_1.setString(1, rs.getString("fc_name"));
    ResultSet rs_1 = pstmt_1.executeQuery();
%>
    <div class="card-group">

        <%
        while (rs_1.next()) {
    	String food_id = rs_1.getString("food_id");
        %>

        <label>
        <%
        out.println("<div class=\"card\" style=\"width: 220px;\">");
            out.print("<img src=\"" + rs_1.getString("food_img") + "\" class=\"card-img-top\" style=\"width: 220px; height: 220px;\">");
            out.print("<div class=\"card-body\">");
            out.print("<h5 class=\"card-title\">" + rs_1.getString("food_name") +"\t" +"<input type='checkbox' name='food' value='" + food_id + "'/>"+"</h5>");
            out.print("<p class=\"card-text\">"+rs_1.getString("food_price")+"</p>");
            out.print("</div>");
            out.print("</div>");
        %>
        </label>
<%
    }
    %>
    </div>
<%
}
%>

</ul>
<br>
<hr>
<br>
<!-- 장바구니 페이지로 이동 -->
<input type="submit" value="주문하기">
</form>
</div>
<br><br>

</main>





<footer>


</footer>

</div>
<script src="js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>