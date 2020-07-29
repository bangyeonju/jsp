<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex02_form.jsp<br><br>

<form action="Ex02_via.jsp">

	이름:<input type="text" name="name"><br>
	혈액형 선택:
	<select name="code">
		<option value="A">A형</option> 
		<option value="B">B형</option>
		<option value="O">O형</option>
		<option value="AB">AB형</option>
		
	</select>
	<input type="submit" value="이동">
</form>