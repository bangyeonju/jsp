<%@page import="myPkg.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String addr = request.getParameter("addr");
	String tel = request.getParameter("tel");
 	String[] hobby = request.getParameterValues("hobby");
 	String str = "";
 			
	
	for(int i =0;i<hobby.length;i++){
		str += hobby[i] +" ";
	}
	
	out.print(name + age + addr + tel + str);
	
%>
<%
	MemberBean mb1 = new MemberBean();
	mb1.setName(name);
	mb1.setAge(age);
	mb1.setAddr(addr);
	mb1.setTel(tel);
	mb1.setHobby(str);

	out.print(mb1.getName() + mb1.getAge() + mb1.getAddr() + mb1.getTel() +mb1.getHobby());
%>
<jsp:useBean id="mb2" class="myPkg.MemberBean" />
<%
	mb2.setName(name);
	mb2.setAge(age);
	mb2.setAddr(addr);
	mb2.setTel(tel);
	mb2.setHobby(str);
	out.print(mb2.getName() + mb2.getAge() + mb2.getAddr() + mb2.getTel() +mb2.getHobby());
%>
<br>
<!-- 이거 짱편하다아아아아아아  -->
<jsp:useBean id="mb3" class="myPkg.MemberBean"/>
<%-- <jsp:setProperty property="name" name="mb3" param="name"/>
<jsp:setProperty property="age" name="mb3" param="age"/>
<jsp:setProperty property="addr" name="mb3" param="addr"/>
<jsp:setProperty property="tel" name="mb3" param="tel"/> --%>

<jsp:setProperty property="*" name="mb3"/>
<!-- 재설정해준다...? -->
<%
	mb3.setHobby(str);
%>

<%
out.print(mb3.getName() + mb3.getAge() + mb3.getAddr() + mb3.getTel() +mb3.getHobby());
%>
<jsp:useBean id="mb3" class="myPkg.MemberBean"/>

<jsp:getProperty property="name" name="mb4"/>
<jsp:getProperty property="age" name="mb4"/>
<jsp:getProperty property="addr" name="mb4"/>
<jsp:getProperty property="tel" name="mb4"/>
<jsp:getProperty property="hobby" name="mb4"/>










