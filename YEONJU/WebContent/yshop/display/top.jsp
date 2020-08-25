
<%@page import="yj.kind.KindBean"%>
<%@page import="yj.kind.KindDao"%>
<%@page import="yj.food.FoodBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="yj.food.FoodDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
KindDao kdao = KindDao.getInstance();
ArrayList<KindBean> list = kdao.selectKind();
%>  
  
<table border="1" width ="100%">
<tr>
	<td align ="center" colspan="<%=list.size()+1%>">
	<img src="<%=request.getContextPath() %>/images/1.jpg" weight="500" height="200">
	</td>
</tr>

<%

if(list.size()==0){
	
	%>
	<tr>
	<td>
	카테고리 없습니다.
	</td>
	</tr>
	<tr>
	<% 
}else{
	for(KindBean kb : list){
		String kname=kb.getFname();
		String kcode=kb.getFcode();
	System.out.print(kb.getFcode());
		%>
		
			<td>
				<a href="<%=request.getContextPath() %>/yshop/display/mall_kLikst.jsp?kcode=<%=kb.getFname()%>&kname=<%=kname%>"><%=kcode %></a>
			</td>
		
		<% 
	}
}
	%>
	

	 
	 <td align="center">
	 장바구니
	 </td>>
</tr>

</table>