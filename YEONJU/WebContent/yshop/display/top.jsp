
<%@page import="yj.kind.KindBean"%>
<%@page import="yj.kind.KindDao"%>
<%@page import="yj.food.FoodBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="yj.food.FoodDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* KindDao kdao = KindDao.getInstance();
ArrayList<KindBean> list = kdao.selectKind(); */
KindDao kdao = KindDao.getInstance();
ArrayList<KindBean> list = kdao.selectFcode();
%>  
  
<table border="1" width ="100%">
<tr>
	<td align ="center" colspan="<%=list.size()+1%>">
	<img src="<%=request.getContextPath() %>/images/1.jpg" weight="500" height="200">
	<% System.out.print(request.getContextPath());%>
	</td>
</tr>

<%
if(list.size()==0){
	%>
	<tr>
	<td>
}
	

	 %>
	 <td align="center">
	 장바구니
	 </td>>
</tr>

</table>