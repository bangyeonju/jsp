<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

deleteProc.jsp<br><br>
<jsp:useBean id="dao" class="myPkg.EmpleDao"/>
<%
	int mid = Integer.parseInt(request.getParameter("mid"));
	
	int cnt = dao.deleteData(mid);
	if(cnt == 1){
		response.sendRedirect("select.jsp");
	}
%>
 