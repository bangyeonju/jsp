<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="color.jsp"%>

<script type="text/javascript">
	function deleteSave() {
		if(document.delform.passwd.value == "") {
			alert("비밀번호를 입력하십시오");
			document.delform.passwd.focus();
			return false;

		}
		
	}
</script>
deleteForm.jsp -> deleteProc
<style type="text/css">
body {
	width: 100%;
	text-align: center;
}

table {
	margin: 0 auto;
}
</style>
<body bgcolor="<%=bodyback_c%>">
	<%
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	%>
	<form method="post" name="delform" action="deletePro.jsp?pageNum=<%=pageNum %>"  onsubmit="return deleteSave()">
		<table align="center" border="1" width="450">
			<tr height="30">
				<td align="center" bgcolor="<%=value_c%>">비밀번호를 입력해 주세여</td>
			</tr>
			<tr height="30">
				<td align="center">비밀번호:<input type="password" name="passwd"
					size="15"> <input type="hidden" name="num" value="<%=num%>">
				</td>
			</tr>
			<tr height="30">
				<td align="center" bgcolor="<%=value_c%>">
					<input type="submit" value="글삭제" >
					<input type="button" value="글목록" onClick="location.href='list.jsp?pageNum=<%=pageNum%>'">
				 </td>
			</tr>
		</table>
	</form>
</body>