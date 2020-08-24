<%@page import="my.member.MemberDTO"%>
<%@page import="my.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
findpwdPro.jsp


<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String rrn1 = request.getParameter("rrn1");
	String rrn2 = request.getParameter("rrn2");
	//syso
	String msg="",url="";
	
	MemberDAO mdao = MemberDAO.getInstance(); 
	MemberDTO mdto = mdao.getMemberByIdAndName(id,name,rrn1,rrn2);
	 
	if(mdto != null){
		msg = mdto.getPassword();
	}else{
		msg = "없는 회원";
	}
	url = "main.jsp";
%>
<script type="text/javascript">
	alert("<%=msg%>"+"입니다.");
	location.href="<%=url%>";
</script>


