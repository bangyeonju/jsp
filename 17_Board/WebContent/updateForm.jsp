<%@page import="board.BoardDao"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jsp" %>
<!-- <link href="style.css" rel="stylesheet" type="text/css">    -->
updateForm.jsp<br>

<style type="text/css">
   table{
      margin: 0 auto;
   }
   body{
   width: 100%;
   text-align: center;
   }
   

</style>
<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript" src="script.js"> /* 유효성검사 */

</script>
<%
	//dao객체 얻어오기
	BoardDao dao = BoardDao.getInstance();
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	int num = Integer.parseInt(request.getParameter("num"));
	BoardBean article=dao.updateGetArticle(num);
	
%>
<b>글수정하기</b>
<body bgcolor="<%=bodyback_c%>">
<form method="post" name="writeform" action="updatePro.jsp?pageNum=<%=pageNum%>" onsubmit="return writeSave()"> <!-- form 에서 쓸데는 onsubmit="return writeSave()"  -->
   <table border=1 width="450" align="center" cellspacing="0">
      <tr>
         <td colspan="2" align="right" bgcolor="<%=value_c%>"><a href="list.jsp">글목록</a></td>
      </tr>
      <tr>
         <td width="100" align="center" bgcolor="<%=value_c%>">이름</td>
         <td width="350"><input type="text" name="writer" value="<%=article.getWriter()%>">
         <input type="hidden" name="num" value="<%=article.getNum() %>">
      <%--    <input type="hidden" name="pageNum" value="<%=article.getpageNum() %>"> --%>
         </td>
      </tr>
      <tr>
         <td width="100" align="center" bgcolor="<%=value_c%>">제 목</td>
         <td width="350" align="left"><input type="text" name="subject" size="50" maxlength="50" value="<%=article.getSubject()%>"></td>
      </tr>
      <tr>
         <td width="100" align="center" bgcolor="<%=value_c%>">Email</td>
         <td width="350"><input type="text" size="50" maxlength="30" name="email" value="<%=article.getEmail()%>"></td>
      </tr>
      <tr>
         <td width="100" align="center" bgcolor="<%=value_c%>">내용</td>
         <td width="350"><textarea name="content" cols="50" rows="13" id="abc"><%=article.getContent() %></textarea></td>
      </tr>
      <tr>
         <td width="100" align="center" bgcolor="<%=value_c%>">비밀번호</td>
         <td width="350"><input type="password" size="10" maxlength="12" name="passwd" value=""></td>
      </tr>
      <tr>
         <td colspan="2" align="center" height="30" bgcolor="<%=value_c%>">
            <input type="submit" value="글쓰기"><!--onClick="return writeSave()"  -->
            <input type="reset" value="다시작성">
            <input type="button" value="목록보기" onClick="location='list.jsp'">
         </td>
      </tr>
      
   
   </table>
</form>
</body>