<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="top.jsp"%>
<%
String kcode = request.getParameter("kcode");
String kname= request.getParameter("kname");
FoodDao fdao = FoodDao.getInstance();
String[] spec = {"HIT","NEW","BEST","NORMAL"};
%>
<%
	for(int i=0;i<spec.length;i++){
		ArrayList<FoodBean> plists = fdao.getselectBySpec(spec[i]);
%>
<body style="text-align: center;">
		<hr color=green width="80%">
		<font color=red size=3 ><%=spec[i] %></font>
		<hr color=green width="80%">
		
<%
		if(plists.size()==0){
			
			out.println("<b>"+spec[i]+"상품 없습니다.</b><br>");
		}
	else{
		%>
		<table border="1" align="center">
			<tr>
		<%
		int count=0;
		for(FoodBean fb : plists){
		String imgPath = request.getContextPath() + "/yshop/images/"+fb.getPimage();

		%>
		<td>
			<a href="food_view.jsp?pnum=<%=fb.getPnum()%>">
			<img src="<%=imgPath%>" width="100" height="100"><br>
			</a>
			
			<%=fb.getPname() %>
		</td>
		
		<% 
		}
		%>
			</tr>
		</table>
		</body>
		<%
		}
	}
%>
