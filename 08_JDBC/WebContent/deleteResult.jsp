<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String id= request.getParameter("id");
String passwd= request.getParameter("passwd");
String name= request.getParameter("name");
String gender= request.getParameter("gender");
String uname= request.getParameter("uname");
String dname= request.getParameter("dname");

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String userid = "jspid";
String userpw = "jsppw";

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;

try{
Class.forName(driver);
conn=DriverManager.getConnection(url,userid,userpw);

String sql="select id,passwd from register where id=?";
//분석
ps = conn.prepareStatement(sql);
ps.setString(1, id);
//실행
rs= ps.executeQuery();
if(rs.next()){
	String dbpw=rs.getString("passwd");
	
	if(dbpw.equals(passwd)){
		sql = "delete from register where id=? ";
		ps= conn.prepareStatement(sql);
		ps.setString(1,id);
		
		
		ps.executeUpdate();
		%>
		<%=id%>레코드삭제성공
		<% 
		response.sendRedirect("select.jsp");
	}
	else{
		out.print("비밀번호가 틀림");
		%>
		<meta http-equiv="refresh" content="2; url=deleteForm.jsp">
		<%
	}
	
}else{
	out.print("아이디가 없습니다.");
	%>
	<meta http-equiv="refresh" content="2; url=deleteForm.jsp">
	<%
}

}catch(Exception e){
	
} finally {
	if (rs != null) {
		try{
		rs.close();
		} catch(SQLException e){
			
		}
	}
	if (conn != null) {
		try{
		rs.close();
		} catch(SQLException e){
			
		}
	}
	if (ps != null) {
		try{
		rs.close();
		} catch(SQLException e){
			
		}
	}
}
%>