<%@page import="emart.EmartBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function insert(){
		location.href="insertForm.jsp";
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
	}
	
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

<jsp:useBean id="dao" class="emart.EmartDao"/>
<%
	ArrayList<EmartBean> lists = dao.getAllEmart();
%>
<form name="myform" action="deleteAll.jsp">
	<input type="button" value="삭제" onClick="selectDelete()">
	<input type="button" value="추가" onClick="insert()"> <br><br>
	
<table border="1">
	<tr>  
		<td><input type="checkbox" name="allcheck"	onclick="allDelete(this)"></td>
		<th>번호</th> 
		<th>아이디</th>
		<th>비번</th>
		<th>상품</th>
		<th>시간대</th>
		<th>결재</th>
		<th>동의</th> 
		<th>수정</th>
		<th>삭제</th> 
	</tr>

<%
	for( EmartBean bean : lists){
%>		
		<tr>
			<td><input type="checkbox" name="rowcheck" value="<%=bean.getNum() %>"></td>
			<td><%=bean.getNum() %></td>
			<td><%=bean.getId() %></td>
			<td><%=bean.getPw() %></td>
			<td><%=bean.getProduct() %></td>
			<td><%=bean.getTime() %></td>
			<td><%=bean.getApprove() %></td>
			<td><%=bean.getAgree() %></td>
			<td><a href="updateForm.jsp?num=<%=bean.getNum() %>">수정</a></td>
			<td><a href="deleteProc.jsp?num=<%=bean.getNum() %>">삭제</a></td>		
		</tr>	
<%		
	}
%>
</table>
</form>






