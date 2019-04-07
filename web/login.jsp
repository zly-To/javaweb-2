<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.io.*,java.sql.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
String sql = "SELECT count(id) FROM user WHERE username = ? " + "AND password = ?";
Connection connection = null;
PreparedStatement statement = null;
ResultSet resultSet = null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql:///login";
	String user = "root";
	String password2 = "zsl980328";
	
	connection = DriverManager.getConnection(url,user,password2);
	
	statement = connection.prepareStatement(sql);
	statement.setString(1, username);
	statement.setString(2, password);
	
	resultSet = statement.executeQuery();
	
	
	
	if(resultSet.next()) {
		int count = resultSet.getInt(1);
		
		if(count > 0) {
			out.print("Hello: " + username);
		}else {
			out.print("Sorry: " + username);
		}
	}
	
} catch (Exception e) {
	e.printStackTrace();
} finally {
	try {
		if(resultSet != null) {
			resultSet.close();
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	try {
		if(statement != null) {
			statement.close();
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	try {
		if(connection != null) {
			connection.close();
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
}




%>
</body>
</html>
