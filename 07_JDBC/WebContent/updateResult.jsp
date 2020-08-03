<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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
	ResultSet rs = null;
	
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id2 = "jspid";
		String pw = "jsppw";
	try {

		Class.forName(driver);

		conn = DriverManager.getConnection(url, id2, pw);

		String sql = "select id,passwd from member where id=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1,id);
		rs=ps.executeQuery();
		
		if(rs.next()){
			String dbid= rs.getString("id");
			String dbpw=rs.getString("passwd");
			if(id.equals(dbid)&&passwd.equals(dbpw)){
				
			 sql = "update member set name=? where id=? and passwd=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, id);
			ps.setString(3,passwd);
			ps.executeUpdate();
			
			out.print("레코드를 수정했습니다.");
			} else{
				out.print("패스워드가 다릅니다.");
		}
			}else{
				out.print("아이디가없습니다.");
			}
		//분석

		
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
		if(rs != null){
			try{
				rs.close();
			}catch(SQLException e){
				
			}
		}
	}
%>