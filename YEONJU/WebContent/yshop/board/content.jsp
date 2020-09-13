<%@page import="java.text.SimpleDateFormat"%>
<%@page import="yj.board.BoardBean"%>
<%@page import="yj.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	  <%@include file="../display/top.jsp"%>
<%
	 int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	BoardDao bdao = BoardDao.getInstance();
	BoardBean bb = bdao.getContent(num);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	int ref = bb.getRef();
	int re_step = bb.getRe_step();
	int re_level = bb.getRe_level();
	
	
%> 

<table border="1" align="center" width="500"  cellspacing= "0" cellpadding="10">
<tr height="30">
			<td align="center" width="125" >글번호</td>
		    <td align="center" width="125"> <%=bb.getNum() %></td>
		    <td align="center" width="125" >조회수</td>
		    <td align="center" width="125"> <%=bb.getReadcount() %></td>
		</tr>
		
		<tr height="30">
			<td align="center" width="125">작성자</td>
		    <td align="center" width="125"> <%=bb.getWriter() %></td>
		    <td align="center" width="125" >작성일</td>
		    <td align="center" width="125"> <%= sdf.format(bb.getReg_date()) %></td>
		</tr>
		
		<tr height="30">
		    <td align="center" width="125" >글제목</td>
		    <td align="center" width="375" colspan="3"> <%=bb.getSubject() %></td>
		</tr>
		<tr  height="30">
		    <td align="center" width="125">글내용</td>
		    <td align="left" width="375" colspan="3"><%=bb.getContent() %>  
		    </td>
		</tr>
  		
  		<tr height="30">      
    		<td colspan="4"  align="right" > 
			  <input type="button" value="글수정" onClick="location.href='updateForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
			   &nbsp;&nbsp;&nbsp;&nbsp;
			  
			  <input type="button" value="글삭제" onClick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'">
			   &nbsp;&nbsp;&nbsp;&nbsp;
		      
		      <input type="button" value="답글쓰기" onClick="location.href='replyForm.jsp?ref=<%=bb.getRef()%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
			   &nbsp;&nbsp;&nbsp;&nbsp;
      
       		  <input type="button" value="글목록" onClick="location.href='list.jsp?pageNum=<%=pageNum%>'">
   			</td>
  		</tr>
	



</table>