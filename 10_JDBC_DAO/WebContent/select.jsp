<%@page import="myPkg.EmpleBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	table{
		text-align: center;
		border : 1px solid blue;
		width : 70%;
		height : 30%;
		margin : 20px auto;
	}
	
	tr:first-child{
		background-color: yellow;
	}
</style>    
select.jsp

<jsp:useBean id="dao" class="myPkg.EmpleDao"/>
<%
	ArrayList<EmpleBean> lists = dao.getAllEmpls(); 
%>
<table border="1">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>부서번호</td>
			<td>급여</td>
			<td>수정</td>
			<td>삭제</td>
		</tr> 
		
		<%
			for( EmpleBean bean : lists){
		%>
				<tr>
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

<a href="insertForm.jsp">삽입</a>







