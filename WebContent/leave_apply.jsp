<%@page import="java.sql.*,java.util.*,java.text.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/mysql?serverTimezone=UTC";
String username = "root";
String password = "band12.6"; 
Connection con = DriverManager.getConnection(url, username, password);

String user=request.getParameter("user");
String email=request.getParameter("email");
int phone=Integer.parseInt(request.getParameter("phone"));
String department=request.getParameter("department");
String reason=request.getParameter("reason");
String startDate =request.getParameter("startDate");
String endDate =request.getParameter("endDate");



SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
long diff = (dt.parse(endDate)).getTime()-(dt.parse(startDate)).getTime();
int ld = (int) (diff/(24*60*60*1000));
int leavedays;
if (ld<0)
	leavedays=0;
else
	leavedays=ld;




Object ob=session.getAttribute("eid");
int i=(Integer)ob;
PreparedStatement ps=con.prepareStatement("insert into employeeleave values(lid,?,?,?,?,?,?,?,status,?,?)"); //added rd over here
ps.setString(1,user);
ps.setString(2,email);
ps.setInt(3,phone);
ps.setString(4,department);
ps.setString(5,reason);
ps.setString(6,startDate);
ps.setString(7,endDate);
ps.setInt(8,i);
ps.setInt(9,ld);



int x=ps.executeUpdate();
if(x!=0){
  System.out.println("leave applied");	
  response.sendRedirect("./EmHome.html?msg=Applied");
}



%>
