<%@page import="javax.websocket.Session"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryBean"%>
<%@page import="my.shop.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String contextPath = request.getContextPath();
String memid=(String)session.getAttribute("memid"); 
%>
<link href="<%=contextPath%>/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.logout{
		float : right;
	}
</style>
<table width="770px" border="1" align="center" valign="top">
	<tr>
		<td colspan="2" align="center">
			<a href="<%=contextPath%>/main.jsp">HOME</a>
			<a href="<%=contextPath%>/myshop/admin/main.jsp">관리자홈</a>
			<a href="<%=contextPath%>/myshop/display/mall.jsp">쇼핑몰</a>
			<a href="<%=contextPath%>/myshop/display/mall_cartList.jsp">장바구니</a>
			<a href="<%=contextPath%>/myshop/board/list.jsp">게시판</a>
			<a href="<%=contextPath%>/myshop/display/company.jsp">회사소개</a>
			<a href="<%=contextPath%>/logout.jsp">
				<img  class="logout" src="<%=contextPath%>/myshop/images/logout.jpg" width="50" height="20">
			</a>
			<span class="logout"><%=memid%>님</span>
		</td>
	</tr>
	<tr>
		<td width="180px" align="center" border="1" valign="top">
		
		<table width="100%" align="left"  border="1">
		<%
		CategoryDAO cdao = CategoryDAO.getInstance();
		ArrayList<CategoryBean> lists= cdao.categoryList();
		if(lists.size()==0){
			%>
			<tr>
				<td>
					카테고리가 없습니다.
				</td>
			</tr>
			<%
			
		}else{
			for(int i =0;i<lists.size();i++){
				CategoryBean cb = lists.get(i);
				String cgname = cb.getCname();
				String code = cb.getCode();
				%>
				
			<tr>
				<td>
					<a href="<%=contextPath%>/myshop/display/mall_cgList.jsp?code=<%=code%>&cgname=<%=cgname%>">
						<%=cgname %>[<%=code %>]
					</a>
				</td>
			</tr>		
		<%	}
		}
		%>
		</table>
		</td>
		<td width="600px" align="center" valign="top">
