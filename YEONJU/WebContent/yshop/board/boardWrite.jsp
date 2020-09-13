<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="boardWriteProc.jsp" method="post">
	  <%@include file="../display/top.jsp"%>
<table align="center" border="1" cellspacing= "0" cellpadding="10">
	<tr>
	<td>글쓴이</td>
	<td><input type="text" name="writer"></td>
	</tr>
	<tr>
	<td>제목</td>
	<td><input type="text" name ="subject"></td>
	</tr>
	
	<tr>
	<td>내용</td>
	<td><textarea rows="20" cols="30" name="content"></textarea>
	</tr>
	<tr>
	<td>비밀번호</td>
	<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
	<td colspan="2" align ="center">
		<input type="submit" value= "보내기">
	</td>
	</tr>
</table>
</form>