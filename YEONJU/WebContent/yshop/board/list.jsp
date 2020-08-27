<%@page import="java.text.SimpleDateFormat"%>
<%@page import="yj.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="yj.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%

	
	int pageSize =10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null){
		pageNum="1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize +1;
	int endRow = currentPage * pageSize;
	int count=0;
	int number =0;
	
	ArrayList<BoardBean> alist=null;
	BoardDao bdao = BoardDao.getInstance();
	count = bdao.getListCount(); // 전체 레코드 갯수 리턴 
	if(count >0){
		alist = bdao.getArticles(startRow,endRow);
	}
	

%>    

<body>

<form action="boardWrite.jsp" method="post">

	<table width="600" align="center" border="1">
	<tr>
	<td colspan="4" align="center"><b>글목록(전체 글 : <%= count%>)</b> </td>	
	<td><a href="boardWrite.jsp">글쓰기</a></td>
	</tr>
		<tr>
			<th>번호</th>
			<th>글쓴이</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조회</th>
			
		</tr>
		<% 
		if(count==0){
			%>
			<table width="600"  border="1" align="center">
		<tr height="30">
			<td>게시판에 저장된 글이 없습니다.</td>
		</tr>
	</table>
			<%
		}else{
		
		for (BoardBean bb : alist){ %>
			<tr >
			<td width="15%"><%=number--%></td>
			<td width="20%" align="center"><%=bb.getWriter()%></td>
			<td width="30%" align="center"><a href="content.jsp?num=<%=bb.getNum()%>&pageNum=<%=currentPage%>"><%=bb.getSubject()%></a></td>
			<td width="20%" align="center"><%=bb.getReg_date()%></td>
			<td width="15%"><%=bb.getReadcount()%></td>
			</tr>
			<%
			
		}
		%>
		
	
	</table>
	<%
		}
	%>
</form>
</body>