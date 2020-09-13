<%@page import="yj.food.FoodBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="yj.food.FoodDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	int oqty = Integer.parseInt(request.getParameter("oqty"));

%>
<jsp:useBean id="mallCart" class="yj.mall.CartBean" scope="session"/>
<%
	FoodDao fdao = FoodDao.getInstance();
	ArrayList<FoodBean> list = fdao.getOneSelectByPnum(pnum);
	mallCart.addFood(pnum,oqty);
	response.sendRedirect("mall_cartList.jsp");
%>