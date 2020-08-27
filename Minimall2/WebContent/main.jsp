	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css">    
main.jsp<br><br>
<%
	session.invalidate() ;
%>
[로그인 화면]
	<br>  
	<br>
	<form action="loginPro.jsp" method="post">
		<table border=1 height=120>
			<tr>
				<td bgcolor="yellow" align="center">아이디</td>
				<td><input type="text" name="id" value="admin"></td>
			</tr>
			<tr>
				<td bgcolor="yellow" align="center">비번</td>
				<td><input type="password" name="password" value="1234"></td>
			</tr>
			<tr>
				<td colspan=2 bgcolor="#FFCC00">
					
					<input type="submit" value="로그인"> 
					
					<input type="button" value="회원 가입"
					onclick="location.href='<%=request.getContextPath()%>/myshop/member/register.jsp'">
					
					<input type="button" value="아이디 찾기"
					onclick="location.href='<%=request.getContextPath()%>/findid.jsp'">
					
					<input type="button" value="비번 찾기"
					onclick="location.href='<%=request.getContextPath()%>/findpwd.jsp'">
				</td>
			</tr>
		</table>
	</form>
	
	
	