<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
deleteProc.jsp
<jsp:useBean id="dao" class="myPkg.EmpleDao"/>
<jsp:useBean id="bean" class="myPkg.EmpleBean"/>


<%
int mid= Integer.parseInt(request.getParameter("mid"));
int cnt= dao.deleteData(mid);

%>
