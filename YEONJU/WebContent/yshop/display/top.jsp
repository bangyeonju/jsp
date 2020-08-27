<%@page import="yj.kind.KindBean"%>
<%@page import="yj.kind.KindDao"%>
<%@page import="yj.food.FoodBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="yj.food.FoodDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
.logout {
	float: right;
}
td{
font-size:15px;

}

</style>
<%
KindDao kdao = KindDao.getInstance();
ArrayList<KindBean> list = kdao.selectKind();

String memid = (String)session.getAttribute("memid");
%>

<a class="logout" href="<%=request.getContextPath() %>/logout.jsp">
	<img src="<%=request.getContextPath() %>/yshop/images/logout.jpg"
	width="50" height="20">
</a>
<span class="logout"><%=memid %>님</span>
<table border="1" width="100%" cellspacing="0">

	<tr>
		<td colspan="<%=list.size()+5%>" align="center" >
			<img
			src="<%=request.getContextPath() %>/images/1.jpg" weight="500"
			height="150">
			
			</td>
	</tr>

	<%

if(list.size()==0){
	
	%>
	<tr>
		<td align="center">카테고리 없습니다.</td>
	
		<% 
}else{
	for(KindBean kb : list){
		String kname=kb.getFname();
		String kcode=kb.getFcode();
	System.out.print(kb.getFcode());
		%>

		<td height="30" align="center">
		<a
			href="<%=request.getContextPath() %>/yshop/display/mall_kLikst.jsp?kcode=<%=kb.getFcode()%>&kname=<%=kname%>"><%=kname %></a>
		</td>

		<% 
	}
}
	%>



		<td align="center"><a href="">장바구니</a></td>
		<td align="center"><a
			href="<%=request.getContextPath()%>/yshop/board/list.jsp">게시판</a></td>
		<%if(memid.equals("admin")){%>
		<td align="center"><a
			href="<%=request.getContextPath()%>/yshop/admin/kind_list.jsp">관리자
				페이지</a></td>

		<%} %>

	</tr>


</table>
