<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
main.jsp
<!-- 외부에있는 css파일을 가져다 쓰겠다. -->
<link rel="stylesheet" type="text/css" href="style.css">

</style>
<form action="loginPro.jsp" method="post">
<table border="1">
<tr>
<td width="50" height="50" align="center" bgcolor="yellow">아이디</td>
<td><input type="text" name="id"></td>
</tr>
<tr>
<td width="50" height="50" align="center" bgcolor="yellow">비번</td>
<td><input type="password" name="passwd" value="1234"></td>
</tr>
<tr>
<td colspan="2" bgcolor="#FFCC00">
<input type="submit"  value="로그인">
<input type="button" value="회원가입" onclick="location.href='<%=request.getContextPath()%>/myshop/member/register.jsp'">
<input type="button"  value="아이디찾기" onclick="location.href='<%=request.getContextPath()%>/findid.jsp'">
<input type="button"  value="비번찾기"onclick="location.href='<%=request.getContextPath()%>/findpwd.jsp'">
</td>
</tr>

</table>
</form>
