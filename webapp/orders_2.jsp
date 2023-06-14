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
//버튼을 누르면 insert_values2.jsp 로 값을 넘김
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
//db에서 음식점이름을 받아와서  p태그 안에 출력하고 rs에 저장된 음식점 이름과 db에 저장된 음식점의 이름이 같으면 정보를 rs_1에 저장
while (rs.next()) {
    out.print("<p>" + rs.getString("fc_name") + "</p>");
	
    String sql_1 = "SELECT food_id, food_name, food_price, food_img FROM food WHERE food_court = ?;";
    PreparedStatement pstmt_1 = conn.prepareStatement(sql_1);
    pstmt_1.setString(1, rs.getString("fc_name"));
    ResultSet rs_1 = pstmt_1.executeQuery();
%>

//rs_1에 저장된 정보를 카드에 출력한다
    <div class="card-group">

        <%
        while (rs_1.next()) {
    	String food_id = rs_1.getString("food_id");
        %>
        //라벨로 묶어 사진이나 텍스트를 클릭해도 체크박스가 선택되도록함
        //jsp 태그안에서 출력하기위해 out.print안에 html 엘리먼트들을 넣음
        <label>
        <%
        out.println("<div class=\"card\" style=\"width: 220px;\">");
            //카드에 이미지를 넣고 크기를 지정해준다 
            out.print("<img src=\"" + rs_1.getString("food_img") + "\" class=\"card-img-top\" style=\"width: 220px; height: 220px;\">");
            //카드 body 안에 음식이름과 가격, 체크박스를 출력
            out.print("<div class=\"card-body\">");
            //체크박스를 클릭하면 음식의 foodid를 food 라는 이름으로 보냄
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