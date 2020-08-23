<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.mall.CartBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_cartEdit.jsp -->
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>
<%
int pnum = Integer.parseInt(request.getParameter("pnum"));
int oqty = Integer.parseInt(request.getParameter("oqty"));
ProductDao pdao = ProductDao.getInstance();

ArrayList<ProductBean> lists=pdao.productSelect(pnum);



if(lists.get(0).getPqty() < oqty){	//lists.get(0).getPqty() : 관리자가 처음 설정한 수량
	%>
	<script type="text/javascript">
		alert("주문수량이 초과되었습니다.");
		//history.go(-1); 주문수량이 남아있는다.
		location.href="mall_cartList.jsp"; //주문수량이 원래대로 돌아간다.
	</script>
<%		
	}
	
	//  주문수량 장바구니에서 수정
	mallCart.setEdit(pnum,oqty);
	
	//response.sendRedirect("mall_cartList.jsp");
%>
	<script type="text/javascript">
			location.href="mall_cartList.jsp";
	</script>		

