<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<form action="kind_inputProc.jsp" method="post">
<%@include file = "top.jsp" %>
<table border="1" align="center">
<tr>
	<th>
		음식코드
	</th>
	<td>
		<input type="text" name="fcode" >
		
	</td>
</tr>
<tr>
	<th>
		음식이름
	</th>
	<td>
		<input type="text" name="fname" >
	</td>
</tr>
<tr>
	<td colspan="2">
	<input type="submit" value="저장">
	<input type="reset" value="지우기">
	</td>
</tr>
</table>
</form>