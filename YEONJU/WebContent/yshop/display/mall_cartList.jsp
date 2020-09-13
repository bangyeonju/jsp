<%@page import="yj.food.FoodBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ include file="top.jsp" %>
    <jsp:useBean id="mallCart" class="yj.mall.CartBean" scope="session"/>
    
    <table align="center">
    	<tr>
    		<td colspan="6" align="center">
    		<h4>장바구니 보기 </h4>
    		</td>
    	</tr>
    	<tr>
    		<td>번호</td>
    		<td>상품명</td>
    		<td>수량</td>
    		<td>단가</td>
    		<td>금액</td>
    		<td>삭제</td>
    		
    	</tr>
    	<%
    	DecimalFormat df = new DecimalFormat("###,###");
    	int cartTotalPrice=0;
    	int cartTotalPoint=0;
    	
    	Vector<FoodBean> cv = mallCart.getAllFood();
    	if(cv.size()==0){
    		out.print("<tr><td colspan=6 align=center><b>장바구니에 상품이 없습니다.<b></td></tr></table>");
    	}else{
    		for(FoodBean fb : cv){
    			String pimage = fb.getPimage();
    			String imgPath = request.getContextPath()+"/yshop/images/"+pimage;
    			
    			%>			
    			<tr>
    				<td align=center> <%=fb.getPnum() %> </td>
    				<td align=center>
    					<img src="<%=imgPath %>" width="40" height="40"><br>
    					<b><%=fb.getPname() %></b>
    				</td>
    				<td align=center> 
    					<form name="f" method="post" action="mall_cartEdit.jsp">
    						<input type="text" size="5" name="oqty" value="<%=fb.getPqty() %>">개
    						<input type="hidden" name="pnum" value="<%=fb.getPnum() %>"> 
    						<input type="submit" value="수정">				
    					</form>
    				</td>
    				<td align=center> 
    					<%=df.format(fb.getPrice()) %>원<br>
    					[<%=fb.getPoint() %>] point
    				</td>
    				
    				<td align=center> 
    					<font color=red>
    						<%=df.format(fb.getTotalprice()) %>원<br>
    						[<%=fb.getTotalpoint()%>] point
    					</font>
    				</td>
    				<td align=center> 
    					<a href="mall_cartDel.jsp?pnum=<%=fb.getPnum()%>">삭제</a>
    				</td>
    			
    			</tr>	
    			<% 
    			
    		}
    	}
    	
    	%>
    	
    </table>