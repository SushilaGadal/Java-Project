<!DOCTYPE html>
<html>
<head>
<h2 align="center"> Employee Profile Update </h2>
</head>
<body bgcolor="white">

<%@page import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/mysql?serverTimezone=UTC";
String username = "root";
String password = "band12.6"; 
Connection con = DriverManager.getConnection(url, username, password);
Object ob = session.getAttribute("eid");
int eid = (Integer)ob;
PreparedStatement ps=con.prepareStatement("select * from employee where eid=?");
ps.setInt(1,eid);
ResultSet rs = ps.executeQuery();
if(rs.next()){

%>
<form action="./employeeprofile_update.jsp" method="post">
<table align="center" width="200" height="100">
<tr><td></td><td><input type="hidden" name="eid" value="<%=rs.getInt("eid") %>"></td></tr>
<tr><td>Username</td><td><input type="text" name="user" value="<%=rs.getString("username")%>"></td></tr>
<tr><td>Email</td><td><input type="text" name="email" value="<%=rs.getString("email")%>"></td></tr>
<tr><td>Phone</td><td><input type="text" name="phone" value="<%=rs.getInt("phone")%>"></td></tr>
<tr><td><input type="submit" value="Update"></td></tr>

</table>
 
</form>
<%
}
%>


</body>
</html>