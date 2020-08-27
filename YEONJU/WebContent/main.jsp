<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	session.invalidate() ;
%>
<form action="loginPro.jsp" method="post">
<table border="1" align ="center" width="350" height="200">
	<tr>
		<td>아이디<input type="text" name="id"></td>
	</tr>
	<tr>
		<td>비밀번호<input type="password" name="password"></td>
	</tr>
	<tr>
		<td>
		<input type="submit" value="로그인">
		<input type="button" onClick="location.href='<%=request.getContextPath()%>/yshop/member/register.jsp'" value="회원가입">
		<input type="button" onClick="location.href='<%=request.getContextPath()%>/idSearch.jsp'"value="아이디 찾기">
		<input type="button" onClick="location.href='<%=request.getContextPath()%>/pwSearch.jsp'" value="비밀번호 찾기">
		</td>
	</tr>
</table>
</form>