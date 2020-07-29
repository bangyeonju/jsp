<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_body.jsp<br><br>

<% 
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String addr = request.getParameter("addr");
%>

포함되는 페이지 Ex01_body.jsp 입니다.<br>
<%=name%>님 반갑습니다.<br>
비번은 <%=pw%>입니다.<br>
주소는 <%=addr%>입니다.