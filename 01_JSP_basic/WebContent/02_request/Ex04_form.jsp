<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="Ex04_result.jsp" method="post">
	이름: <input type="text" name="name" value="홍길동"><br>
	비번: <input type="password" name="pw" value="1234"><br>
	[과일선택]<br>
	<input type="checkbox" name="fruit" value="포도">포도<br>
	<input type="checkbox" name="fruit" value="복숭아">복숭아<br>
	<input type="checkbox" name="fruit" value="자두">자두<br>
	<input type="checkbox" name="fruit" value="수박">수박<br>
	
	<input type="submit" value="전송">
	</form>