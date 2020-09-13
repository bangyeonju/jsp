<%@page import="yj.food.FoodBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="yj.food.FoodDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mallCart" class="yj.mall.CartBean" scope="session" />

<% 
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	int oqty = Integer.parseInt(request.getParameter("oqty"));
	
	FoodDao fdao = FoodDao.getInstance();
	ArrayList<FoodBean> lists = fdao.getOneSelectByPnum(pnum);
	
	if(lists.get(0).getPqty() < oqty){
		%>
		<script type="text/javascript">
		alert("수량 초과");
		//history.go(-1);
		location.href="mall_cartList.jsp";
		</script>
<%
	} else {

	mallCart.setEdit(pnum,oqty);
	System.out.print("1");
	%>
	<script type="text/javascript">
			location.href="mall_cartList.jsp";
	</script>
	<%}%>