<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
<%
	/* 열거형 타입을 받ㅇ르 수있느   */
	Enumeration<String> names = request.getParameterNames();
%>
	<table border=1>
	<% 
	while(names.hasMoreElements()){
		String name = names.nextElement();
		String value = request.getParameter(name);
		out.print(name+" :"+value + "<br>");
		%>
		<tr>
			<td><%= name %></td>
			<td><%= value %></td>
		</tr>
	</table>
			
<% 
	}
	
%> 