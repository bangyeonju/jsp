
<%@page import="myPkg.EmpleBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
table {
	text-align: center;
	border: 1px solid blue;
	width: 70%;
	height: 30%;
	margin: 20px auto;
}

tr:first-child {
	background-color: yellow;
}
</style>
<script type="text/javascript">
	function allDelete(obj) {
		//alert(obj.checked);

		//obj allcheck박스
		//obj=document.getElementsByName("allcheck");
		var chkobj = document.getElementsByName("rowcheck");//name이rowcheck인것의 정보를가져와라
		var rowcnt = chkobj.length;

		if (obj.checked) { //allcheck 체크했을떄
			for (var i = 0; i < rowcnt; i++) {
				chkobj[i].checked = true;
			}
		} else { // allcheck 해제 했을떄
			for (var i = 0; i < rowcnt; i++) {
				chkobj[i].checked = false;
			}
		}
		// var chkobj = document.myform.rowcheck;
		/*
		 var chkobj= document.getElementsByName("rowcheck");
		 var rowcnt= chkobj.length;
		
		 if(obj.chekcked){
		 for(int i=0;i<rowcnt;i++){
		 chkobj[i].checked=true;
		 }
		 }else{
		 for(int i=0;i<rowcnt;i++){
		 chkobj[i].checked=false;
		 }
		 }
		
		 */

	}
	function insert() {
		location.href = "insertForm.jsp"; //location이용
	}
	//여러개 항목을 삭제시킬때!
	function selectDelete() {
		var flag = false;
		var chkobj = document.getElementsByName("rowcheck");//name이  rowcheck인것의 정보를가져와라
		alert(chkobj[0].checked);
		for (var i = 0; i < chkobj.length; i++) {

			if (chkobj[i].checked) {
				flag = true;
			}
		}
		if (!flag) {
			alert("삭제할 사용자 하나라도 체크하세요");
			return;//밑으로 내려가지 못하게!

		}
		//버튼을 눌렀지만 submit를누른것처럼  submit함수호출 !
		document.myform.submit();
	}
</script>
select.jsp

<jsp:useBean id="dao" class="myPkg.EmpleDao" />
<%
	ArrayList<EmpleBean> lists = dao.getAllEmpls();
%>
<form name="myform" action="deleteAll.jsp">
	<input type="button" value="삭제" onClick="selectDelete()"> <input
		type="button" value="추가" onClick="insert()">
	<table border="1">
		<tr>
			<td><input type="checkbox" name="allcheck"
				onClick="allDelete(this)"></td>
			<td>아이디</td>
			<td>이름</td>
			<td>부서번호</td>
			<td>급여</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		<%
			for (EmpleBean bean : lists) {
		%>
		<tr>
			<td><input type="checkbox" name="rowcheck" value="<%=bean.getMid()%>"></td>
			<td><%=bean.getMid()%></td>
			<td><%=bean.getName()%></td>
			<td><%=bean.getDid()%></td>
			<td><%=bean.getSalary()%></td>
			<td><a href="updateForm.jsp?mid=<%=bean.getMid()%>">수정</a></td>
			<td><a href="deleteProc.jsp?mid=<%=bean.getMid()%>">삭제</a></td>
		</tr>
		<%
			}
		%>
	</table>
</form>
<!-- <a href="insertForm.jsp">삽입</a>
 -->






