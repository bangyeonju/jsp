<%@page import="java.text.SimpleDateFormat"%>
<%@page import="yj.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="yj.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	  <%@include file="../display/top.jsp"%>
<style type="text/css">
body {
    width: 100%;
    text-align : center;
}
.a{
 	margin-top:50;
}
</style>   

<%
	int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);

	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;

	ArrayList<BoardBean> alist = null;
	BoardDao bdao = BoardDao.getInstance();
	count = bdao.getListCount(); // 전체 레코드 갯수 리턴 
	if (count > 0) {
		alist = bdao.getArticles(startRow, endRow);
	}

	number = count - (currentPage - 1) * pageSize;
%>

<body>

<table width="600"  border="1" align="center" class="a">
	<tr height="30">
	<td align="center">
		<b>글목록(전체 글 : <%= count%>)</b>
	</td>
		<td align="right">
			<a href="boardWrite.jsp">글쓰기</a>
		</td>
	</tr>
</table>

<%
	if(count == 0){
%>
	<table width="600"  border="1" align="center" cellspacing= "0" cellpadding="10">
		<tr height="30">
			<td>게시판에 저장된 글이 없습니다.</td>
		</tr>
	</table>
<%		
	} else {
		   
%>
	<table width="600" align="center" border="1">
		<tr height="30">
			<td align="center" width="50">번호</td>
			<td align="center" width="250">제 목</td>
			<td align="center" width="100">작성자</td>
			<td align="center" width="150">작성일</td>
			<td align="center" width="50">조회</td>
		</tr>
<%
		//for(BoardBean article : lists){
		for(int i=0;i<alist.size();i++){
			BoardBean bb = alist.get(i);
%>
			<tr height="30">
				<td align="center"><%=number-- %></td>
				<td align="left"> 
				<%
					int wid = 0;
					if(bb.getRe_level() > 0){ // 답글
						wid = bb.getRe_level() * 20; // 답글:20, 답글의답글:40
					
				%>
						<img src="images/level.gif" width="<%=wid %>" height="16">
						<img src="images/re.gif">
				<%
					}
					else{ // 원글
				%>
						<img src="images/level.gif" width="<%=wid %>" height="16">
				<%
					}
				%>
					<a href="content.jsp?num=<%=bb.getNum() %>&pageNum=<%=currentPage%>"><%=bb.getSubject() %></a>
					<%
						if(bb.getReadcount() >= 10){ 
					%>
						<img src="images/hot.gif">
					<%
						}
					%>
				</td>
				<td align="center"> <%=bb.getWriter() %></td>
				<td align="center"> <%=sdf.format(bb.getReg_date()) %></td>
				<td align="center"> <%=bb.getReadcount() %></td>
			</tr>
<%			  
		} // for
%>
	
	</table>
<%		
	} // else
%>

<%
	if(count > 0){
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		
		int pageBlock = 10;
		
		int startPage = ((currentPage - 1) / pageBlock * pageBlock) +1 ;
		int endPage = startPage + pageBlock - 1;
		
		if(endPage > pageCount)
			endPage = pageCount;
		
		if(startPage > 10){
%>
			<a href="list.jsp?pageNum=<%=startPage-10 %>">[이전]</a>
<%			
		}
		
		for(int i=startPage;i<=endPage;i++){
%>
			<a href="list.jsp?pageNum=<%=i %>">[<%=i %>]</a>
<%			
		}
		if(endPage < pageCount) {
%>
			<a href="list.jsp?pageNum=<%=startPage+10 %>">[다음]</a>
<%			
		}
	}
%>




</body>



