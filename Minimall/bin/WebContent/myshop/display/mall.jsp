<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductDao"%>
<%@page import="my.shop.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="mall_top.jsp" %>
<h3>welcome to my mall</h3>
<%
	String[] spec={"HIT","NEW","BEST","NORMAL"};
	//가격 3자리마다 쉼표나오게
	DecimalFormat df= new DecimalFormat("###,###");
	ProductDao pdao = ProductDao.getInstance();
	for(int i =0;i<spec.length;i++){
	ArrayList<ProductBean> plists = pdao.getSelectBySpec(spec[i]);
%>
	<hr color="green" width="80%">
	<font color="red" size="3"><%=spec[i] %></font>
	<hr color="green" width="80%">
<%
	if(plists.size()==0){
		out.println("<b>"+spec[i]+"상품없습니다."+"</b>");
		} else{
%>
	<table  width="100%" align="center">
		<tr>
		<% 
			int count =0;
			for(ProductBean pb:plists){
			count ++;
			String pimage = pb.getPimage();
			String pname = pb.getPname();
			int price = pb.getPrice();
			int point = pb.getPoint();
			int pnum = pb.getPnum();
			//이미지를 가지고 올때 request
			String imgPath=request.getContextPath()+"/myshop/images/"+pimage;
			
			%>
			<td align="center" >
					<a href="mall_prodView.jsp?pnum=<%=pnum%>"><img src="<%=imgPath%>" width="80" height="60" ></a>
					<br>
					<%=pname %><br>
					<font color="red"><%=df.format(price) %></font><br>
					<font color="blue"><%=point %></font><br>
					
			</td>
			<%
			if(count%3==0){ //한줄에 세개씩보여줄라고
				out.println("</tr><tr>");
			}
		}
			%>
		
	
	</table>
<% 
		}
	}
%>
  <%@ include file="mall_bottom.jsp" %>