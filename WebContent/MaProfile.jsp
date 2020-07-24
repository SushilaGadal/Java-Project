 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<h2 align="center"> Manager Profile</h2>
<title>Manager Home</title>
</head>

<body bgcolor="white">

<%@include file="MaHeader.jsp"%>

<%@page import="java.sql.*" %>
<table align="center" width ="600" height="150" border="2">
<tr><td>Manager Id</td>
<td>Username</td>
<td>Email</td>
<td>Phone</td>
<td>Department</td>
<td>Action</td> 
</tr>



<%
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/mysql?serverTimezone=UTC";
String username = "root";
String password = "band12.6"; 
Connection con = DriverManager.getConnection(url, username, password);
Object ob=session.getAttribute("mid"); // get attribute is a instance factory method
int mid=(Integer)ob;
PreparedStatement ps=con.prepareStatement("select * from manager where mid=?");
ps.setInt(1,mid);
ResultSet rs=ps.executeQuery();
while(rs.next()){
%>
<tr>
<td><%=rs.getInt("mid") %></td> 
<td><%=rs.getString("username") %></td>
<td><%=rs.getString("email") %></td>
<td><%=rs.getLong("phone") %></td>
<td><%=rs.getString("department") %></td>

<td><a href="updateprofile_manager.jsp?<%=rs.getInt("mid")%>">Update</a> </td> 
</tr>
<%
} 
%>
  
</table>



</body>
</html>