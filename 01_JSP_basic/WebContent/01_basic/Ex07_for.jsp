<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int sum = 0;
	for(int i=1;i<=10;i++){
		sum = sum + i;
%>
		1~<%=i %> : <%=sum %> <br>
<%	
	}
%>
	1~10 : <%=sum %>
<%	
	out.println(sum);
%>
<!-- 
1~1:1
1~2:3
1~3:6
1~10:55
 -->
<table border=1 width="300">
<%
	for(int i=1;i<=9;i++){
%>
	<tr>
		<td><%=i %></td>
		<td><%=i*i %></td>	
	</tr>
<%		
	}
%>


</table>


 
 
 
 
 
 
 