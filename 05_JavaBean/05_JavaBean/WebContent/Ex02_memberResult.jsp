<%@page import="myPkg.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
Ex02_memberResult.jsp<br><br>

<%
	request.setCharacterEncoding("UTF-8");
%>

[request 이용] <br>
<%
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age")); // "30"
	String addr = request.getParameter("addr");
	String tel = request.getParameter("tel");
	
	String[] hobby = request.getParameterValues("hobby");
	String str = "";
	for(int i=0;i<hobby.length;i++){
		str += hobby[i] +" "; // 수영 영화 
	}
%>

name : <%= name %> <br>
age : <%= age %> <br>
addr : <%= addr %> <br>
tel : <%= tel %> <br>
hobby : <%= str %><br><br><br>



[자바 객체 생성]<br>

<%
	myPkg.MemberBean mb1 = new MemberBean();
	mb1.setName(request.getParameter("name"));
	mb1.setAge(Integer.parseInt(request.getParameter("age")));
	mb1.setAddr(addr);
	mb1.setTel(tel);
	mb1.setHobby(str); 
	//out.print(mb1.getName()+"<br>");
%>

name : <%= mb1.getName() %> <br>
age : <%= mb1.getAge() %> <br>
addr : <%= mb1.getAddr() %> <br>
tel : <%= mb1.getTel() %> <br>
hobby : <%= mb1.getHobby() %><br><br><br>

[JSP 객체 생성]<br>
<!-- myPkg.MemberBean mb2 = new myPkg.MemberBean() -->
<jsp:useBean id="mb2" class="myPkg.MemberBean"/>

<!-- mb2.setName(name) -->
<%-- <jsp:setProperty property="name" name="mb2" param="name"/> --%>
<%-- <jsp:setProperty property="name" name="mb2" />
<jsp:setProperty property="age" name="mb2" />
<jsp:setProperty property="addr" name="mb2"/>
<jsp:setProperty property="tel" name="mb2"/> --%>

<jsp:setProperty property="*" name="mb2"/>
<%
	mb2.setHobby(str); 
%>
<!-- mb2.getName() -->
name : <jsp:getProperty property="name" name="mb2" /> <br>
age : <jsp:getProperty property="age" name="mb2" /> <br>
addr : <jsp:getProperty property="addr" name="mb2" /> <br>
tel : <jsp:getProperty property="tel" name="mb2" /> <br>
hobby : <jsp:getProperty property="hobby" name="mb2" /> <br>


<br><br><br><br><br>




