<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp<br><br>
<jsp:useBean id="dao" class="emart.EmartDao"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	int cnt = dao.deleteData(num);  
	if(cnt == 1){
		response.sendRedirect("select.jsp");
	}
%>
