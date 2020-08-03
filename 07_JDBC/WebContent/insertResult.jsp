<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertResult.jsp <br><br>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	Timestamp register = new Timestamp(System.currentTimeMillis()); // 1970.1.1.0.0.1 ~ 2020.7.31.15.44.XX
	
	Connection conn = null;      
	PreparedStatement psmt = null;
	
	try{
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String userid = "jspid";
		String userpw = "jsppw";
		
		//1 
		Class.forName(driver);
		
		//2
		conn = DriverManager.getConnection(url,userid,userpw);
		
		//3.분석
		String sql = "insert into member values(?,?,?,?)";
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1,id);
		psmt.setString(2,passwd);
		psmt.setString(3,name);
		psmt.setTimestamp(4,register);
		
		
		// 4.실행
		int cnt = psmt.executeUpdate();// 
		if(cnt != 0)
			out.print("테이블에 삽입 성공");
		
	}catch(Exception e){
		
	}finally{
		if(psmt != null){
			try{
				psmt.close();
			}catch(SQLException e){
				
			}
		}
		
		if(conn != null){
			try{
				conn.close();
			}catch(SQLException e){
				
			}
		}
	}
	
	
%>



