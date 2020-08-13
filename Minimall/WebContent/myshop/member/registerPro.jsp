<%@page import="my.member.MemberDTO"%>
<%@page import="my.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    %>
myshop/member/registerPro.jsp<br><br>
<jsp:useBean id="mdto" class="my.member.MemberDTO"/>
<jsp:setProperty property="*" name="mdto"/>
<%
MemberDAO mdao = MemberDAO.getInstance();//객체생성
int cnt = mdao.insertData(mdto);
String msg="";
String url="";
if(cnt >0){
	msg="가입성공";
	url=request.getContextPath()+"/main.jsp";
}else{
	msg="가입실패";
	//url=request.getContextPath()+"/myshop/member/register.jsp";
	url="register.jsp";
	
}
System.out.print(msg);
%>
<script type="text/javascript">
alert("<%=msg%>"+ "했습니다.");
location.href="<%=url%>";
</script>