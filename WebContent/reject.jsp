<%@page import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/mysql?serverTimezone=UTC";
String username = "root";
String password = "band12.6"; 
Connection con = DriverManager.getConnection(url, username, password);
String id=request.getParameter("mid");
int lid=Integer.parseInt(id);
String user= (String)session.getAttribute("user");

PreparedStatement ps=con.prepareStatement("update employeeleave set status='Rejected by "+user+ "'where lid =? ");

ps.setInt(1,lid);
int x=ps.executeUpdate();
if(x!=0)
	response.sendRedirect("./leave_details.jsp?msg=Rejected");

%>