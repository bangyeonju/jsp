<%@page import="my.shop.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8"); %>
updateForm.jsp->updatePro.jsp<br><br>
updateForm에서 넘겨온것을 bean으로 만들기
<jsp:useBean id="bean" class="my.shop.board.BoardBean" />
<jsp:setProperty property="*" name="bean"/>
<%

BoardDao dao = BoardDao.getInstance();
int cnt = dao.updateArticle(bean);// 요기 bean에는 처음에 글을 작성할때 내가 입력한 비번이 들어가있다.
int pageNum = Integer.parseInt(request.getParameter("pageNum"));
//성공 list.jsp
//실패 updateForm.jsp ==> 비번이 다를 경우(내가 입력한 비번 != n번의 비번)

if(cnt>0){
	response.sendRedirect("list.jsp?pageNum="+pageNum);
} else{
	%>
	<script type="text/javascript">
	alert("비밀번호가 맞지않습니다.");
	history.back();
	</script>
	<%
}

%>