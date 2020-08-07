<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao"  class="myPkg.MovieDao" />

<%
	String[] str = request.getParameterValues("rowcheck");

	int cnt=dao.deleteCheckData(str); 
	if(cnt>0){
		response.sendRedirect("select.jsp");
	}
	else{
		
	}
%>
