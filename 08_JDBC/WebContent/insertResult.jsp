<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String uname = request.getParameter("uname");
	String dname = request.getParameter("dname");

	Connection conn = null;
	PreparedStatement ps = null;

	try {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String userid = "jspid";
		String userpw = "jsppw";

		Class.forName(driver);

		conn = DriverManager.getConnection(url, userid, userpw);

		String sql = "insert into register values(?,?,?,?,?,?)";
		ps = conn.prepareStatement(sql);

		ps.setString(1, id);//폼에서 넘어온값
		ps.setString(2, passwd);
		ps.setString(3, name);
		ps.setString(4, gender);
		ps.setString(5, uname);
		ps.setString(6, dname);

		int cnt = ps.executeUpdate();// 
		if (cnt != 0)
			out.print("member 테이블에 삽입 성공");

	} catch (Exception e) {

	} finally {
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
<!-- insert하고 select로 넘어간다.  -->
<%-- 
<meta http-equiv="refresh" content="2; url=select.jsp">
<jsp:forward page="select.jsp"></jsp:forward>
 --%>

 <% response.sendRedirect("select.jsp"); %>
 공통점:
 차이점: url의 차이가 있다. 
 forward :http://localhost:8080/08_JDBC/insertResult.jsp (증간에 거쳐가는 페이지)
 response.sendRedirect:http://localhost:8080/08_JDBC/select.jsp
  request 공유 forward / 공유x sendredirect
 
 insert 성공1


