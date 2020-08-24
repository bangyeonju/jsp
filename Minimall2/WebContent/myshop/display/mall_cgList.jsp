<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_cgList.jsp -->

<%@ include file="mall_top.jsp" %>

<%
	String code = request.getParameter("code");
	String cgname = request.getParameter("cgname");
	out.print(code +"," + cgname); // man, 남성복 
	//pcategory_fk = code + pcode;
%>
   <hr color=green width="80%">
		<font color=red size=3><%=cgname %></font>
	<hr color=green width="80%">

<%
	ProductDao pdao = ProductDao.getInstance(); 
	ArrayList<ProductBean> plists =  pdao.getSelectByCategory(code);
	DecimalFormat  df = new DecimalFormat("###,###");
	
		if(plists.size() == 0){ 
			out.println("<b>"+cgname+"상품 없습니다.</b>"); 
		}
		else{
%>
			<table align="center" width="100%">
				<tr>
			<%
				int count = 0;
			
				for(ProductBean pb : plists){
					count++;
					String pimage = pb.getPimage();
					String pname = pb.getPname();
					int price = pb.getPrice();
					int point = pb.getPoint();
					int pnum = pb.getPnum();
					
					String imgPath = request.getContextPath() + "/myshop/images/"+pimage;
					%>
						<td align="center">
						<a href="mall_prodView.jsp?pnum=<%=pnum%>">
							<img src="<%=imgPath%>" width="80" height="60"><br>
						</a>
							<%=pname %><br>
							<font color=red><%=df.format(price) %></font>원<br>
							<font color=blue><%=point %></font>point<br>	 		 		
						</td>
					<%
					if(count%3==0){ // 
						out.println("</tr><tr>");
						
					}
				}
			%>					
				
				</tr>
			
			</table>
<%			
		
		
	}
%>   





<%@ include file="mall_bottom.jsp" %> 

