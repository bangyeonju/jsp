<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
updateProc.jsp<br><br>
<% 
request.getParameter("UTF-8");
%>
<jsp:useBean id="dao" class="myPkg.EmpleDao"></jsp:useBean>
<%
int mid = Integer.parseInt(request.getParameter("mid"));
int cnt = dao.updateData(mid);
%>