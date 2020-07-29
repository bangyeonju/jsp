<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
시작하는 페이지 입니다.
<jsp:forward page="templateTest.jsp">
	<jsp:param value="content.jsp" name="contentPage"/>
	
</jsp:forward>

<!-- contentPage=content.jsp -->
