<%@page import="my.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mdto" class="my.member.MemberDTO" />
<%
MemberDAO mdao = MemberDAO.getInstance();
String name = request.getParameter("name");
String rrn1 = request.getParameter("rrn1");
String rrn2 = request.getParameter("rrn2");

mdto = mdao.getMemberByrrn(name,rrn1,rrn2);

//System.out.println(mdto.getId());
//System.out.println(mdto.getRrn1());
String msg="",url="";

if(mdto!=null) {
		msg=mdto.getId();
} else {
		msg="없는 회원";
	
}
	url="main.jsp";
%>
<script type="text/javascript">
alert("<%=msg%>"+"입니다.");
location.href="<%=url%>"
</script>