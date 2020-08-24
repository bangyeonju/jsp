<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_cartAdd.jsp -->

<%
	int pnum=Integer.parseInt(request.getParameter("pnum"));
	int oqty=Integer.parseInt(request.getParameter("oqty"));
	
%>
<!-- my.shop.mall.CartBean mallCart = new my.shop.mall.CartBean() -->
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>
<%

	ProductDao pdao = ProductDao.getInstance();
	ArrayList<ProductBean> list = pdao.getOneSelectByPnum(pnum);
	
	mallCart.addProduct(pnum,oqty);
	
	response.sendRedirect("mall_cartList.jsp");
%>









