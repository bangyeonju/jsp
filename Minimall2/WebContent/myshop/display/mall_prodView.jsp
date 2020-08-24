<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_prodView.jsp -->

<script type="text/javascript">
	function goCart(pnum){
		//alert("goCart");
		oqty = document.f.oqty.value;
		if(oqty < 1) {
			alert("1보다 큰 수를 입력하세요");
			return;
		}
		location.href="<%=request.getContextPath() %>/myshop/display/mall_cartAdd.jsp?pnum="+pnum+"&oqty="+oqty;       
	}
	
	function goOrder(pnum){
		//alert("goOrder");
		document.f.action="<%=request.getContextPath() %>/myshop/display/mall_order.jsp?pnum="+pnum;
		document.f.submit();
	}
</script>    


<!-- mall_prodView.jsp -->
<%@ include file = "mall_top.jsp"%>
<%
/* ServletContext application = new ServletContext() */
	application.setAttribute("flag", true); // flag = true
	System.out.println("mall_prodView.jsp flag:" + application.getAttribute("flag"));

	int pnum = Integer.parseInt(request.getParameter("pnum"));
	ProductDao pdao = ProductDao.getInstance();
	ArrayList<ProductBean> plists = pdao.getOneSelectByPnum(pnum); 
	 
	String pimage = plists.get(0).getPimage(); 
	String imgPath = request.getContextPath()+"/myshop/images/"+pimage;
	DecimalFormat df = new DecimalFormat("###,###");
	
%>

<table width="100%" border="0" class=outline>
	<tr class="m1">
		<td colspan=2 align="center">
			<font color=green size=3>
				<b>[<%= plists.get(0).getPname()%>] 상품정보</b>
			</font>
		</td>
	</tr>
	
	<tr align="center">
		<td class="m3">
			<img src="<%=imgPath %>" width="200" height="200">
		</td>
		
		<td  class="m3">
			<form name="f" method="post" >
				상품번호 : <%=plists.get(0).getPnum() %> <br>
				상품이름 : <%=plists.get(0).getPname() %> <br>
				상품가격 : <font color=red><%=df.format(plists.get(0).getPrice()) %></font> <br>
				상품포인트 : <font color=red><%=plists.get(0).getPoint() %></font> <br>
				상품갯수:<input type="text" name="oqty" size="2" value="1">개<br><br>
				<table width="90%" align="center">
					<tr>
						<td>
							<a href="javascript:goCart(<%=pnum %>)">
								<img src="../images/cartbtn.gif" width="90" height="35">
							</a>
						</td>
						
						<td>
							<a href="javascript:goOrder(<%=pnum %>)">
								<img src="../images/orderbtn.gif" width="90" height="35">
							</a>
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
	
	<tr height="200" valign="top">
		<td colspan="2">
			<b>상품 상세 설명</b><br>
			<%= plists.get(0).getPcontents()%>
		</td>
	</tr>
	
</table>








<%@ include file = "mall_bottom.jsp"%>








