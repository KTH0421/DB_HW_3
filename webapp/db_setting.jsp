<%
//db세팅
String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
String url = "jdbc:sqlserver://localhost:1433;databaseName=DB_hw";
String username = "DB_hw_1";
String password = "rlaxogus0421@";
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=DB_hw",
"DB_hw_1","rlaxogus0421@");
%>