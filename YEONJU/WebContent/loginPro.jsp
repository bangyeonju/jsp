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
	
	String _id =mb.getId();
	int _no = mb.getNo();
	if(_id.equals("admin")){
		url=request.getContextPath()+"/yshop/admin/kind_list.jsp";
		System.out.print("1");
		msg="로그인 성공";
	} else {
		url=request.getContextPath()+"/yshop/display/main.jsp";
		msg="로그인 성공";
	}

	session.setAttribute("memid",_id);
	session.setAttribute("memno",_no);
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
