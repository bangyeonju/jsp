<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="top.jsp"%>
<%
String kcode = request.getParameter("kcode");
String kname= request.getParameter("kname");
FoodDao fdao = FoodDao.getInstance();
ArrayList<FoodBean> lists = fdao.getSelectByKind(kcode);

if(lists.size()==0){
	for(FoodBean fb : lists){ 
		String imgPath = request.getContextPath() + "/yshop/images/"+fb.getPimage();
	%>
	
<%
}
%>
	<% 
}else{
	%>
	<table border="1" align="center" cellspacing= "0">
	
	<tr>
	<%
	int count =0;
	for(FoodBean fb : lists){
		count++;
		String imgPath = request.getContextPath() + "/yshop/images/"+fb.getPimage();
		%>
		<td>
		<a href="food_view.jsp?pnum=<%=fb.getPnum()%>"><img src ="<%=imgPath%>" width="200" height="180"></a><br>
		<%=fb.getPspec() %><br>
		<%=fb.getPname() %><br>
		<%=fb.getPrice() %><br>
		<%=fb.getPoint() %>
		<br>
		</td>
		<%
		if(count%5==0){	
			%>
			</tr><tr>
			<%
		}
	}
	%></tr>
	</table>
	<%
}
%>
