<%@page import="my.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function insert(){
		location.href = "insertForm.jsp";
	}
	
	function allDelete(obj){
		//alert(obj.checked);
		
		var chkobj = document.getElementsByName("rowcheck");
		
		if(obj.checked){ // 
			for(var i=0;i<chkobj.length;i++){
				chkobj[i].checked = true;
			}
		}else{ //  
			for(var i=0;i<chkobj.length;i++){
				chkobj[i].checked = false;
			}
		}
	}//
	
	function selectDelete(){
		
		var chkobj = document.getElementsByName("rowcheck");
		var flag = false;
		for(var i=0;i<chkobj.length;i++){
			if(chkobj[i].checked){
				flag = true;
			}
		}
		
		if(!flag){
			alert("삭제할 번호를 체크하세요");
			return; // 
		}
		
		document.myform.submit();
	}
</script>    
select.jsp<br><br>
<jsp:useBean id="dao" class="my.BookDao"/>

<%
	ArrayList<BookBean> lists = dao.getAllBooks();
%>
<form action="deleteAll.jsp" name="myform"> 
	<input type="button" value="삭제" onclick="selectDelete();">
	<input type="button" value="추가" onclick="insert();">
<table border="1" align="center" width="800">
	
	<tr align="center">
		<td><input type="checkbox" name="allcheck"	onclick="allDelete(this);"></td>
		<td>번호</td>
		<td>제목</td>
		<td>저자</td>
		<td>출판사</td>
		<td>가격</td>
		<td>입고일</td>
		<td>배송비</td>
		<td>구입 가능 서점</td>
		<td>보유수량</td>
		<td>수정</td>
		<td>삭제</td>
	</tr>
	<%
		for(BookBean bean : lists){
	%>
			<tr>
				<td><input type="checkbox" name="rowcheck" value="<%=bean.getNo()%>"></td>
				<td><%=bean.getNo() %></td>
				<td><%=bean.getTitle() %></td>
				<td><%=bean.getAuthor() %></td>
				<td><%=bean.getPublisher() %></td>
				<td><%=bean.getPrice() %></td>
				<td><%=bean.getBuy() %></td>
				<td><%=bean.getKind() %></td>  
				<td><%=bean.getBookstore() %></td>   
				<td><%=bean.getCount() %></td>
				<td><a href="updateForm.jsp?no=<%=bean.getNo() %>">수정</a></td>
				<td><a href="deleteProc.jsp?no=<%=bean.getNo() %>">삭제</a></td>
	<%		
		}
	%>
	
</table>

</form>






