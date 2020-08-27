<%@page import="yj.member.MemberBean"%>
<%@page import="yj.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	
	MemberDao mdao = MemberDao.getInstance();
	MemberBean mb = mdao.searchPw(name, id, email);
	String msg="",url="";
	if(mb!=null){
		msg = mb.getPassword();
	} else{
		msg ="없는 회원";
	}

url="main.jsp";
%>
<script type="text/javascript">
	alert("<%=msg%>"+"입니다.");
	location.href="<%=url%>";
</script>