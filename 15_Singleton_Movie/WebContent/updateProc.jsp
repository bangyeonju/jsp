<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	request.setCharacterEncoding("UTF-8");%>
<%-- <jsp:useBean id="dao"  class="myPkg.MovieDao"/> --%>
<jsp:useBean id="bean" class="myPkg.MovieBean"/>
<jsp:setProperty name="bean" property="*" />


<%
	MovieDao dao = MovieDao.getInstance();
	System.out.println("updateProc.jsp"+dao);
	String[] genre = request.getParameterValues("genre");
	
	String temp = " "; 
	if (genre == null){
		temp="선택사항없음"; 
					
	}			
	else {
		for (int i = 0; i < genre.length; i++) {
			if(i == genre.length-1)
				temp += genre[i] ;
			else
				temp += genre[i] + ","  ;
		}
	}
	bean.setGenre(temp); 
		
	int cnt=-1;
	
	cnt = dao.updateData(bean);
	if(cnt>0)
		response.sendRedirect("select.jsp");
	else
		response.sendRedirect("updateForm.jsp");
%>
