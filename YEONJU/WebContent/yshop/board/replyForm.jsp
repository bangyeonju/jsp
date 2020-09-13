<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	  <%@include file="../display/top.jsp"%>

<%

int ref = Integer.parseInt(request.getParameter("ref"));
int re_step = Integer.parseInt(request.getParameter("re_step"));
int re_level = Integer.parseInt(request.getParameter("re_level"));
%>


<body >
<form method="post" name="writeform" action="replyPro.jsp"  onsubmit="return writeSave()">
	
	<input type="hidden" name="ref" value="<%=ref%>"> 
	<input type="hidden" name="re_step" value="<%=re_step%>"> 
	<input type="hidden" name="re_level" value="<%=re_level%>"> 	
	
	<table border="1" width="450" align="center"cellspacing= "0" cellpadding="10">
		
		<tr>
			<td align="right" colspan="2">
				
				<a href="list.jsp">글목록</a>
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center" >이름</td>
			<td><input type="text" size="30" maxlength="10"	
					name="writer" value="홍길동">
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center" >제 목</td>
			<td width="350" align="left">					
				<input type="text" size="50" maxlength="50" 
					name="subject"	value="[답글]">
			</td>
		</tr>
			
			      	
		<tr>
			<td width="100"  align="center">내 용</td>
			<td width="350">
				<textarea name="content" id="abc" rows="13" cols="50">호호호</textarea>
				
			</td>
		</tr>
		
		<tr>
			<td width="100"  align="center">비밀번호</td>
			<td width="350">
				<input type="password" size="10" maxlength="12"	
					name="passwd" value="1234">
			</td>
		</tr>
		<tr>
			<td colspan=2  align="center" height="30">
				<input type="submit" value="글쓰기">  
				<input type="reset"	value="다시작성"> 
				<input type="button" value="목록보기" onClick="location.href='list.jsp'">
			</td>
		</tr>
	</table>
</form>
</body>
