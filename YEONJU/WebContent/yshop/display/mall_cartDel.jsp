<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mallCart" class="yj.mall.CartBean" scope="session"/>
<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	mallCart.deleteFood(pnum);
	response.sendRedirect("mall_cartList.jsp");
%>
