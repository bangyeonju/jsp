<%@page import="board.BoardDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
replyPro.jsp<br><br>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="article" class="board.BoardBean" />
<jsp:setProperty property="*" name="article" />
replyPro.jsp
<br>
<br>
<%
	System.out.println("*"+article.getWriter());
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	//request.getRemoteAddr();
	article.setIp(request.getRemoteAddr());//문자열로 "127.0.0.1"
	BoardDao dao = BoardDao.getInstance();
	int cnt = dao.replyArticle(article);
	
	if(cnt>0){
		response.sendRedirect("list.jsp");
	} else{
		response.sendRedirect("writeForm.jsp");
	}
%>