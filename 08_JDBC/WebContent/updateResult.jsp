
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id= request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String gender = request.getParameter("gender");
	String uname= request.getParameter("uname");
	String dname= request.getParameter("dname");
	
	
	String sid = (String)session.getAttribute("sid");
	System.out.println("sid:"+sid);
	Connection conn= null;
	PreparedStatement ps= null;
	
	try{
	
		String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:orcl";
		String userid="jspid";
		String userpw="jsppw"; 
		
		conn=DriverManager.getConnection(url,userid,userpw);
		Class.forName(driver);
		
		String sql="update register set passwd=?, gender=?, uname=?, dname=? where id=? " ;
		ps=conn.prepareStatement(sql);
		ps.setString(1, passwd);
		ps.setString(2, gender);
		ps.setString(3,uname);
		ps.setString(4,dname);
		ps.setString(5,sid);
		
		System.out.print("2");
		ps.executeUpdate();
	
		response.sendRedirect("select.jsp");
	
		
	} catch(Exception e){
		
	}
	finally {
		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {

			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {

			}
		}

	}

%>