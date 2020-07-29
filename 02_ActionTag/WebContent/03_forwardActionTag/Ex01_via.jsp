<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
Ex01_via.jsp
<%
	request.setCharacterEncoding("UTF-8");
 	String name = request.getParameter("name");
 	String pw = request.getParameter("pw");
 	
 	out.print(name+","+pw+"<br>");
 	System.out.println(name+","+pw);
%>
<!-- forward액션태그 response.sendRedirect 공통점
중간에 거쳐가는 페이지이당
차이점
forward는 주소창에 거쳐가는 페이지가 나온다. 주소가 다르다  request객체공유한다.
response.sendRedirect 주소창에 마지막 페이지가 나온당. 주소가 같당 request객체공유안한다. 

-->
<%-- <jsp:forward page="Ex01_result.jsp"/> --%>
<jsp:forward page="Ex01_result.jsp">
	<jsp:param value="제주" name="addr" />
</jsp:forward>
