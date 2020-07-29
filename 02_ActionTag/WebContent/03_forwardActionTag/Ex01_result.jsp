<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_result.jsp<br><br>

<% 
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String addr = request.getParameter("addr");
%>

<%=name%>님 반갑습니다.<br>
비번은 <%=pw%>입니다.<br>
주소는 <%=addr%>입니다.