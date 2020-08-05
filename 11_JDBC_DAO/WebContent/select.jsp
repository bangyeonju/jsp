<%@page import="emart.emartDao"%>
<%@page import="emart.EmartBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
select.jsp입니다
<jsp:useBean id="dao" class="emart.emartDao" />
<%
ArrayList<EmartBean> lists = dao.getAllEmart(); 
%>
<table border="1">
	<tr>
		<th><input type="checkbox" name="allcheck"
			onClick="allDelete(this)"></th>
		<th>번호</th>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>상품</th>
		<th>시간대</th>
		<th>결재</th>
		<th>동의</th>
		<th>수정</th>
		<th>삭제</th>


	</tr>
	<%
for( EmartBean bean : lists){
		%>
	<tr>
		<td></td>
		<td><%=bean.getNo() %></td>
		<td><%=bean.getId() %></td>
		<td><%=bean.getPw() %></td>
		<td><%=bean.getProduct() %></td>
		<td><%=bean.getTime() %></td>
		<td><%=bean.getApprove() %></td>
		<td><%=bean.getAgree() %></td>
		<td>수정</td>
		<td>삭제</td>

	</tr>
	<%
	}
%>
</table>