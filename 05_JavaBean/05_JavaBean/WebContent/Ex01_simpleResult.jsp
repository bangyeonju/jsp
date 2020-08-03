<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="myPkg.SimpleBean" %>    

Ex01_simpleResult.jsp<br><br>

<%
	request.setCharacterEncoding("UTF-8");
	
	String message = request.getParameter("msg");
	
	out.print("넘어온 데이터 : " + message+"<br>");
%>

<%
	SimpleBean sb = new SimpleBean();
	sb.setMsg(message);
	out.print("message1:"+sb.getMsg()+"<br>");
%>

message2:<%=sb.getMsg() %><br><br><br>

<!-- myPkg.SimpleBean  sb2 = new myPkg.SimpleBean() -->
<jsp:useBean id="sb2"  class="myPkg.SimpleBean"/>

<%
	sb2.setMsg(message);
	out.print("sb2.getMsg():"+sb2.getMsg()+"<br>");
%>

<!-- myPkg.SimpleBean sb3 = new myPkg.SimpleBean() -->
<jsp:useBean id="sb3" class="myPkg.SimpleBean"/>
<jsp:setProperty property="msg" name="sb3" param="msg" />
<!-- sb3.setMsg(message) -->
<!-- value="하하하" -->
<%
	out.print("sb3.getMsg() : " + sb3.getMsg()+"<br>");
%>
sb3.getMsg() : <jsp:getProperty property="msg" name="sb3"/>
<!-- sb3.getMsg() -->










