<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	function goCart(pnum){
	//	alert("goCart");
	
	oqty = document.f.oqty.value;
	if(oqty<1){
		alert("1 보다 큰수 입력해주세영");
		return;
		}
		location.href="<%=request.getContextPath()%>/myshop/display/mall_cartAdd.jsp?pnum="+pnum+"&oqty="+oqty;
	
	}
	function goOrder(pnum){
		//alert("goOrder");
		/* action은 굳이 oqty넘기지 않아도 넘어간다. */
		document.f.action="<%=request.getContextPath()%>/myshop/display/mall_order.jsp?pnum="+pnum;
		document.f.submit();
	}
</script>
<%@ include file="mall_top.jsp"%>

<%

application.setAttribute("flag",true); // flag =true // application 객체는 프로젝트당 하나만 만들어진다 다른곳에서도 이정보를 쓸수 있다.
System.out.println("mall_prodView.jsp flag:"+application.getAttribute("flag"));
int pnum= Integer.parseInt(request.getParameter("pnum"));
ProductDao pdao = ProductDao.getInstance();

ArrayList<ProductBean> pb = pdao.productSelect(pnum);
//가격 3자리마다 쉼표나오게
DecimalFormat df= new DecimalFormat("###,###");




%>
<table width="100%">
	<tr class="m1">
		<td colspan="2" align="center"><font color=green size=3 > <b>[<%=pb.get(0).getPname() %>]상품정보
			</b>
		</font></td>
	<tr align="center">
		<td class="m3">
		<img src="<%=request.getContextPath()%>/myshop/images/<%=pb.get(0).getPimage()%>"
			width="200" height="200"></td>
		<td >
			<form name="f" method="post">
			상품번호:<%=pb.get(0).getPnum() %><br> 
			상품이름:<%=pb.get(0).getPname() %><br>
			상품가격:<font color="red"><%=df.format(pb.get(0).getPrice())%></font>원<br>
			상품포인트:<font color="red">[<%=pb.get(0).getPoint() %>]</font>point<br>
			상품갯수:<input type="text" size ="2" name="oqty" value="1" />개<br><br><br>
			<table width="90%" align="center">
				<tr>	
					<td>
						<a href="javascript:goCart(<%=pnum%>)">
							<img src="../images/cartbtn.gif" width="90" height="35"/>
						</a>
					</td>
						<td>
						<a href="javascript:goOrder(<%=pnum%>)">
							<img src="../images/orderbtn.gif" width="90" height="35"/>
						</a>
					</td>
				</tr>
			</table>
			</form>
		</td>
	
	</tr>
<tr height="200" valign="top">
<td colspan="2">
	<b>상품상세설명</b>
	<br>
	<%=pb.get(0).getPcontents() %>
	</td>
	</tr>

</table>


<%@ include file="mall_bottom.jsp"%>