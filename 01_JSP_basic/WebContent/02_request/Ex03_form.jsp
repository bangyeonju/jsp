<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="Ex03_result2.jsp" method="get">
이름:<input type="text" name="name"> <br>
나이:<input type="text" name="age"><br>
성별: 남자<input type="radio" name="gender" value="male"> 
	 여자<input type="radio" name="gender" value="female"><br>
취미 : <select name="hobby">
		<option value="mountain">등산</option>
		<option value="game">게임</option>
		<option value="sing">노래부르기</option>
	</select>
	<br>
색 선택 : <select name="color">
		<option value="red" >빨강</option>
		<option value="blue">파랑</option>
		<option value="green"selected>초록</option>
	</select>  
	<br>
<input type="submit" value="보내기">
</form>
</body>
</html>