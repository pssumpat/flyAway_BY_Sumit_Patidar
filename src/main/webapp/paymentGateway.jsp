<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

Choose payment method<br>
<br>
Credit Card<br>
Enter your card details <br>
<form action = 'confirm.jsp'>
Card Number 	:	<input type='text' name='DCardNo'><br><br>
Pin				:	<input type='text' name='pin'><br><br>
<input type='submit' value='Pay'>
</form><br><br>
Debit Card<br>
Enter your card details <br>
<form action='confirm.jsp'>
Card Number 	:	<input type='text' name='DCardNo'><br><br>
Pin				:	<input type='text' name='pin'><br><br>
<input type='submit' value='Pay'>

</form>



<% 

%>
</body>
</html>