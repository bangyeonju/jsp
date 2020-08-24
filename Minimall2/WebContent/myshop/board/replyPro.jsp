<%@page import="board.BoardDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
replyForm.jsp => replyPro.jsp<br><br>
<%
	request.setCharacterEncoding("UTF-8");
	//String writer = request.getParameter("writer");
%>
<jsp:useBean id="article" class="board.BoardBean"/>
<jsp:setProperty property="*" name="article"/>

<%
	article.setReg_date( new Timestamp(System.currentTimeMillis()) );
	
	article.setIp(request.getRemoteAddr());
	
	BoardDao dao = BoardDao.getInstance();
	int cnt = dao.replyArticle(article);  
	if(cnt>0){
		response.sendRedirect("list.jsp");
	} else{
		response.sendRedirect("replyForm.jsp");
	}
%>



