
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
select.jsp
<br>
<br>

<h2>member 테이블의 레코드 출력</h2>
<table width="600" border="1">
	<tr>
		<th width="100">아이디</th>
		<th width="100">패스워드</th>
		<th width="200">이름</th>
		<th width="200">가입일자</th>
	</tr>
	<%
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
			try {
				String driver = "oracle.jdbc.driver.OracleDriver";
				String url = "jdbc:oracle:thin:@localhost:1521:orcl";
				String id = "jspid";
				String pw = "jsppw";
				
				//1단계
				Class.forName(driver);
				//2단계
				conn = DriverManager.getConnection(url, id, pw);
	
				String sql = "select * from member";
				ps = conn.prepareStatement(sql);
	
				rs = ps.executeQuery();
				while (rs.next()) {
					String id2 = rs.getString("id");
					String passwd = rs.getString("passwd");
					String name = rs.getString("name");
					String reg_date = String.valueOf(rs.getDate("reg_date"));
					
					%>
					<tr>
					<td><%=id2 %></td>
					<td><%=passwd %></td>
					<td><%=name %></td>
					<td><%=reg_date %></td>
					</tr>					
					
	<% 
				}//while
			} catch (Exception e) {
				e.printStackTrace();
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
</table>
