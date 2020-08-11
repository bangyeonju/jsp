<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="color.jsp"%>
<!--  //include 복사하는거여서 include 지시어 사용 -->
<style type="text/css">
body {
	width: 100%;
	text-align: center;
}

table {
	margin: 0 auto;
}
</style>
list.jsp
<br>
<%
	int pageSize = 10;//한페이지에 레코드를 10개보이게하겠따.by설아
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); //날짜형식지정

	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);//지금보고있는페이지
	int startRow = (currentPage - 1) * pageSize + 1;//내가 클릭한 페이지에 몇번부터 몇번까지 나오게할까????11
	int endRow = currentPage * pageSize;//20
	int count = 0;
	int number = 0;

	ArrayList<BoardBean> lists = null;

	BoardDao dao = BoardDao.getInstance(); // 객체생성
	count = dao.getArticleCount();//레코드 개수를 가져옴

	System.out.print("count " + count);
	// System.out.println("BoardDao"+dao);
	if (count > 0) {
		lists = dao.getArticles(startRow, endRow);//11~20
	}
	number = count - (currentPage - 1) * pageSize;
%>
<body bgcolor="<%=bodyback_c%>">
	<b>글목록(전체글: <%=count%>)
	</b>
	<table width="700" border="1">
		<tr>
			<td align="right" bgcolor="<%=value_c%>"><a href="writeForm.jsp">글쓰기</a>
			</td>
		</tr>
	</table>

	<%
		if (count == 0) {
	%>
	<table>
		<tr>
			<td>게시판에 저장된글이 없습니다.<br>
			</td>
		</tr>
	</table>
	<%
		} else {
	%>
	<table width="700" align="center" border="1">
		<tr bgcolor="<%=value_c%>">
			<td align="center" width="50">번호</td>
			<td align="center" width="250">제 목</td>
			<td align="center" width="100">작성자</td>
			<td align="center" width="150">작성일</td>
			<td align="center" width="50">조회</td>
			<td align="center" width="100">IP</td>
		</tr>
		<%
			//for(BoardBean article : lists)
				for (int i = 0; i < lists.size(); i++) {
					BoardBean article = lists.get(i);
		%>

		<tr>
			<td align="center"><%=number--%></td>
			<td align="left">
			<%
				int wid=0;
			
				if(article.getRe_level()>0){//답글
					wid=article.getRe_level() *20;
					%>
					<img src="images/level.gif" width="<%=wid%>" height="16">
					<img src="images/re.gif">
					<% 
				} else{ //원글
					%>
					<img src="images/level.gif" width="<%=wid%>" height="16">
					<%
				}
				
			%>
			<a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage %>"><%=article.getSubject()%></a>
			<% 
			if(article.getReadcount() >10){
				%>
				<img src="images/hot.gif">
				<% 
			}
			%>
			</td>
			<td align="center"><%=article.getWriter()%></td>
			<td align="center"><%=article.getReg_date()%></td>
			<td align="center"><%=article.getReadcount()%></td>
			<td align="center"><%=article.getIp()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		}
	%>
	<%
		if (count > 0) {
			//pageCount는 ? count=총레코드수
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 10; //10페이지가 보이게 할거당
			
			int startPage = ((currentPage - 1) / pageBlock * pageBlock) + 1;
			
			int endPage = startPage + pageBlock - 1;
			
			if (endPage > pageCount)
				endPage = pageCount;
			if(startPage>10){
				%>
				<a href="list.jsp?pageNum=<%=startPage-10 %>">[이전]</a>
				<%
			}
			for(int i=startPage;i<=endPage;i++){
				%>
				<a href="list.jsp?pageNum=<%=i %>">[<%=i %>]</a>
				<%
			}
			if(endPage < pageCount){
				%>
				<a href="list.jsp?pageNum=<%=startPage+10 %>">[다음]</a>
				<%
			}
		}
	%>
</body>









<!-- insert할때 - ip주소 4자리로 삽입하기

Servers-Tomcat v.90-마우스오른쪽-stop선택
[Run]-[Run Configurations]-[Apahce Tomcat]-[아래화살표 ]-[Tomcat v9.0 Server at]
-[Argument]-[VM Arguments 마지막줄에 추가입력]:  Djava.net.preferIPv4Stack=true
-[apply]-[run] -->




<!-- re_level:답글 -->



