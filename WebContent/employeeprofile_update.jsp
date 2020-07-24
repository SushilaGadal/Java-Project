
<%@page import="java.sql.*" %>
<% 
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/mysql?serverTimezone=UTC";
String username = "root";
String password = "band12.6"; 
Connection con = DriverManager.getConnection(url, username, password);
String user=request.getParameter("user");
String email=request.getParameter("email");
String phone=request.getParameter("phone");

long mobile=Long.parseLong(phone); 
Object ob = session.getAttribute("eid");
int eid = (Integer)ob; 
PreparedStatement ps=con.prepareStatement("update employee set username=?, email=?, phone=? where eid=?") ;

ps.setString(1,user);
ps.setString(2,email);
ps.setLong(3,mobile);
ps.setInt(4,eid);

int k=ps.executeUpdate();
if(k!=0)
	response.sendRedirect("./EmProfile.jsp");


%>  
