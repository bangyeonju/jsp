<%@page import="myPkg.MemberDao"%>
<%@page import="myPkg.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
insertProc.jsp<br><br>

<%
	request.setCharacterEncoding("UTF-8");
/* 
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	
	MemberBean mb = new MemberBean(); 
	mb.setId(id);
	mb.setPasswd(passwd);
	mb.setName(name);
 */	
 %>
 <!-- dao 매개변수없는생성자가 있어야한다.  -->
 <jsp:useBean id="mb" class="myPkg.MemberBean"/>
 <jsp:useBean id="dao" class="myPkg.MemberDao"/>
 <%--
 <jsp:setProperty name="mb" property="id"/>
 <jsp:setProperty name="mb" property="passwd"/>
 <jsp:setProperty name="mb" property="name"/> 
 --%>
 <!-- form에서 넘어온  항목과 일치하는 setter만 호출된다. -->
 <jsp:setProperty name="mb" property="*"/>
 
 <%
	//MemberDao dao = new MemberDao(); 
	int cnt = dao.insertData(mb);
	if(cnt == 1){
		response.sendRedirect("select.jsp");
	}
	else{
		response.sendRedirect("insertForm.jsp");
	}
	
%>





