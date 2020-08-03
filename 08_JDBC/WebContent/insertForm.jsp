<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
insertForm.jsp

<form action="insertResult.jsp" method="post">
	<br> 아이디:<input type="text" name="id"><br>
	<br> 패스워드:<input type="password" name="passwd"><br>
	<br> 이름:<input type="text" name="name"><br>
	<br> 성별:<input type="radio" name="gender" value="남">남 <input
		type="radio" name="gender" value="여">여<br>
	<br> email:<input type="text" name="uname">@ <select
		name="dname">
		<option value="daum.net">daum.net</option>
		<option value="naver.com">naver.com</option>
		<option value="nate.com">nate.com</option>
		<option value="google.com">google.com</option>
		<option value="yahoo.com">yahoo.com</option>
	</select><br>
	<br> <input type="submit" value="보내기">

</form>