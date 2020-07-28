<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table border=1>

	<% for(int i=2;i<=9;i++){
	%>
	<th bgcolor="pink">
		<% out.print(i+"단"); %>
	</th>
	<%} %>
	<% for(int i=1;i<=9;i++) {%>
	<tr>
		<% for(int j=2;j<=9;j++) { %>
			<td>	
				<%=j %>*
				<%=i %>=
				<%=i*j %>
				
				
			</td>	
						
		<% } %>
		</tr>
	<% } %>


</table>
