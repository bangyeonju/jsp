<%@page import="yj.food.FoodDao"%>
<%@page import="yj.food.FoodBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int pnum = Integer.parseInt(request.getParameter("pnum"));
FoodDao fdao = FoodDao.getInstance();

ArrayList<FoodBean> lists = fdao.getOneSelectByPnum(pnum);
String imgPath = request.getContextPath() + "/yshop/images/"+lists.get(0).getPimage();
%>
<table border="1">
<tr>
<td>
	<img src ="<%=imgPath%>" width="200" height="180"><br>
	<%=lists.get(0).getPname() %><br>
	<%=lists.get(0).getPrice() %><br>
	<%=lists.get(0).getPoint() %><br>
	<%=lists.get(0).getPcontent() %>
</td>
</tr>
</table>