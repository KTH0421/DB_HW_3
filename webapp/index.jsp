<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Check Database Connection</title>
</head>
<body>
	<h1>Check Database Connection</h1>
	
	<%
		Connection conn = null;
		
		try {
			// 드라이버 로드
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			
			// 데이터베이스 연결
			String url = "jdbc:sqlserver://localhost:1433;databaseName=DB_hw";
			String username = "DB_hw_1";
			String password = "rlaxogus0421@";
			conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433", "DB_hw_1", "rlaxogus0421@");
			
			// 연결 성공 메시지 출력
			out.println("<p>Database connection succeeded!</p>");
			
		} catch (ClassNotFoundException e) {
			out.println("<p>Failed to load SQL Server driver.</p>");
		} finally {
			// 연결 종료
			if (conn != null) {
				try {
					conn.close();
				} finally{}
			}
		}
	%>
	
</body>
</html>
