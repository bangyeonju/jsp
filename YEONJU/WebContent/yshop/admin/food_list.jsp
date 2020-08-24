<%@page import="yj.food.FoodDao"%>
<%@page import="yj.food.FoodBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file = "top.jsp" %>

<%
FoodDao fdao = FoodDao.getInstance();
ArrayList<FoodBean> lists = fdao.foodList();
%>
<table border="1" align="center">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>가격</th>
		<th>이미지</th>
		<th>재고</th>
		<th>스펙</th>
		<th>포인트</th>
		<th>설명</th>
		<th>수정|삭제</th>
	</tr>

	<%
	if(lists.size()==0){
		%>
		<tr>
			<td colspan="9">
				상품이 없습니다
			</td>
		</tr>
		<%
	}
	 for(FoodBean fb : lists){
%>
			<tr>
				<td><%=fb.getPkind_fk() %></td>
				<td><%=fb.getPname() %></td>
				<td><%=fb.getPrice()%></td>
				<td><%=fb.getPimage() %></td>
				<td><%=fb.getPqty() %></td>
				<td><%=fb.getPspec() %></td>
				<td><%=fb.getPoint() %></td>
				<td><%=fb.getPcontent() %></td>
				<td>
				<a href="food_update.jsp?pnum=<%=fb.getPnum()%>">수정</a> |
				<a href="food_delete.jsp?pnum=<%=fb.getPnum()%>">삭제</a></td>
			</tr>
<% 
	 }
	%>
</table>