<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<h2 align="center"> Employee Profile</h2>
<title>Employee Profile</title>
</head>

<body bgcolor="white">

 <%@include file="EmHeader.jsp" %>

<%@page import="java.sql.*" %>
<table align="center" width ="900" height="150" border="2">
<tr><td>Employee Id</td>
<td>Username</td>
<td>Email</td>
<td>Phone</td>
<td>Remaining Days</td> 
<td>Action</td>
</tr>



<%
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/mysql?serverTimezone=UTC";
String username = "root";
String password = "band12.6"; 
Connection con = DriverManager.getConnection(url, username, password);
Object ob=session.getAttribute("eid"); // get attribute is a instance factory method
int eid=(Integer)ob;
PreparedStatement ps=con.prepareStatement("select * from employee where eid=?");
ps.setInt(1,eid);
ResultSet rs=ps.executeQuery();
while(rs.next()){
%>
<tr>
<td><%=rs.getInt("eid") %></td> 
<td><%=rs.getString("username") %></td>
<td><%=rs.getString("email") %></td>
<td><%=rs.getLong("phone") %></td>
<td><%=rs.getLong("days") %></td>  
<td><a href="updateprofile_employee.jsp?<%=rs.getInt("eid")%>">Update</a> </td>

<%
} 
%>
  
</table>

</table> 

</body>
</html>