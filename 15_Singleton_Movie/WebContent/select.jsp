<%@page import="myPkg.MovieDao"%>
<%@ page import="java.util.*,myPkg.MovieBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <jsp:useBean id="dao" class="myPkg.MovieDao" /> --%>
<%
MovieDao dao = MovieDao.getInstance();
System.out.println("select.jsp"+dao);
	System.out.println("select:"+dao);
	request.setCharacterEncoding("UTF-8");

	Vector<MovieBean> movies = dao.getAllMovies();
%>

<style type="text/css">
table{
	borIUfffsdfsdder: 1px solid blue;
}
tr:first-child{
	background-color: yellow;
}
</style>
<script type="text/javascript">
	function insert() {
		location.href = "insertForm.jsp";
	}

	function selectDelete() {
		var flag = false;
		var memberchk = document.getElementsByName("rowcheck");
		for (var i = 0; i < memberchk.length; i++) {
			if (memberchk[i].checked) {
				flag = memberchk[i].checked;
			}
		}
		if (!flag) {
			alert("삭제할 내용을 체크하세요");
			return;
		}
		document.userForm.submit();
	}

	function allDelete(obj) {
		var chkobj = document.getElementsByName("rowcheck");
		var rowcnt = chkobj.length - 1;
		
		var check = obj.checked;
		if (check) {
			for (var i = 0; i <= rowcnt; i++) {
				chkobj[i].checked = true;
			}
		} else {
			for (var i = 0; i <= rowcnt; i++) {
				chkobj[i].checked = false;
			}
		}
	}
</script>

<form name="userForm" action="deleteAll.jsp">
	<input type="button" value="삭제" onclick="selectDelete();">
	<input type="button" value="추가" onclick="insert();">
	<table border="1" align="center" width="90%">
		<tr align="center">
		<td><input type="checkbox" name="allcheck"	onclick="allDelete(this);"></td> 
			<td>번호</td>
			<td>아이디</td>
			<td>이름</td>
			<td>나이</td>
			<td>좋아하는 장르</td>
			<td>즐겨보는 시간대</td>
			<td>동반관객수</td>
			<td>개선사항</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		<%
			for (MovieBean movie : movies) {
		%>
		<tr align="center">
		<td><input name="rowcheck" type="checkbox" value="<%=movie.getNum()%>"></td>
			<td><%=movie.getNum()%></td>
			<td><%=movie.getId()%></td>
			<td><%=movie.getName()%></td>
			<td><%=movie.getAge()%></td>
			
			<td><%=movie.getGenre()%></td>
			
			<td><%=movie.getTime()%></td>

			<td><%=movie.getPartner()%></td>

			<%if(movie.getMemo()==null ){
			%>
				<td>없음</td>
			<%} else { %>
				<td><%=movie.getMemo()%></td>
			<%} %>
			
			<td><a href="updateForm.jsp?num=<%=movie.getNum()%>">수정</a></td>
			<td><a href="deleteProc.jsp?num=<%=movie.getNum()%>">삭제</a></td>
		</tr>
		<%
			}
		%>
	</table>
	</form>

