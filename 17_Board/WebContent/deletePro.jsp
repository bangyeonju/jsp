<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
BoardDao dao = BoardDao.getInstance();
int num= Integer.parseInt(request.getParameter("num"));
String passwd =request.getParameter("passwd");
System.out.print("!"+num+passwd);
int cnt = dao.deleteArticle(num,passwd);

if(cnt>0){
	response.sendRedirect("list.jsp");
}else{
%>
	<script type="text/javascript">
	alert("비번이 맞지않습니다.");
	history.go(-1);
	</script>
<%
//	location.href="deleteForm.jsp?num==num";
}
%>