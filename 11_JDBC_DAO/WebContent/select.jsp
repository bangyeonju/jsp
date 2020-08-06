<%@page import="emart.EmartDao"%>
<%@page import="emart.EmartBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<script type="text/javascript">
	function insert() {
		location.href = "insertForm.jsp";//이동 
	}
	function allSelete(obj) {
		//chkobj 방4개짜리 배열이 된다.
		var chkobj = document.getElementsByName("rowcheck");
		var rowcnt = chkobj.length;
		//alert(obj.checked);
		
		//obj의 체크상태 확인
		if (obj.checked) { //allcheck 선택됬을때
			for (var i = 0; i < rowcnt; i++) {
				chkobj[i].checked = true;
			}
		} else {//allcheck가 해제됬을때
			for (var i = 0; i < rowcnt; i++) {
				chkobj[i].checked = false;
			}
		}

	}
	function selectDelete() {
		var flag = false
		var chkobj = document.getElementsByName("rowcheck");
		alert(chkobj);
		for (var i = 0; i < chkobj.length; i++) {
			if (chkobj[i].checked) {
				flag = true;
			}
		}
		if (!flag) {
			alert("삭제할 사용자 하나라고 체크하세요");
			return;
		}
		document.myform.submit();

	}
</script>
select.jsp입니다
<jsp:useBean id="dao" class="emart.EmartDao"></jsp:useBean>
<%
	ArrayList<EmartBean> lists = dao.getAllEmart();
%>
<form name="myform" action="deleteAll.jsp">
	<input type="button" value="삭제" onClick="selectDelete()"> 
	<input type="button" value="추가" onClick="insert()">
	<table border="1">
		<tr>
			<th><input type="checkbox" name="allcheck"
				onClick="allSelete(this)"></th>
			<th>번호</th>  
			<th>아이디</th>
			<th>비밀번호</th>
			<th>상품</th>
			<th>시간대</th>
			<th>결재</th>
			<th>동의</th>
			<th>수정</th>
			<th>삭제</th>


		</tr>
		<%
			for (EmartBean bean : lists) {
		%>
		<tr>
			<td><input type="checkbox" name="rowcheck"
				onClick="selectCheck()" value="<%=bean.getNo()%>"></td>
			<td><%=bean.getNo()%></td>
			<td><%=bean.getId()%></td>
			<td><%=bean.getPw()%></td>
			<td><%=bean.getProduct()%></td>
			<td><%=bean.getTime()%></td>
			<td><%=bean.getApprove()%></td>
			<td><%=bean.getAgree()%></td>
			<td><a href="updateForm.jsp?no=<%=bean.getNo()%>">수정</a></td>
			<td><a href="deleteProc.jsp?no=<%=bean.getNo()%>">삭제</a></td>

		</tr>
		<%
	}
%>
	</table>
</form>