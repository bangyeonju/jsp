<%@page import="my.shop.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
BoardDao dao = BoardDao.getInstance(); // 객체생성
int num= Integer.parseInt(request.getParameter("num"));
String passwd =request.getParameter("passwd");
System.out.print("!"+num+passwd);
int cnt = dao.deleteArticle(num,passwd);
int pageNum= Integer.parseInt(request.getParameter("pageNum"));

if(cnt>0){
	int count = dao.getArticleCount();//레코드 개수를 가져옴
	int pageSize=10;
	int pageCount = count/pageSize+(count % pageSize==0 ? 0 : 1);
	if(pageNum > pageCount){  //pageNum : 현재내가 보고있는 페이지 pageCount 페이지개수 
		response.sendRedirect("list.jsp?pageNum="+(pageNum-1));
				
	} else {
		response.sendRedirect("list.jsp?pageNum="+pageNum);
		
	}
	
}else{
%>
	<script type="text/javascript">
	alert("비번이 맞지않습니다.");
	history.go(-1);
	</script>
<%
//	location.href="deleteForm.jsp?num==num";
}
%>