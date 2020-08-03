<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
updateVia.jsp<br><br>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter( "id");
	String passwd = request.getParameter( "passwd" );
	System.out.println(id+","+passwd);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Class.forName( "oracle.jdbc.driver.OracleDriver" );
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String dbId = "jspid";
		String dbPasswd = "jsppw";
		conn = DriverManager.getConnection( url, dbId, dbPasswd );
		
		String sql = "select * from register where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			//String dbpw = rs.getString("passwd"); 디비에 있는 pw값을 가져오는 작업
			//updateForm에 입략학 비밀번호값과 디비에 있는 비밀번호값인 같은지 확인하는 작업
			if(passwd.equals(rs.getString("passwd"))){
				// 아이디와 비번 모두 일치
				session.setAttribute("sid", id); //넘어온 아이디가 sid로 
	%>
			<form method="post" action="updateResult.jsp"> <%-- ?id=<%=rs.getString("id") %> --%>
			<%-- <input type="hidden" name="id" value="<%=id %>"> --%><!-- 히든으로  화면에서느 보이지않게하고 id값을 보낸다. --> 
				<table border=1>
					<tr>
						<th colspan=2>
							수정할 정보를 입력해 주세요.
						</th>
					</tr>				
				
					<tr>
						<th>아이디</th>
						<td> <%=id %></td>
					</tr>
					
					<tr>
						<th>비밀번호</th>
						<td> <input type="text" name="passwd"> </td>
					</tr>
					
					<tr>
						<th>이름</th>
						<!-- db에 있는 이름을 가져오는 작업  수정할수없다 input 타입이 아ㄴ니다.  -->
						<td> <%=rs.getString("name") %> </td>
					</tr>
					
					<tr>
						<th>성별</th>
						<td> 
							<input type="radio" name="gender" value="남" checked>남
    	   					<input type="radio" name="gender" value="여">여
						 </td>
					</tr>
					
					<tr>
						<th>이메일</th>
						<td> 
							<input type="text" name="uname" value="<%=rs.getString("uname") %>">@
				  			<select name="dname">
					  			<option value="daum.net">daum.net</option>
					  			<option value="naver.com">naver.com</option>
					  			<option value="nate.com">nate.com</option>
					  			<option value="google.com">google.com</option>
					  			<option value="yahoo.com">yahoo.com</option> 		
				  			</select>
						</td>
					</tr>
					
					<tr>
						<th colspan="2">
							<input type="submit" value="수정">
							<input type="reset" value="취소">
						</th>
					</tr>
				</table>
			</form>	
				
				
	<%			
				
			} else{
				%>
					비밀번호가 다릅니다. <br>
					다시 확인해주세요 <br>
					<meta http-equiv="refresh" content="2; url=updateForm.jsp"> 
				<%
			}
			
		} else{
			%>
				<%=id %>는 없는 아이디입니다.<br>
				다시 확인해주세요 <br>
				<meta http-equiv="refresh" content="2; url=updateForm.jsp"> 
			<%			
		}
	}catch(SQLException e){
		
	}finally{
		
	}
%>


