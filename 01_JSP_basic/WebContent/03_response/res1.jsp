<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
res1.jsp

<%
	String msg = request.getParameter("msg");
	out.print(msg);
%>

넘어온값:<%= request.getParameter("msg")%><br>


<%
	System.out.println(msg);
	response.sendRedirect("res2.jsp?msg="+msg);
%>