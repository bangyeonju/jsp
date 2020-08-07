<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp<br><br>
<jsp:useBean id="dao" class="DTO.BookDao"/>
<%
int no = Integer.parseInt(request.getParameter("no"));
int cnt = dao.deleteData(no); 

if(cnt > 0){
	response.sendRedirect("select.jsp");
}
%>