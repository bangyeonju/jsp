<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_cartAdd.jsp -->
<!-- scope="session" 객체를 하나만들어서 계속 사용할수있게하겠다-->
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>

<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	int oqty = Integer.parseInt(request.getParameter("oqty"));
	System.out.println("pnum="+pnum);
	//ProductDao pdao = ProductDao.getInstance();
	//ArrayList<ProductBean> list =pdao.productSelect(pnum);
	
	mallCart.addProduct(pnum,oqty);
	response.sendRedirect("mall_cartList.jsp");
%>

