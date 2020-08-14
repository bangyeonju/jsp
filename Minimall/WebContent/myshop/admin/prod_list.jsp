<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductDao"%>
<%@page import="my.shop.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
function checkDel(pnum,pimage) {
   var answer =confirm("정말 삭제하시겠습니까?");
   if (answer) {
      location.href="prod_delete.jsp?pnum="+pnum+"&pimage="+pimage;
   }
}
</script> 
prod_list.jsp
<br>
<%@include file="top.jsp" %>
	
<td colspan="6" valign="top">
<table width="95%" class="outline" >
	<caption><b>상품목록</b></caption>
<tr>
	<th>번호</th>
	<th>상품코드</th>
	<th>상품평</th>
	<th>이미지</th>
	<th>가격</th>
	<th>제조사</th>
	<th>수량</th>
	<th>수정|삭제</th>
</tr>
<%
	ProductDao pdao = ProductDao.getInstance();
	ArrayList<ProductBean> lists = pdao.productList();
	if(lists.size()==0){
		out.println("<tr><td colspan=8 align='center'>등록된 상품이 없습니다.</tr></td>");
		
	}
	for(ProductBean pb : lists){
		%>
		<tr >
			<td align="center"><%=pb.getPnum() %></td>
			<td align="center"><%=pb.getPcategory_fk() %></td>
			<td align="center"><%=pb.getPname() %></td>
			<%
			// pb.getPimage();//이미지이름.jpg
			String conpath = request.getContextPath(); //=> ?
			System.out.println("conpath="+conpath);
			
			String conpath2 = request.getContextPath() +"/myshop/images/"+pb.getPimage();
			System.out.println("conpath2="+conpath2);
			
			%>
			<td align="center"><a href="prod_view.jsp?pnum=<%=pb.getPnum()%>"><img src="<%=conpath2%>" width=40 height=40></a></td>
			<td align="center"><%=pb.getPrice() %></td>
			<td align="center"><%=pb.getPcompany() %></td>
			<td align="center"><%=pb.getPqty() %></td>
			<td align="center">
			<a href="prod_update.jsp">수정</a>|
			<a href="javascript:checkDel('<%=pb.getPnum	()%>','<%=pb.getPimage()%>')">삭제</a> 
			
			</td>
			
		</tr>
		
		<% 
		
	}
	
%>
				
</table>
</td>
<%@include file="bottom.jsp" %>