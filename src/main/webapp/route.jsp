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
	ResultSet rs = stmt.executeQuery("select * from routes;");
	while(rs.next())
	{
		out.println(rs.getString(1)+"		"+rs.getString(2)+"			"+rs.getString(3));
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
Add Route 	
<form action='addRoute'>
Route ID		:	 <input type = 'text' name='routeId'>
Source			:	 <input type = 'text' name='source'>
Destination		:	 <input type = 'text' name='destination'>
<input type='submit' value='Add'>
</form>
<br><br>
Remove Route 	
<form action='removeRoute'>
Route ID		:	 <input type = 'text' name='routeId'>
Source			:	 <input type = 'text' name='source'>
Destination		:	 <input type = 'text' name='destination'>
<input type='submit' value='Remove'>
</form>
<br><br>
Assign Flights for routes and ticket Price
<form action='assign'>
Flight ID / Name	:	 <input type = 'text' name='flightId'>
Route ID			:	 <input type = 'text' name='routeId'>
Ticket Price			:	 <input type = 'text' name='ticketPrice'>
<input type='submit' value='Assign'>
</form><br><br>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con1 = DriverManager.getConnection("jdbc:mysql://localHost:3006/admin","root","tiger");
	Statement stmt1 = con1.createStatement();
	ResultSet rs1 = stmt1.executeQuery("select A.flightId,A.routeId,A.ticketPrice,R.source,R.destination FROM ASSIGN A left join routes R on A.routeId = R.routeId;");
	while(rs1.next())
	{
		out.println(rs1.getString(1)+"		"+rs1.getString(2)+"			"+rs1.getString(3)+"			"+rs1.getString(4)+"			"+rs1.getString(5));
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

</body>
</html>