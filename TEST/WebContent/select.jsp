<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table border=1>
	<tr>
		<th>id</th>
		<th>passwd</th>
		<th>name</th>
		<th>gender</th>
		<th>email</th>
	</tr>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String driver="oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String userid="jspid";
	String userpw="jsppw";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs= null;
	
	try{
	Class.forName(driver);
	conn=DriverManager.getConnection(url, userid, userpw);
	
	String sql= "select * from register";
	
	ps=conn.prepareStatement(sql);
	
	rs=ps.executeQuery();
	
	while(rs.next()){
		
	String id= rs.getString("id");
	String passwd= rs.getString("passwd");
	String name= rs.getString("name");
	String gender= rs.getString("gender");
	String uname=rs.getString("uname");
	String dname=rs.getString("dname");
	%>
	<tr>
		<td><%=id %></td>
		<td><%=passwd %></td>
		<td><%=name %></td>
		<td><%=gender %></td>
		<td><%=uname %>@<%=dname %></td>
	</tr>
	<%
	}
	
	}catch(Exception e){
		
	}
	

		%>
</table>
<%	
		

%>