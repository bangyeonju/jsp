<%@page import="Book.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
  select.jsp
 <jsp:useBean id="dao" class="Book.BookDao"/>
<% ArrayList<BookBean> bean = dao.getAllBooks(); %>
<script type="text/javascript">
function insert(){
	location.href = "insertForm.jsp"
}
function selectDelete(){
	var chkobj=document.getElementsByName("row");
	var flag= false;
	for(var i=0;i<chkobj.length;i++){
		if(chkobj[i].checked){
			flag = true;
		}
	}
	if(!flag){
		alert("삭제할번호를 체크하세요");
		return;
	}
	document.myform.submit();	
}
function allDelete(obj){
	alert(obj.checked)
	var chkobj= document.getElementsByName("row");
	if(obj.checked){
		for(var i=0;i<chkobj.length;i++){
			chkobj[i].checked =true;
		}
	}
	else
	{
		for(var i=0;i<chkobj.length;i++){
			chkobj[i].checked =false;
		}
}
}
</script>
<form  action="deleteAll.jsp" name="myform">
<input type="button" value="삭제" onClick="selectDelete()"/>
<input type="button" value="추가" onClick="insert()">
<table border="1">
<tr>
	<th><input type="checkbox" name="allcheck" onClick="allDelete(this);"></th>
	<th>번호</th>
	<th>제목</th>
	<th>저자</th>
	<th>출판사</th>
	<th>가격</th>
	<th>입고일</th>
	<th>배송비</th>
	<th>구입가능서점</th>
	<th>보유수량</th>
	<th>수정</th>
	<th>삭제</th>
</tr>
<%
for(BookBean bb : bean){
%>
<tr>
<td><input type="checkbox" name="row"></td>
<td><%=bb.getNum() %></td>
<td><%=bb.getTitle() %></td>
<td><%=bb.getAuthor() %></td>
<td><%=bb.getPublisher() %></td>
<td><%=bb.getPrice()%></td>
<td><%=bb.getBuy() %></td>
<td><%=bb.getKind()%></td>
<td><%=bb.getBookstore() %></td>
<td><%=bb.getCount() %></td>
<td><a href="updateForm.jsp?num=<%=bb.getNum() %>">수정</a></td>
<td><a href="deleteProc.jsp?num=<%=bb.getNum()%>">삭제</a></td>
</tr>
<% 
}
%>
</table> 
</form>