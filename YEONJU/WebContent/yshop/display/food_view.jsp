<%@page import="yj.food.FoodDao"%>
<%@page import="yj.food.FoodBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@include file="top.jsp"%>
<style type="text/css">
table{
}
</style>
<%
int pnum = Integer.parseInt(request.getParameter("pnum"));
FoodDao fdao = FoodDao.getInstance();

ArrayList<FoodBean> lists = fdao.getOneSelectByPnum(pnum);
String imgPath = request.getContextPath() + "/yshop/images/"+lists.get(0).getPimage();
%>
<table border="1" align="center" >
<tr>
<td >
	<img src ="<%=imgPath%>" width="200" height="180">
</td>
<td>
	이름:<%=lists.get(0).getPname() %><br>
	가격:<%=lists.get(0).getPrice() %><br>
	재고수량:<%=lists.get(0).getPqty() %><br>
	포인트:<%=lists.get(0).getPoint() %><br>
	설명:<%=lists.get(0).getPcontent() %>
</td>
</tr>
</table>

