<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_cartDel.jsp -->
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>
<%
int pnum = Integer.parseInt(request.getParameter("pnum"));
mallCart.removeProduct(pnum);
%>
<script type="text/javascript">
	location.href="mall_cartList.jsp";
</script>