<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_reqult.jsp

<%request.setCharacterEncoding("UTF-8"); %><!-- 넘어오는 한굴 UTF-8로 처리하겠다 -->
<%
	String a = request.getParameter("name");//name속성값을 적는다 name="name"
	String b = request.getParameter("age");//name="age"
	String c = request.getParameter("addr");
	
%>
넘어온데이터<br>
이름 : <%= a %><br>
나이 : <%= b %><br>
주소 : <%= c %>