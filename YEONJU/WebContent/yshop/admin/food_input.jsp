<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table border="1">

	<tr>
		<th>번호</th>
		<td><input type="text" name="pnum" size="10"></td>
	</tr>

	<tr>
		<th>이름</th>
		<td><input type="text" name="pname" size="10"></td>
	</tr>

	<tr>
		<th>가격</th>
		<td><input type="text" name="price" size="10"></td>
	</tr>


	<tr>
		<th>이미지</th>
		<td><input type="file" name="pimage"></td>
	</tr>



	<tr>
		<th>상품스펙</th>
		<td><select name="pspec">
				<option value="NORMAL">::NORMAL::</option>
				<option value="HIT">HIT</option>
				<option value="NEW">NEW</option>
				<option value="BEST">BEST</option>
		</select></td>

	</tr>
	<tr>
		<th>설명</th>
		<td><input type="text" name="pcontent" cols="50" rows="10">
		</td>
	</tr>
</table>