<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String name = (String)request.getAttribute("k");
%>
Hello,<%=name%><br>
Welcome to flyAway - airline ticket booking system
<br><br>
<form action='searchFlight.jsp' method='post'>
Enter date of traveling  : <input type='date' name='date' placeholder='dd-mm-yyyy'><br><br>
From				     : <input type='text' name='from'><br><br>
TO						 : <input type='text' name='to'><br><br>
Passengers				 : <input type='text' name='ticketCount'><br><br>
<input type='Submit' value='Search Flights'><br><br>
</form>
</body>
</html>