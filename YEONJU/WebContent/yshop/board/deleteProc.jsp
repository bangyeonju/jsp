<%@page import="yj.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int num = Integer.parseInt(request.getParameter("num"));
	String passwd = request.getParameter("passwd"); 
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	BoardDao bdao = BoardDao.getInstance();
	int cnt = bdao.deletedate(num,passwd);

	if(cnt>0){
		int count =bdao.getListCount();
		int pageSize=10;
		int pageCount =count/pageSize + (count % pageSize==0 ? 0 : 1);
		if(pageNum > pageCount){
			response.sendRedirect("list.jsp?pageNum="+(pageNum-1));
		}else{
			response.sendRedirect("list.jsp?pageNum="+pageNum);
		}
		
	}

	%>
	<script type="text/javascript">
		alert("비번이 맞지 않습니다.");
		history.go(-1);
	</script>