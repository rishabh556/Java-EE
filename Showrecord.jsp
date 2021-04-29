<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check record existence</title>
</head>
<body>
<%
try {
String name = request.getParameter("name");
String city = request.getParameter("city");
String phone = request.getParameter("phone");
String connectionURL = "jdbc:mysql://localhost:3306/Assignment";
Connection con = null;
PreparedStatement pstatement = null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(connectionURL,"root", "root123");
String SearchIt=request.getParameter("searchit");
String query="select * from Directory where name='"+SearchIt+"'";
PreparedStatement ps=con.prepareStatement(query);
ResultSet rs=ps.executeQuery();
while(rs.next()){
out.println("");
out.println("<h1> Name: "+ rs.getString(1) + "</h1><h1>City: "+rs.getString(2)+"</h1><h1>Phone: "+rs.getString(3)+" </h1>");
}
}
catch (Exception ex) {
out.println("This user does not exists!! ");
}
finally { }
%>
</body>
</html>
 
