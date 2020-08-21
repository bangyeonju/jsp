<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/script.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
    
<form action="registerProc.jsp" method="post" onsubmit="return writeSave()"> 
<table border="1" align ="center" width="300" height="400">
	<tr>
	<td align="center">
			회원가입
	</td>
	</tr>

	<tr>
	<td align="center"><input type="text" name="name" placeholder="이름"></td>
	</tr>
	
	<tr>
	<td align="center">
		<input type="text" name="id" placeholder="아이디" onkeyup="id_keyup()"><br>
			<span id="idmessage" style="display:none";></span>
	</td>
	
	</tr>
	<tr>
	<td align="center">
		<input type="password" name="password" placeholder="비밀번호" onkeyup="passwd_keyup()">
	</td>
	</tr>
	<tr>
	<td align="center">
		<input type="password" name="password2" placeholder="비밀번호확인" onkeyup="passwd_keyup()"><br>
		<span id="pwmessage" style="display:none";></span>
	</td>
	</tr>
	<tr>
	<td align="center"><input type="text" name="email" placeholder="이메일"></td>
	</tr>
	<tr>
	<td align="center"><input type="text" name="phone" placeholder="전화번호"></td>
	</tr>
	<tr>
	<td align="center">
		<input type="submit" value="가입완료">
	</td>
	</tr>
</table>

</form>