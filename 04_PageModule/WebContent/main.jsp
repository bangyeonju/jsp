<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<form action="control.jsp">
<table border=1>
	<tr>
		<td colspan="2">제품을 선택해주세여</td>
	</tr>
	<tr>
		<td>제품</td>
		<td >
			<input type="radio" name="product" value="1"/>텔레비젼<br>
			<input type="radio" name="product" value="2"/>디지털카메라<br>
			<input type="radio" name="product" value="3"/>MP3플레이어<br>
			
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="확인"/>
		<input type="reset" value="취소"/>
		
		</td>
	</tr>
</table>
</form>