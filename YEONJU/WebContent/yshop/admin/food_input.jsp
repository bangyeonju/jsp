<%@page import="yj.kind.KindBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="yj.kind.KindDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file = "top.jsp" %>
<form action="food_inputProc.jsp" method="post" enctype="multipart/form-data">
<% request.setCharacterEncoding("UTF-8"); %>
<table border="1" align="center">

	<tr>
		<th>종류</th>
		<td><select name="pkind_fk">
			<%
			 KindDao kdao = KindDao.getInstance();
			 ArrayList<KindBean> list = kdao.selectKind();
			 if(list.size()==0){
				 %>
				 <option value="">종류가 없습니다.</option>
				 <%
			 } else{
				 for(KindBean kb : list){
					 %>
					 <option value="<%=kb.getFcode()%>"><%=kb.getFcode()%></option>
					 <%
				 }
			 }
			%>
		</select>
		</td>
	</tr>
	<tr>
		<th>코드</th>
		<td><input type="text" name="pcode" size="10"></td>
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
		<th>수량</th>
		<td><input type="text" name="pqty" size="10"></td>
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
		<th>포인트</th>
		<td><input type="text" name="point" size="10"></td>
	</tr>
	
	<tr>
		<th>설명</th>
		<td><textarea name="pcontent" cols="50" style="resize: none"; rows="10"></textarea>
		</td>
	</tr>
	<tr>
	<td colspan="2"><input type="submit" value="저장"></td>
	</tr>
</table>
</form>