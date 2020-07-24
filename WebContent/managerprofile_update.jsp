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
String department=request.getParameter("department"); 
long mobile=Long.parseLong(phone); 
Object ob = session.getAttribute("mid");
int mid = (Integer)ob; 
PreparedStatement ps=con.prepareStatement("update manager set username=?, email=?, phone=?, department=? where mid=?") ;

ps.setString(1,user);
ps.setString(2,email);
ps.setLong(3,mobile);
ps.setString(4,department);
ps.setInt(5,mid);

int k=ps.executeUpdate();
if(k!=0)
	response.sendRedirect("./MaProfile.jsp");


%>  



