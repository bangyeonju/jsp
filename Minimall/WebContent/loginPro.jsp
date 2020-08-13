<%@page import="my.member.MemberDAO"%>
<%@page import="my.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8"); %>
loginPro.jsp<br><br>
<%
String id = request.getParameter("id");
String password=request.getParameter("password");
MemberDAO mdao = MemberDAO.getInstance();
MemberDTO mdto =mdao.getMemberInfo(id,password);
String msg="", url="";
if(mdto!=null) {
	msg="가입한 회원";
	String _id = mdto.getId();
	if(_id.equals("admin")){//관리자
		//방법1 url=request.getContextPath()+"/myshop/admin/main.jsp";
		url="myshop/admin/main.jsp";

		
		
	}else{//일반사용자
	//방법2 url=request.getContextPath()+"/myshop/display/mall.jsp";
		url="myshop/display/mall.jsp";
	
	}
} else {
	msg="가입하지 않은 회원";
}

%>
<script type="text/javascript">
alert("<%=msg%>"+"입니다");
location.href="<%=url%>";
</script>