<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<h2 align="center">Employee Home</h2>
<title>Employee Home</title>
</head>

<body bgcolor="white">


<%@include file="EmHeader.jsp" %>

<%@page import="java.sql.*" %>
<table align="center" width ="900" height="150" border="2">
<tr><td>Leave Id</td>
<td>Username</td>
<td>Email</td>
<td>Phone</td>
<td>Department</td>
<td>Reason</td>
<td>StardDate</td>
<td>EndDate</td>
<td>Status</td>
<td>Leave Days</td>


</tr>



<%
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/mysql?serverTimezone=UTC";
String username = "root";
String password = "band12.6"; 
Connection con = DriverManager.getConnection(url, username, password);
String specialist=(String)session.getAttribute("department");
Object ob=session.getAttribute("eid"); // get attribute is a instance factory method
int i=(Integer)ob;

PreparedStatement ps=con.prepareStatement("select * from employeeleave where eid=?");

ps.setInt(1,i);
ResultSet rs=ps.executeQuery();
while(rs.next()){
%>
<tr>
<td><%=rs.getInt("lid") %></td> 
<td><%=rs.getString("username") %></td>
<td><%=rs.getString("email") %></td>
<td><%=rs.getLong("phone") %></td>
<td><%=rs.getString("department") %></td>
<td><%=rs.getString("reason") %></td>
<td><%=rs.getString("startDate") %></td>
<td><%=rs.getString("endDate") %></td>
<td><%=rs.getString("status") %></td>
<td><%=rs.getString("Leavedays") %></td>

</tr>
<%
} 
%>
  
</table>



</body>
</html>