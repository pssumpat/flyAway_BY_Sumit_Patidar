<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localHost:3006/admin","root","tiger");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from airlines;");
	while(rs.next())
	{
		out.println(rs.getString(1)+"		"+rs.getString(2));
		out.println("<br>");
	}
	
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}	

%>
<br>
Add airline 	
<form action='addAirline'>
Airline Name		:	 <input type = 'text' name='airlineName'>
Airline Id	:	 <input type = 'text' name='airlineId'>
<input type='submit' value='Add'>
</form>
<br><br>
Remove airline 	
<form action='removeAirline'>
Airline Name		:	 <input type = 'text' name='airlineName'>
Airline Id	:	 <input type = 'text' name='airlineId'>
<input type='submit' value='Remove'>
</form>
</body>
</html>