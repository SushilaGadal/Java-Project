package com.job;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DoctorLogin
 */

public class ManagerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con=null; //so that every method can access it
	PreparedStatement ps=null;
	
	public void init(ServletConfig config){
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		
	  }	catch(ClassNotFoundException e){
		
		e.printStackTrace();
	  }
	String url = "jdbc:mysql://localhost:3306/mysql?serverTimezone=UTC";
	String username = "root";
	String password = "band12.6"; 
	try{
		con = DriverManager.getConnection(url, username, password);
	}
	catch(SQLException e){
		e.printStackTrace();
	}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user=request.getParameter("user");
		String pass=request.getParameter("pass");
		
		try {
			ps=con.prepareStatement("select * from manager where username=? and password=?");
			ps.setString(1,user);
			ps.setString(2, pass);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				//Session is use transfer value from one page to another page
				
				HttpSession hs=request.getSession();
				hs.setAttribute("mid", rs.getInt("mid"));
				hs.setAttribute("user", rs.getString("username"));
			    hs.setAttribute("department", rs.getString("department"));

				System.out.println("Found");
				response.sendRedirect("./MaHome.html?msg=Sucess");
			}
			else{
				response.sendRedirect("./MaLogin.html?msg=Failed");
				System.out.println("Not Found");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
	}

}

