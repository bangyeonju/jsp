<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
String paramControl = request.getParameter("paramControl");
String paramName= request.getParameter("paramName");
%>
<table border="1">
	<tr>
		<th colspan="2" height="40"><jsp:include page="top.jsp" /></th>
	</tr>
	<tr>
		<td width="100" height="200"><jsp:include page='<%=paramControl+"Left.jsp"%>'/></td>
		<td width="400" valign="top">
		<b> <%=paramName%>정보입니다.</b>
		<jsp:include page='<%=paramControl+".jsp"%>'/>
		</td>
	</tr>
	<tr>
		<th colspan="2" height="40"><jsp:include page="bottom.jsp" /></th>
	</tr>
</table>
