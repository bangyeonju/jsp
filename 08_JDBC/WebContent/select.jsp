<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Driver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<table border=1>
	<tr>
		<th width="100">아이디</th>
		<th width="100">비밀번호</th>
		<th width="100">이름</th>
		<th width="100">성별</th>
		<th width="100">이메일</th>
	</tr>


<%
	
	request.setCharacterEncoding("UTF-8");
		Connection conn= null;
		PreparedStatement ps= null;
		ResultSet rs =null;
	try{
	
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String userid = "jspid";
		String userpw = "jsppw";
		Class.forName(driver);
		
		conn = DriverManager.getConnection(url,userid,userpw);
		
		String sql="select * from register";
		ps= conn.prepareStatement(sql);
		
		rs=ps.executeQuery();
		while(rs.next()){
			String id=rs.getString("id");
			String passwd= rs.getString("passwd");
			String name= rs.getString("name");
			String gender=rs.getString("gender");
			String uname= rs.getString("uname");
			String dname= rs.getString("dname");
					
			
		%>
<tr align="center">
	<td><%=id %></td>
	<td><%=passwd %></td>
	<td><%=name %></td>
	<td><%=gender %></td>
	<td><%=uname %>@<%=dname %></td>
</tr>

<%
		
		}//while
				
		
		
		
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
</table>