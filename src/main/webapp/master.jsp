<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.sql.*"%>
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
	ResultSet rs = stmt.executeQuery("select A.flightId as FLIGHT_NAME, F.airlineName as AIRLINE_NAME, R.source as SOURCE,R.destination as DESTINATION,A.ticketPrice as TICKET_FARE from assign A LEFT JOIN routes R ON A.routeId = R.routeId LEFT JOIN flights F on A.flightId = F.flightId;");
	while(rs.next())
	{
		out.println(rs.getString(1)+"		"+rs.getString(2)+"		"+rs.getString(3)+"		"+rs.getString(4)+"		"+rs.getString(5));
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