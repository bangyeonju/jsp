<%@page import="yj.board.BoardDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bb" class="yj.board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>

<%
bb.setReg_date(new Timestamp(System.currentTimeMillis()));
BoardDao bdao = BoardDao.getInstance();
int cnt = bdao.replyboard(bb);
if(cnt>0){
	response.sendRedirect("list.jsp");
} else{
	response.sendRedirect("replyForm.jsp");
}
%>