<%@page import="yj.food.FoodBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="yj.food.FoodDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	FoodDao fdao = FoodDao.getInstance();
	ArrayList<FoodBean> lists = fdao.getOneSelectByPnum(pnum);
	
%>
<form action="food_list.jsp" >
		<table class=outline width="600" border="1" align="center">
			<tr>
				<th width="15%" >종륜</th>
				<td width="35%"><b><%=lists.get(0).getPkind_fk() %></b></td>
				
				<th width="15%" >번호</th>
				<td width="35%"><b><%=lists.get(0).getPnum() %></b></td>
			</tr>
		
			<tr>
				<th width="15%">이름</th>
				<td width="35%"><b><%=lists.get(0).getPname() %></b></td>
				
			</tr>
			
			<tr>
				<th width="15%" >상품이미지</th>
				<td colspan="3" align="center">
				<%
					String imgPath = request.getContextPath() + "/yshop/images/" + lists.get(0).getPimage();
				%>
				
					<img src="<%=imgPath %>" width="100" height="100">
				
				</td>
			</tr>
			
			<tr>
				<th width="15%" >상품수량</th>
				<td width="35%"><b><%=lists.get(0).getPqty() %></b></td>
				
				<th width="15%" >상품가격</th>
				<td width="35%"><b><%=lists.get(0).getPrice() %></b></td>
			</tr>
			
			<tr>
				<th width="15%" >상품스펙</th>
				<td width="35%"><b><%=lists.get(0).getPspec() %></b></td>
				
				<th width="15%" >상품포인트</th>
				<td width="35%"><b><%=lists.get(0).getPoint() %></b></td>
			</tr>
			
			<tr>
				<th width="15%" >상품소개</th>
				<td colspan="3">
					<textarea rows="5" cols="50" style="resize:none"><%=lists.get(0).getPcontent()%></textarea>
				
				</td>
			</tr>
			
			<tr>
				<td colspan="4" align="center" class="m1">
					<input type="submit" value="돌아가기">
				</td>
			</tr>
		</table>
	
	</form>