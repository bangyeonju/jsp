<%@page import="DTO.MovieBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="DTO.MovieDao" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	ArrayList<MovieBean> al = dao.selectAll();
%>
<script type="text/javascript">
	function insert() {
		location.href = "insertForm.jsp";
	}
	function selectAll(obj) {
		//alert(1);
		var chkobj = document.getElementsByName("row");
		if (obj.checked) {
			for (var i = 0; chkobj.length; i++) {
				chkobj[i].checked = true;
			}
		} else
			for (var i = 0; chkobj.length; i++) {
				chkobj[i].checked = false;
			}

	}
	function selectDelete() {
		var chkobj = document.getElementsByName("row");
		flag = false;
		for (var i = 0; i < chkobj.length; i++) {
			if (chkobj[i].checked) {
				flag = true;
			}

		}
		if (!flag) {
			alert("삭제할번호를 체크해주세요");
			return;
		}
		document.myform.submit();

	}
</script>
<form action="deleteAll.jsp" name="myform">
	<input type="button" value="추가" onClick="insert()"> <input
		type="button" value="삭제" onClick="selectDelete()">
	<table border="1">
		<tr>
			<th><input type="checkbox" name="checkAll"
				onClick="selectAll(this)"></th>
			<th>번호</th>
			<th>이름</th>
			<th>나이</th>
			<th>좋아하는 장르</th>
			<th>즐겨보는 시간대</th>
			<th>동반관객수</th>
			<th>영화관 개선사항</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%
			for (MovieBean mb : al) {
		%>
		<tr>
			<td><input type="checkbox" name="row" onClick="selectcheck()" value="<%=mb.getNum()%>"></td>
			<td><%=mb.getNum()%></td>
			<td><%=mb.getName()%></td>
			<td><%=mb.getAge()%></td>
			<td><%=mb.getGenre()%></td>
			<td><%=mb.getTime()%></td>
			<td><%=mb.getPartner()%></td>
			<td><%=mb.getMemo()%></td>
			<td><a href="updateForm.jsp?num=<%=mb.getNum() %>">수정</a></td>
			<td><a href="deleteProc.jsp?num=<%=mb.getNum()%>">삭제</a></td>
		</tr>
		<%} %>

	</table>
</form>