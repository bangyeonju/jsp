<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
updateProc.jsp<br><br>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="myPkg.EmpleDao"/>
<jsp:useBean id="bean" class="myPkg.EmpleBean"/>
<jsp:setProperty name="bean" property="*"/>
<%
	int cnt = dao.updateData(bean);
	if(cnt == 1){
		response.sendRedirect("select.jsp");
	}else{
		response.sendRedirect("updateForm.jsp");
	}
%>