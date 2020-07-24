<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<h2 align="center"> Leave Details</h2>
<title>Leave Details</title>
</head>

<body bgcolor="white">

<%@include file="MaHeader.jsp"%>

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
<td>requested days</td>

</tr>



<%
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/mysql?serverTimezone=UTC";
String username = "root";
String password = "band12.6"; 
Connection con = DriverManager.getConnection(url, username, password);
String department=(String)session.getAttribute("department");
Object ob=session.getAttribute("id"); // get attribute is a instance factory method
int id=(Integer)ob;
PreparedStatement ps=con.prepareStatement("select * from employeeleave where department=? ");
ps.setString(1, department);

String user=(String)session.getAttribute("user");
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

<td>
<%if(rs.getString("status").equals("Accepted by "+user)){ %>
Accepted
<%}else{ %>

<a href="accept.jsp?mid=<%=rs.getInt("lid") %>">Accept</a>
<%}

//new
if(rs.getString("status").equals("Rjected by "+user)){ %>
rejected
<%}else{ %>

<a href="reject.jsp?mid=<%=rs.getInt("lid") %>">Reject</a></td>
<%}

%>




<td><%=rs.getString("leavedays") %></td>
</tr>
<%
} 
%>
  
</table>


 

</body>
</html>