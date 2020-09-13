<%@page import="yj.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
   <script type="text/javascript">
   function deleteSave(){
	   if(document.dform.passwd.value==""){
		   //alert(1);
		   alert("비밀번호를 입력하십시오");
		    return false;
	   }
   }
   </script>
   
     <%
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
   %>
<form name ="dform"action="deleteProc.jsp?pageNum=<%=pageNum %>" onsubmit="return deleteSave()" method="post">
<table border="1" align="center" width="360">
<tr>
	<td align="center">	
		<b>비밀번호를 입력해주세요</b>
	</td>
</tr>
	<tr>
		<td align="center">
		비밀번호 <input type="password" name="passwd">
		<input type="hidden" name="num" value="<%=num%>">
		</td>
	</tr>
	<tr>
		<td align="center">
		<input type="submit" value="글삭제">
		<input type="button" value="글목록" onClick="location.href='list.jsp?pageNum=<%=pageNum%>'">
		</td>
	</tr>
</table>

</form>