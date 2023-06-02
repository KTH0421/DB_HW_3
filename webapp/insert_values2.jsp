<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Random" %>
<%@ include file="db_setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 및 결제</title>
</head>
<body>

<header>

</header>
<main>
<%
request.setCharacterEncoding("UTF-8");
%>
<!-- 주문한 고객의 이름을 받아옴 -->
<%
String name = request.getParameter("name");
%>

<div>
<!-- 장바구니 페이지로 넘어감 -->
<form method="post" action="info.jsp">

<ul>

<%   
// foodid를 받아옴
String[] selectedFoods = request.getParameterValues("food");

// food_id가 선택되어 있다면, food_court,food_price를 DB에서 검색합니다.
if(selectedFoods != null) {

	for (String foodId : selectedFoods) {
		String sql = "SELECT food_name, food_price, food_court FROM food WHERE food_id = " + foodId;

	    // 쿼리 실행 후 결과를 받아옵니다.
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    ResultSet rs = pstmt.executeQuery();
	    if(rs.next()) {

	    		// 쿠폰 번호 생성
	    		String characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	    		int codeLength = 8;

	    		Random random = new Random();
	    		StringBuilder couponCode = new StringBuilder(codeLength);
	    		for (int i = 0; i < codeLength; i++) {
	    		    int randomIndex = random.nextInt(characters.length());
	    		    char randomChar = characters.charAt(randomIndex);
	    		    couponCode.append(randomChar);
	    		    
	    		}
	    	String randomString = couponCode.toString();		//랜덤 쿠폰번호
	        String foodName = rs.getString("food_name");		//음식이름 변수
	        int foodPrice = rs.getInt("food_price");			//음식가격 변수
	        String foodCourt = rs.getString("food_court");		//음식점 변수
	        
// 	        orders.jsp에서 받아온 값들을 db에 insert
			String sql_1 = "INSERT INTO orders (cus_name,food_name,food_price, fc_name, coupon_num) VALUES (?,?,?,?,?)";
		    PreparedStatement pstmt_1 = conn.prepareStatement(sql_1);
		    ResultSet rs_1 = pstmt.executeQuery();

	    	pstmt_1.setString(1,name);
	        pstmt_1.setString(2, foodName);
	        pstmt_1.setInt(3, foodPrice);
	        pstmt_1.setString(4, foodCourt);
	        pstmt_1.setString(5, randomString);
	        pstmt_1.executeUpdate();
		}
	}
}  
%>
</ul>

</form>
</div>
<%
// 이 페이지는 웹에서 보여지지 않고 바로 장바구니 페이지로 넘어감
response.sendRedirect("info.jsp");
%>
</main>
<footer>
</footer>
</body>
</html>