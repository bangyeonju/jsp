<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@page import="my.shop.mall.CartBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="mall_top.jsp" %>
<%
	boolean flag = (boolean)application.getAttribute("flag");
	System.out.println("mall_order.jsp flag 위:"+flag);
%>
<!-- mall_cartList.jsp 주문하기 클릭 -> mall_order.jsp -->
<!-- mall_proView.jsp 즉시 구매하기 클릭 ->mall_order.jsp -->

<jsp:useBean id="mallCart" class="my.shop.mall.CartBean" scope="session"/>

<%
	if(memid.equals("admin")){
	%>
		<script type="text/javascript">
			alert("관리자는 주문할수없습니다.");
			history.back();
		</script>
		<%
	}
	// application 객체는 프로젝트당 하나만 만들어진다
	int pnum= Integer.parseInt(request.getParameter("pnum"));
	int oqty= Integer.parseInt(request.getParameter("oqty"));
	System.out.println("pnum="+pnum +" oqty="+oqty);
	DecimalFormat df = new DecimalFormat("###,###");
	//언제 0이 넘어오나? 장바구니에서 즉시구매하기 누를떄
	if(pnum!=0&&oqty!=0){
		if(flag==true){
			mallCart.addProduct(pnum, oqty);
		}
	}

%>
	<table border="1">
	<tr class=m2>	
		<td colspan="3"> 결재 내역서 보기</td>
	</tr>
	<tr class=m1>
		<th width="40%">상품명</th>
		<th width="20%">수량</th>
		<th width="20%">금액</th>
	</tr>
	<%
	 Vector<ProductBean> cv = mallCart.getAllProducts();
	int totalPrice=0;
	for(ProductBean pb : cv){
		%>
		<tr>
		<td align="center"><%=pb.getPname() %></td>
		<td  align="center"><%=pb.getPqty()%></td>
		<td  align="center"><%=df.format(pb.getTotalPrice()) %></td>
		</tr>
		<%
		totalPrice+= pb.getTotalPrice();
	}
	%>
		<tr>
			<td colspan="3">결제하실 총액은:<%=df.format(totalPrice)%></td>
		</tr>
	</table>
	<input type="button" value="결제하기" onClick="location.href='mall_calculate.jsp'">
	<%
	 	application.setAttribute("flag", false);
		flag = (boolean)application.getAttribute("flag");
		System.out.println("mall_order.jsp flag 아래:"+flag);
	%>
	
    <%@include file="mall_bottom.jsp" %>
    
    
    
    
    