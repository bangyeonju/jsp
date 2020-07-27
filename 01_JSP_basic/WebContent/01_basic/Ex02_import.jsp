<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%  /* 스크립트릿 자바코드 쓰겠다는 표현  */
		
		Calendar cal= Calendar.getInstance();//내부적을 이루어진 가져올수있다
		
	%>
	오늘은 
	<%= cal.get(Calendar.YEAR) %>년
	<%= cal.get(Calendar.MONTH)+1 %>월
	<%= cal.get(Calendar.DATE) %>일
	<hr>
	
	<% Date d = new Date(); %>
	<%= d %><br>
	<%= d.toLocaleString() %>
</body>
</html>



<%--
 JSP 태그
<%  %> : 스크립트릿
<%=  %> : 표현식
<%@  %> : 지시어 
--%>

 