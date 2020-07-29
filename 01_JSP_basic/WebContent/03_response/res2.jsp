<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 res2.jsp<br><br>
<%
	String msg = request.getParameter("msg");
	out.print(msg);
%>

