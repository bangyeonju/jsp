<%@page import="myPkg.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm.jsp<br><br>
<jsp:useBean id="dao" class="myPkg.MemberDao"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	System.out.println("updateForm.jsp num:" + num); 
	out.print("넘어온 num:" + num);
	MemberBean mb = dao.getMemberByNum(num);
	
%>

<h2>회원수정 form</h2>
<form action="updateProc.jsp" method="post">
	
	번호 : <input type="hidden" name="num" value="<%=mb.getNum() %>"><br><br>
	아이디:<input type="text" name="id" value="<%=mb.getId() %>" disabled><br><br>
	
	비번:<input type="password" name="passwd" value="<%=mb.getPasswd() %>"><br><br>
	
	이름:<input type="text" name="name" value="<%=mb.getName() %>"><br><br>
	
	<input type="submit" value="수정하기">
	
</form>



