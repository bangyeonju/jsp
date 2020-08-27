<%@page import="yj.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="yj.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name= request.getParameter("name");
	String email= request.getParameter("email"); 
	
	
	MemberDao mdao = MemberDao.getInstance();
	MemberBean mb = mdao.searchId(name,email);
	String msg="",url="";
	
	System.out.print(mb.getId());
	if(mb !=null){
		msg = mb.getId();
	} else {
		msg ="없는 회원";
	}
	url="main.jsp";
%>
<script type="text/javascript">
	alert("<%=msg%>"+"입니다.");
	location.href="<%=url%>";
</script>