<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- logout.jsp-->
<% 
// 세션무효화
session.invalidate();
response.sendRedirect("main.jsp");
 %>