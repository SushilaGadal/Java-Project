  package com.job;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DoctorRegister
 */

public class ManagerRegister extends HttpServlet {
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
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String department=request.getParameter("department"); 
		long mobile=Long.parseLong(phone);  
		
		try {
			ps=con.prepareStatement("insert into manager values(mid,?,?,?,?,?)");
			ps.setString(1,user);
			ps.setString(2,pass);
			ps.setString(3,email);
			ps.setLong(4,mobile);
			ps.setString(5,department);
			int x=ps.executeUpdate();
			PrintWriter pw=response.getWriter();
			if(x!=0){
              response.sendRedirect("./MaLogin.html");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}

} 


//copied



