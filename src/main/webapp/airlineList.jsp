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
	out.println("<table border=1 weidth=50% height=50% >");
	out.println("<tr><th>S. No.</th><th>Airline Name</th><th>Airline ID</th></tr>");
	int i=1;
	while(rs.next())
	{
		String n = rs.getString(1);String ID = rs.getString(2);
		out.println("<tr><td>"+i+"</td><td>"+n+"</td><td>"+ID+"</td></tr>");
		out.println("<br>");
		i++;
	}
	out.println("</table>");
	
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