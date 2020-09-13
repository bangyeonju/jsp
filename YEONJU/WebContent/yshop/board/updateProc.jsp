<%@page import="yj.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bb" class="yj.board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>
<%
String pageNum = request.getParameter("pageNum");
BoardDao bdao = BoardDao.getInstance();
int cnt =bdao.updateList(bb);


	if(cnt>0){
		response.sendRedirect("list.jsp?pageNum="+pageNum);
	}
	else{
%>
	<script type="text/javascript">		
		alert("비밀번호가 맞지 않습니다.");
		history.back(); 
	</script>
<%		
	}
	
%>
