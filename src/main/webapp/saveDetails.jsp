<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Please confirm your details and proceed
<br><br>
<% 
String selectedDetails = (String)session.getAttribute("selectedDetails");
out.println(selectedDetails);
%>
<br><br>

<%
int i=1;
int ticketCount=Integer.parseInt((String)session.getAttribute("ticketCount"));
while(i<=ticketCount)
{
out.println("<br>Passenger "+i+": <br>"
		+"Name : "+request.getParameter("passengerName"+i+"")+"   <br>"
		+"Address : "+request.getParameter("passengerAddress"+i+"")+"  <br>"
		+"Aadhar Number : "+request.getParameter("passengerId"+i+"")+"  <br>"
		+"Age : "+request.getParameter("age"+i+"")+"  <br>"
		+"Gender : "+request.getParameter("gender"+i+"")+" <br>");
		i++;
}
double ticket = Double.parseDouble((String)session.getAttribute("ticketPrice"));

%>
<BR>
Fare breakup		 :  <%=ticket%> INR * <%=ticketCount%> Tickets<br>
Total Amount to Pay  :  <%out.println(ticket*ticketCount); %>
<form action='paymentGateway.jsp'>
<input type='submit' value='Confirm and Pay'>
</form>
</body>
</html>