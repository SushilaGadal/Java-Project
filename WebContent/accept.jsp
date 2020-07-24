

<%@page import="java.sql.*,java.text.*,java.util.*"%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/mysql?serverTimezone=UTC";
String username = "root";
String password = "band12.6"; 
Connection con = DriverManager.getConnection(url, username, password);


/*
String id=request.getParameter("mid");
int i=Integer.parseInt(id);
String user= (String)session.getAttribute("user");



PreparedStatement ps=con.prepareStatement("update employeeleave set status='Accepted by "+user+ "'where lid =? ");
ps.setInt(1,i);
int x=ps.executeUpdate();
if(x!=0)
	response.sendRedirect("./leave_details.jsp?msg=Accepted");

*/

String id = request.getParameter("mid");
int lid = Integer.parseInt(id);
String user= (String)session.getAttribute("user");

PreparedStatement ps = con.prepareStatement("select a.lid,a.eid,a.username,a.email,b.position,a.leavedays,b.days from employeeleave a inner join employee b on a.eid=b.eid where lid=?;");
ps.setInt(1,lid);
ResultSet rs = ps.executeQuery();

if(rs.next())
{
	int a = rs.getInt("days");
	int b = rs.getInt("leavedays");
	int c = rs.getInt("eid");
	int d = rs.getInt("lid");
	if(b<a)
	{
		PreparedStatement ps1 = con.prepareStatement("update employee set days=(?-?) where eid=?");
		ps1.setInt(1,a);
		ps1.setInt(2,b);
		ps1.setInt(3,c);
		int x = ps1.executeUpdate();
		
		PreparedStatement ps2 = con.prepareStatement("update employeeleave set status='Accepted by "+user+ "'where lid =?");
		ps2.setInt(1,d);
		int y = ps2.executeUpdate();
		
		if (x!=0 && y!=0)
			response.sendRedirect("./leave_details.jsp?msg=Accepted");
		
	
		
	}
/*	else
{
		PreparedStatement ps2 = con.prepareStatement("update employeeleave set action = 'Denied!! Exceeded your Total Leave Days' where lid=?");
		ps2.setInt(1,lid);
		
		int y = ps2.executeUpdate();
		if (y!=0)
			response.sendRedirect("./Leave_Applications.jsp?msg=Denied! Exceeded your total leave days");

			
}
	*/
	

}



%>
