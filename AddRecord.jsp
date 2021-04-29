<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Record</title>
</head>
<body>
<%
try {
String name = request.getParameter("name");
String city = request.getParameter("city");
String phone = request.getParameter("phone");
String connectionURL = "jdbc:mysql://localhost:3306/Assignment";
Connection connection = null;
PreparedStatement pstatement = null;
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(connectionURL,"root", "root123");
String queryString = "INSERT INTO Directory VALUES (?, ?, ?)";
pstatement = connection.prepareStatement(queryString);
pstatement.setString(1, name);
pstatement.setString(2, city);
pstatement.setString(3, phone);
int updateQuery = pstatement.executeUpdate();
if (updateQuery != 0) {
System.out.println("it run");
out.print(" <h1>Congrats!! Record inserted successfully</h1>");
}
}
catch (Exception ex) {
out.println(ex);
out.println("Error occured");
}
finally { }
%>
</body>
</html>

