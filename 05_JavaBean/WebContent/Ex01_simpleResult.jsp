<%@page import="myPkg.SimpleBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String message= request.getParameter("message");
	out.print("넘어온 데이터:"+message+"<br>");
%>

<%
	SimpleBean sb = new SimpleBean();
	sb.setMsg(message);
	out.print("message1:"+sb.getMsg()+"<br>");
%>

message2:<%=sb.getMsg()%><br><br><br>

<!-- myPkg.SimpleBean sb2= new myPkg.SimpleBean  -->
<jsp:useBean id="sb2" class="myPkg.SimpleBean"/>
<% 
	sb2.setMsg(message);
	out.print("sb2.getMsg()"+sb2.getMsg()+"<br>");
%>

<!-- myPkg.SimpleBean sb3= new myPkg.SimpleBean  -->
<jsp:useBean id="sb3" class="myPkg.SimpleBean"/>
<jsp:setProperty property="msg" name="sb3" param="message" />
<!-- ==>sb3.setMsg(message)로 호출 -->
<%
	out.print("sb3.getMsg():" +sb3.getMsg()+"<br>");
%>

sb.3getMsg():<jsp:getProperty property="msg" name="sb3"/>
<!--sb3.getMsg()  -->






