<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="dao"  class="myPkg.MovieDao" /> --%>
<%
	MovieDao dao = MovieDao.getInstance();
	System.out.println("delectproc.jsp"+dao);
	int num = Integer.parseInt(request.getParameter("num"));
	int cnt=dao.deleteData(num); 
	if(cnt!=-1){
		response.sendRedirect("select.jsp");
	}
	else{
		
	}
		
%>
