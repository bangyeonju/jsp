<%@page import="yj.kind.KindBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="yj.kind.KindDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file = "top.jsp" %>
<%

	KindDao kdao = KindDao.getInstance();
	ArrayList<KindBean> lists = kdao.selectKind();
%>
<table border="1" align="center">
	<tr>
		<th>음식코드</th>
		<th>음식이름</th>
		<th>삭제</th>
	</tr>
	<%
	if(lists.size()==0){
		%>
		<tr>	
			<td colspan="3" align="center">
				코드가 없습니다.
			</td>
		</tr>
		<%
	}
	for(KindBean kb : lists){
		%>
		<tr>
			
			<td><%=kb.getFcode() %></td>
			<td><%=kb.getFname() %></td>
			<td><a href="kind_deletProc.jsp?fnum=<%=kb.getFnum()%>">삭제</a></td>
		</tr>
		<%
	}
	%>
</table>