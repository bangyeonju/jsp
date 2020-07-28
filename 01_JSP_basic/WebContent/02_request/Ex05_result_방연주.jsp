<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	String time=request.getParameter("time");
	String approve=request.getParameter("approve");
	String agree =request.getParameter("agree");
	
	String[] product = request.getParameterValues("product");
	if(agree.equals("on")){
		agree="동의함";
	} else
		agree="동의안함";
		
%>
<table border=1>
	<tr>
		<td>id</td>
		<td><%=id %></td>
	</tr>
	<tr>
		<td>pw</td>
		<td><%=pw %></td>
	</tr>
	<tr>
		<td>time</td>
		<td><%=time %></td>
	</tr>
	<tr>
		<td>approve</td>
		<td><%=approve %></td>
	</tr>
	<tr>
		<td>agree</td>
		<td><%=agree %></td>
	</tr>
	<tr>
		<td>product</td>
		<td>
			<%
	for(int i= 0;i<product.length;i++){
		out.print(product[i]);
	}
	
			
%>
		</td>
	</tr>
</table>
<br><br>

<%
	Enumeration<String> names= request.getParameterNames();
%>
<table border=1>
	<% 
		while(names.hasMoreElements()){
		String name= names.nextElement();
		String[] value=request.getParameterValues(name);
		
		
		%>
		
	<tr>
		<td><%=name %></td>
		<td>
			<% for(int i=0;i<value.length;i++){
			
			if(value[i].equals("on")){
				value[i]="동의함";
			} 
			out.print(value[i]+"");
				
			
		}
		%>
		</td>
	</tr>
<% }
%>
</table>
