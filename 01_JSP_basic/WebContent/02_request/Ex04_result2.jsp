<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<table border=2>
	<%
   		Enumeration<String> names = request.getParameterNames();
   		
   	while(names.hasMoreElements()){
   		String name= names.nextElement();
   		String[] value= request.getParameterValues(name);
   		%>
	<tr>
		<td><%= name %></td>
		<td>
			<%
   				for(int i=0;i<value.length;i++){
   					out.print(value[i]+"");
   				}
   				%>
		</td>
	</tr>

	<% 
   		}
   	%>
</table>

