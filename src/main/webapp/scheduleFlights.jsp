<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action ='scheduleFlight'>
Route Id			:		<input type='text' name='routeId'><br><br>
date				:		<input type='text' name='date'><br><br>
Time for departure 	:		<input type='text' name='timeDepart'><br><br>
Time for landing	:		<input type='text' name='timeArrive'><br><br>
<input type='submit' value='Schedule'><br><br>
</form>

<%
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localHost:3006/admin","root","tiger");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from schedule");
	while(rs.next())
	{
		out.println(rs.getString(1)+"		"+rs.getString(2)+"		"+rs.getString(3)+"		"+rs.getString(4));
		out.println("<BR>");
	}
}
catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}	
%>
</body>
</html>