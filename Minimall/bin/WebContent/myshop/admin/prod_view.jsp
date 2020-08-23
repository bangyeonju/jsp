<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/style.css">
prod_view.jsp<br>
<%
int pnum = Integer.parseInt(request.getParameter("pnum"));
ProductDao pdao = ProductDao.getInstance();
ArrayList<ProductBean> lists =  pdao.productSelect(pnum);

%>
<%@include file="top.jsp" %>
<td colspan="6">
<form action="prod_list.jsp">
<table width="600" class="outline">
	<caption>상품상세보기</caption>
	<tr>
		<th  width="15%"class="m2">카테고리</th>
		
		<td width="35%"> <b><%=lists.get(0).getPcategory_fk()%></b></td>
		<th width="15%"class="m2">상품번호</td>
		<td width="35%"><b><%=lists.get(0).getPnum()%></b></th>
	</tr>
	<tr>
		<th width="15%"class="m2">상품명</td>
		<td width="35%"><b><%=lists.get(0).getPname()%></b></td>
		<th width="15%"class="m2">제조회사</th>
		<td width="35%"><b><%=lists.get(0).getPcompany()%></b></td>
	</tr>
	<tr>
		<th width="15%" class="m2"align="center">상품이미지</th>
			<%
			String imagePath =request.getContextPath()+"/myshop/images/"+lists.get(0).getPimage();//minimall
			%>
		<td colspan="3" align="center" width="35%">
			<img src="<%=imagePath%>" width=100 height=100>
		</td>
		
	</tr>
	<tr>
		<th width="15%" class="m2">상품수량</th>
		<td width="35%"><%=lists.get(0).getPqty()%></td>
		<th class="m2">상품가격</th>
		<td width="35%"><%=lists.get(0).getPrice()%></td>
	</tr>
	<tr>
		<th width="15%" class="m2">상품스펙</th>
		<td width="35%"><%=lists.get(0).getPspec() %></td>
		<th width="15%" class="m2">상품포인트</th>
		<td width="35%"><%=lists.get(0).getPoint() %></td>
	</tr>
		<tr>
		<td width="15%" class="m2">상품소개</td>
		<td width="35%"colspan="3">
		<textarea rows="5" cols="50" style="resize: none">
			<%=lists.get(0).getPcontents()%>
		</textarea></td>
		
	</tr>
		<tr>
		<td  colspan="4" align="center" class="m1">
		<input type="submit" value="돌아가기">
		</td>
		
	</tr>
</table>
</form>
<%@include file="bottom.jsp" %>
