<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br><br>

<%
	request.setCharacterEncoding("UTF-8");
	
%>

<jsp:useBean id="dao" class="myPkg.MemberDao"/>
<jsp:useBean id="mb" class="myPkg.MemberBean"/>
<jsp:setProperty property="*" name="mb"/>
<%
	int cnt = dao.updateData(mb);
	if(cnt == 1){
		response.sendRedirect("select.jsp");
	}
	else{
		response.sendRedirect("updateForm.jsp?num="+mb.getNum());
	}
%>








