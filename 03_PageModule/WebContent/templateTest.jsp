<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
templateTest.jsp
<br>
<br>
<% String contentPage = request.getParameter("contentPage");
%>
<table border="1" width="500" height="300">

	<tr>
		<td colspan="2">
			<!-- 방법2가지  --> <%-- <%@ include file="top.jsp" %> --%> 
			<jsp:include page="top.jsp"></jsp:include>
		</td>
	</tr>
	


	<tr>
		<td><jsp:include page="left.jsp"></jsp:include></td>
		<td><jsp:include page="<%=contentPage %>"></jsp:include></td>
	</tr>

	<tr>
		<td colspan="2"><jsp:include page="bottom.jsp"></jsp:include></td>
	</tr>
</table>