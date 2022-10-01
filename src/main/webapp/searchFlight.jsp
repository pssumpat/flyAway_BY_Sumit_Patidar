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
String dateUnsorted = request.getParameter("date");
String year = dateUnsorted.substring(0, 4);
String month = dateUnsorted.substring(5, 7);
String day = dateUnsorted.substring(8);
String date = day+"/"+month+"/"+year;

String from = request.getParameter("from");
String to = request.getParameter("to");
String ticketCount = request.getParameter("ticketCount");

session.setAttribute("date",date);
session.setAttribute("from",from);
session.setAttribute("to",to);
session.setAttribute("ticketCount",ticketCount);

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localHost:3006/admin","root","tiger");
	
	Statement stmt = con.createStatement();
	ResultSet d = stmt.executeQuery("select A.flightId as FLIGHT_NAME, F.airlineName as AIRLINE_NAME, R.source as SOURCE,R.destination as DESTINATION,S.date,S.timeDepart as DEPART_FROM_SOURCE,S.timeArrive as ARIVE_TO_DESTINATION, A.ticketPrice as TICKET_FARE from schedule as S \r\n"
			+ "LEFT JOIN routes R ON S.routeId = R.routeId\r\n"
			+ "LEFT JOIN assign A on S.routeId = A.routeId\r\n"
			+ "LEFT JOIN flights F on A.flightId = F.FlightId\r\n"
			+ "where S.date = '"+date+"' and R.source = '"+from+"' and R.destination = '"+to+"';");
	
	int i=1;
	while(d.next())
	{ 
		out.println(i+" :: "+d.getString(1)+"	"+d.getString(2)+"		"+d.getString(3)+"		"+d.getString(4)+"		"+d.getString(5)+"		"+d.getString(6)+"		"+d.getString(7)+"		"+d.getString(8)+"		");
		out.println("<br>");
		i++;
	
	}
 
}
catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (SQLException e) {
	out.println("Airline ID or Airline Name already exists, Please check your input...");
	out.println("Go try, <a href='airlineList.jsp'>again</a>");
	// TODO Auto-generated catch block
	e.printStackTrace();
}	
	
%>
<br><br>
<form action='book.jsp'>
Choose flight ::<input type="text" name='selectedFlight'>
<input type='submit' value ='BOOK NOW'>
</form>
</body>
</html>