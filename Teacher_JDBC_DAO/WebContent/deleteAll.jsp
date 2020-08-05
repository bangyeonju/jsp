<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
deleteAll.jsp<br><br>
<jsp:useBean id="dao" class="myPkg.EmpleDao"/>
<%
String[] rowcheck=request.getParameterValues("rowcheck");
for(int i=0;i<rowcheck.length;i++){
	System.out.println(rowcheck[i]+ " ");
}
int cnt = dao.deleteCheckData(rowcheck);

if(cnt>0){
	response.sendRedirect("select.jsp");
	
}
%>