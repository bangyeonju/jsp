<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteAll.jsp
<jsp:useBean id="dao" class="Book.BookDao"/>
<%request.setCharacterEncoding("UTF-8");%>
<%
int num = Integer.parseInt(request.getParameter("num"));

int cnt = dao.deleteCheckData(str);
%>