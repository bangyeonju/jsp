<%@page import="java.sql.Timestamp"%>
<%@page import="yj.board.BoardDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bb" class="yj.board.BoardBean"/> 
<jsp:setProperty property="*" name="bb"/>
<%
BoardDao bdao =BoardDao.getInstance();
bb.setReg_date(new Timestamp(System.currentTimeMillis()));
int cnt = bdao.insertBoard(bb);
if (cnt >0){
	if(cnt>0){
		response.sendRedirect("list.jsp");
	} else{
		response.sendRedirect("boardWrite.jsp");
	}
}
%>