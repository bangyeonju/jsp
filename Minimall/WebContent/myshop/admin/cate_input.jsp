<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
cate_input.jsp<br>
<%@include file="top.jsp" %>
<td colspan="6" align="center">
<form action="cate_input_proc.jsp" method="post" name="myform">
	<table border="1" align="center" width="350">
		<tr>
			<td bgcolor="yellow" align="center">
				<b>카테고리 코드</b>
			</td>
			<td bgcolor="yellow" align="center">
				<input type="text" name="code">
			</td>
		</tr>
		<tr>
			<td bgcolor="yellow" align="center">
				<b>카테고리 이름</b>
			</td>
			<td bgcolor="yellow" align="center">
				<input type="text" name="cname">
			</td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="yellow" align="center">
				<input type="submit" value="등록">
				<input type="reset" value="취소">
			</td>
		
		</tr>
	</table>
</form>
<%@include file="bottom.jsp" %>