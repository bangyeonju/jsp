<%@page import="javax.websocket.SendResult"%>
<%@page import="yj.member.MemberBean"%>
<%@page import="yj.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String password = request.getParameter("password");
MemberDao mdao = MemberDao.getInstance();
MemberBean mb = mdao.getMemberInfo(id,password);
String msg,url="";
if(mb!=null){ //가입된회원
	url=request.getContextPath()+"/yshop/admin/main.jsp";
	System.out.print("1");
	msg="로그인 성공";
} else {
	url="main.jsp";
	System.out.print("2");
	msg="로그인실패 ";

}
%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";

</script>
