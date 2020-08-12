<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="board.BoardDao"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="color.jsp"%>

content.jsp
<br>
<br>
<br>

<style type="text/css">
body {
	width: 100%;
	text-align: center;
}

table {
	margin: 0 auto;
	width: 50%;
}
</style>

<% request.setCharacterEncoding("UTF-8");%>
content.jsp
<%
	BoardDao dao = BoardDao.getInstance();
	int num = Integer.parseInt(request.getParameter("num"));
	int pn = Integer.parseInt(request.getParameter("pageNum"));
	BoardBean article=dao.getArticle(num);
	//System.out.println(article.getNum());
	//날짜를 포맷형식으로 나오게 표현해보세용
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	System.out.println("num:"+article.getNum());
	System.out.println("ref:"+article.getRef());
	System.out.println("re_step:"+article.getRe_step());
	System.out.println("re_level:"+article.getRe_level());
	
	int ref = article.getRef();
	int re_step= article.getRe_step();
	int re_level = article.getRe_level();
%>
<table border="1">
	<tr>
		<td>글번호</td>
		<td><%=article.getNum() %>
		<td>조회수</td>
		<td><%=article.getReadcount() %></td>
	</tr>
	<tr>
		<td>작성자</td>

		<td><%=article.getWriter() %></td>
		<td>작성일</td>
		<td><%=sdf.format(article.getReg_date()) %></td>
	</tr>
	<tr>
		<td>글제목</td>
		<td colspan="3"><%=article.getSubject() %></td>
	</tr>
	<tr>
		<td>글내용</td>
		<td colspan="3"><%=article.getContent()%></td>
	</tr>
	<tr>
		<td colspan="4" width="125" align="right" bgcolor="<%=value_c %>"
			height="40">
			<input type="button" value="글수정" onClick="location='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pn%>'"> &nbsp;
			<input type="button" value="글삭제" onClick="location='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pn%>'"> &nbsp; 
			<input type="button"value="답글쓰기" onClick="location='replyForm.jsp?ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'"> &nbsp; 
			<input type="button" value="글목록" onClick="location='list.jsp?pageNum=<%=pn%>'">&nbsp;
			</td>
	</tr>


</table>
