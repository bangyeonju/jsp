<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

deleteAll.jsp<br><br>
<jsp:useBean id="dao" class="my.BookDao"/>
<%
	String[] str = request.getParameterValues("rowcheck"); 
	/* for(){
		str[i]
	} */
	
	int cnt = dao.deleteCheckData(str);     
	if(cnt>0){
		response.sendRedirect("select.jsp");
	}
	
%>