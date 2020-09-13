<%@page import="yj.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="yj.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		  <%@include file="../display/top.jsp"%>
	   <script type="text/javascript">
   function updateSave(){
	   if(document.uform.passwd.value==""){
		   //alert(1);
		   alert("비밀번호를 입력하십시오");
		    return false;
	   }
   }
   </script>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	BoardDao bdao = BoardDao.getInstance();
	BoardBean bb = bdao.selectList(num);
	
%>


<form action="updateProc.jsp?pageNum=<%=pageNum %>" name="uform"method="post" onsubmit="return updateSave()">
	<table align="center" border="1">
		<tr>
			<td>글쓴이</td>
			<td><input type="text" name="writer" value="<%=bb.getWriter()%>">
			<input type="hidden" name="num" value="<%=bb.getNum()%>">
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="subject" value="<%=bb.getSubject()%>"></td>
		</tr>

		<tr>
			<td>내용</td>
			<td><textarea rows="20" cols="30" name="content"><%=bb.getContent() %></textarea>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center"><input type="submit" value="보내기">
			</td>
		</tr>
	</table>
</form>