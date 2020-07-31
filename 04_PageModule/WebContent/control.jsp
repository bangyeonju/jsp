
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String product = request.getParameter("product");
	String control=null; 
	String name=null;
	
	if(product.equals("1")){
		control="tv";
		name="텔레비젼";
		
	}else if(product.equals("2")){
		control="dc";
		name="디지털카메라";
		
	}else if(product.equals("3")){
		control="mp";
		name="MP3플레이어";
	}
%>
<jsp:forward page="template.jsp">
	<jsp:param value="<%=control %>" name="paramControl"/>
	<jsp:param value="<%=name %>" name="paramName"/>
</jsp:forward>