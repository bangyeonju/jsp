<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
Ex02_via.jsp
<%
	request.setCharacterEncoding("UTF-8"); //중간에 거쳐가는 via.jsp에서 한글처리를해야한다.
	String name = request.getParameter("name");
	String code= request.getParameter("code");
	
	out.print(name+","+code);
	System.out.println(name+","+code);
%>
<jsp:forward page="<%=\"Ex02_\"+code+\".jsp\"%>"/>
<%-- 
	 <jsp:param value="<%=name %>" name="name"/> 
		굳이 넘기지 않아도 request객체를 공유하므로 쓰지 않아도 된다.
</jsp:forward>

	--%>

	
