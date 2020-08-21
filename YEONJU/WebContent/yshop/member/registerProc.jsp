<%@page import="yj.member.MemberBean"%>
<%@page import="yj.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
 <jsp:useBean id="mb" class="yj.member.MemberBean"/>
 <jsp:setProperty property="*" name="mb"/>
<%
	MemberDao mdao = MemberDao.getInstance();
	int cnt = mdao.insertData(mb);
	String msg="",url="";
	if(cnt>0){
		msg="회원가입성공";
		url=request.getContextPath()+"/main.jsp";
		
	} else{
		msg="회원가입실패";
		url="register.jsp";
	}
	
%>

<script type="text/javascript">
	alert("<%=msg%>"+"입니다");
	location.href="<%=url%>";
</script>




