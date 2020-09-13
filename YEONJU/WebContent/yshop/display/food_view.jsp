<%@page import="yj.food.FoodDao"%>
<%@page import="yj.food.FoodBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@include file="top.jsp"%>
<style type="text/css">
body{
text-align: center;
}

</style>

<script type="text/javascript">
	function goCart(pnum){
		oqty = document.f.oqty.value;
		if(oqty<1){
			alert("1보다 큰 수를 입력하세요");
			return;
		}
		location.href="<%=request.getContextPath()%>/yshop/display/mall_cartAdd.jsp?pnum="+pnum+"&oqty="+oqty;
	}
	function goOrder(pnum){
		document.f.action="<%=request.getContextPath()%>/yshop/display/mall_order.jsp?pnum="+pnum;
		document.f.submit();
	}
</script>
<%
int pnum = Integer.parseInt(request.getParameter("pnum"));
FoodDao fdao = FoodDao.getInstance();

ArrayList<FoodBean> lists = fdao.getOneSelectByPnum(pnum);
String imgPath = request.getContextPath() + "/yshop/images/"+lists.get(0).getPimage();
%>
<body>
<table align="center" cellspacing= "0" cellpadding="40" >
<tr>
<td >
	<img src ="<%=imgPath%>" width="200" height="180">
</td>
<td align="center">
	<form name = "f" method="post">
	이름:<%=lists.get(0).getPname() %><br>
	가격:<%=lists.get(0).getPrice() %><br>
	재고수량:<%=lists.get(0).getPqty() %><br>
	포인트:<%=lists.get(0).getPoint() %><br>
	상품갯수:<input type="text" name="oqty" size="2" value="1">개<br><br>
	<table   width="90%" align="center">
					<tr>
						<td>
							<a href="javascript:goCart(<%=pnum %>)">
								<img src="../images/cartbtn.gif" width="70" height="30">
							</a>
						</td>
						
						<td>
							<a href="javascript:goOrder(<%=pnum %>)">
								<img src="../images/orderbtn.gif" width="70" height="30">
							</a>
						</td>
					</tr>
				</table>
				</form>
	설명:<%=lists.get(0).getPcontent() %>
</td>
</tr>
</table>
</body>
