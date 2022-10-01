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
int selectedF = Integer.parseInt(request.getParameter("selectedFlight"));
String date = (String)session.getAttribute("date");
String from = (String)session.getAttribute("from");
String to = (String)session.getAttribute("to");
int ticketCount = Integer.parseInt((String)session.getAttribute("ticketCount"));

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
	out.println("Your selected flight details are given below, please proceed further..<br><br><br><br>");
	String selectedDetails;
	while(d.next())
	{ 
		if(i==selectedF)
		{
			out.println(d.getString(1)+"	"+d.getString(2)+"		"+d.getString(3)+"		"+d.getString(4)+"		"+d.getString(5)+"		"+d.getString(6)+"		"+d.getString(7)+"		"+d.getString(8)+"		");
			out.println("<br>");	
			selectedDetails = d.getString(1)+"	"+d.getString(2)+"		"+d.getString(3)+"		"+d.getString(4)+"		"+d.getString(5)+"		"+d.getString(6)+"		"+d.getString(7)+"		"+d.getString(8)+"		";
			session.setAttribute("selectedDetails", selectedDetails);
			String ticketPrice = d.getString(8);
			session.setAttribute("ticketPrice",ticketPrice);
		}
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
<form action = 'saveDetails.jsp'>
<br><br><br>Enter traveller's details<br><br>
<%
int i=1;
while(i<=ticketCount)
{
out.println("Passenger "+i+": <br>"
		+"Name : <input type='text' name = 'passengerName"+i+"'>"
		+"Address : <input type='text' name = 'passengerAddress"+i+"'>"
		+"Aadhar Number : <input type='text' name = 'passengerId"+i+"'>"
		+"Age : <input type='text' name = 'age"+i+"'>"
		+"Gender : <input type='text' name = 'gender"+i+"'><br><br>");	
i++;
}
%>


<input type = 'submit' value = 'Book Tickets'>
	
</form>
</body>
</html>