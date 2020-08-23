<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.mall.OrdersBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<br>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/style.css">
<jsp:useBean id="order" class="my.shop.mall.OrdersDao" scope="session" />
<%@include file="top.jsp"%>
<%		
		int total=0;
		Vector<OrdersBean> lists = new Vector<OrdersBean>();
		String memid = request.getParameter("memid");
		DecimalFormat df = new DecimalFormat("###,###");
		if(memid!=null){//아이디 입력후 내역조회 눌렀을때 => hong이 넘어간다.
			lists = order.getOrderList(memid);	
			
		}
	%>
<td colspan="6" valign="top" >
	<table border="1" width="800px"  >
		<tr>
			<td align="center" colspan="5" >
				<form action="shopping_list.jsp" method="post">
					조회할 회원 아이디 입력 : 
					<input type="text" name="memid" value="hong" /> 
					<input type="submit" value="내역조회" />
				</form>
			</td>
		</tr>
		<tr bgcolor="yellow">
			<th>고객명</th>
			<th>아이디</th>
			<th>상품명</th>
			<th>수량</th>
			<th>금액</th>
		</tr>
		<%
		for( OrdersBean ob : lists ){
			%>
			<tr>
				<td align="center"><%=ob.getMname() %></td>
				<td align="center"><%=ob.getMid() %></td>
				<td align="center"><%=ob.getPname() %></td>
				<td align="right"><%=ob.getQty() %></td>
				<td align="right">￦<%=df.format(ob.getAmount()) %></td>
			</tr>
			
			<%
			total += ob.getAmount();
			}//for
		
		%>
		
		<tr>
			<td colspan="4" align="center">총합</td>
			<td align="right">￦<%=df.format(total) %></td>

		</tr>
	</table>
</td>



<%@include file="bottom.jsp"%>