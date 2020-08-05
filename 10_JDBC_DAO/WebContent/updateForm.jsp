<%@page import="myPkg.EmpleBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm.jsp<br><br>
<jsp:useBean id="dao" class="myPkg.EmpleDao"/>
<%
int mid= Integer.parseInt(request.getParameter("mid"));
EmpleBean bean = dao.getEmpleByMid(mid);
%>