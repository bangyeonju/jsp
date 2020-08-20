<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- mall_order.jsp 결재하기 클릭 => mall_calculate.jsp -->
<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>
<jsp:useBean id="order" class="my.shop.mall.OrdersDao" scope="session"/>

<%
	String msg="";
	String url="";
	Vector<ProductBean> cv= mallCart.getAllProducts();//장바구니에 있는 모든상품..
	int no = (Integer)session.getAttribute("memno");
	int cnt=order.insertOrder(no,cv);
	
	if(cnt>=0){
		msg="주문 성공";
		//주문성공시 장바구니 있는거  모두 삭제해야함.
		mallCart.removeAllProduct();
		url=request.getContextPath()+"/myshop/display/mall.jsp";
		%>
		<script type="text/javascript">
		alert("<%=msg%>");
		var answer = confirm("계속 하시겠습니까?");//confirm 확인 이나 취소 버튼
		if(answer){//확인 눌렀을때 true
			location.href="<%=url%>";
		}else{
			location.href="<%=request.getContextPath()%>/logout.jsp";

		}
		</script>
		<%
	}else{
		msg="주문 실패";
		url=request.getContextPath()+"/myshop/display/mall.jsp";
%>
		<script type="text/javascript">
		alert("<%=msg%>");
		location.href="<%=url%>";
		</script>
	<% 
	}
	%>
