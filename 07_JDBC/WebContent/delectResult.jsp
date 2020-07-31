<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	Connection conn = null;
	PreparedStatement ps = null;
	try {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id2 = "jspid";
		String pw = "jsppw";

		Class.forName(driver);

		conn = DriverManager.getConnection(url, id2, pw);

		//분석
		String sql = "delete member where id=?";
		ps = conn.prepareStatement(sql);
	
		ps.setString(1, id);

		int cnt = ps.executeUpdate();// 
		if(cnt != 0)
			out.print("member 테이블에 삭제 성공");
	} catch (Exception e) {

	} finally {
		if(ps != null){
			try{
				ps.close();
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