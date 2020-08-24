<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 	myshop\display\mall.jsp<br><br> -->
    
<%@ include file="mall_top.jsp" %> 
 
 <h3>Welcome to My Mall</h3>
   
<%
	ProductDao pdao = ProductDao.getInstance();
	String[] spec = {"HIT","NEW","BEST","NORMAL"};
	DecimalFormat  df = new DecimalFormat("###,###");
	
	for(int i=0;i<spec.length;i++){  
		ArrayList<ProductBean> plists = pdao.getSelectBySpec(spec[i]);
%>
		<hr color=green width="80%">
		<font color=red size=3><%=spec[i] %></font>
		<hr color=green width="80%">
<%		
		if(plists.size() == 0){
			out.println("<b>"+spec[i]+"상품 없습니다.</b>"); 
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
		
		
		
	}
%>   
   
   
   

<%@ include file="mall_bottom.jsp" %>