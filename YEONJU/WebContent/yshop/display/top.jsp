<%@page import="yj.kind.KindBean"%>
<%@page import="yj.kind.KindDao"%>
<%@page import="yj.food.FoodBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="yj.food.FoodDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style type="text/css">
	.logout{
		float : right;
	}
</style>
<%
KindDao kdao = KindDao.getInstance();
ArrayList<KindBean> list = kdao.selectKind();
<<<<<<< HEAD
String memid = (String)session.getAttribute("memid");
=======
>>>>>>> c256da0b8516f02a480294fa5000bc7098ed3aec
%>  

 <a class="logout" href="<%=request.getContextPath() %>/logout.jsp">
				<img src="<%=request.getContextPath() %>/yshop/images/logout.jpg" width="50" height="20">
			</a>
 <span class="logout"><%=memid %>님</span>
<table border="1" width ="100%">

<tr>
	<td colspan="<%=list.size()+2%>"align ="center" >
	<img src="<%=request.getContextPath() %>/images/1.jpg" weight="500" height="200">
	</td>
</tr>

<%

if(list.size()==0){
	
	%>
	<tr>
<<<<<<< HEAD
	<td align ="center" >
=======
	<td>
>>>>>>> c256da0b8516f02a480294fa5000bc7098ed3aec
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
		
<<<<<<< HEAD
			<td height="50" align ="center" >
				<a href="<%=request.getContextPath() %>/yshop/display/mall_kLikst.jsp?kcode=<%=kb.getFcode()%>&kname=<%=kname%>"><%=kname %></a>
=======
			<td>
				<a href="<%=request.getContextPath() %>/yshop/display/mall_kLikst.jsp?kcode=<%=kb.getFname()%>&kname=<%=kname%>"><%=kcode %></a>
>>>>>>> c256da0b8516f02a480294fa5000bc7098ed3aec
			</td>
		
		<% 
	}
}
	%>
	

	 
	 <td align="center">
	 <a href="">장바구니</a>
	 </td>
	 <%if(memid.equals("admin")){%> 
	<td align ="center" >
		<a href="<%=request.getContextPath()%>/yshop/admin/kind_list.jsp">관리자 페이지</a>
	</td>
	
<%} %>
	 
</tr>


</table>