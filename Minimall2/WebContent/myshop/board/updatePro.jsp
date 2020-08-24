<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updatePro.jsp<br><br>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- updateForm에서 넘어온것을 bean으로 만들기 -->
<jsp:useBean id="article" class="board.BoardBean"/>
<jsp:setProperty name="article" property="*"/>

<%
	String pageNum = request.getParameter("pageNum");

	BoardDao dao = BoardDao.getInstance(); 
	int cnt = dao.updateArticle(article);
	
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





