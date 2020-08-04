<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="myPkg.MemberBean"%>

select.jsp<br><br>
     
<%-- <%	myPkg.MemberDao dao = new myPkg.MemberDao(); %> --%>
<jsp:useBean id="dao" class="myPkg.MemberDao"></jsp:useBean>

<%
	ArrayList<MemberBean> al = dao.getAllMembers();
	System.out.println("select.jsp al.size():" + al.size());
%>
<table border="1">
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>비번</th>
		<th>이름</th>
		<th>가입일</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	
	<%
		for( MemberBean mb : al){
	%>
			<tr>
				<td><%=mb.getNum() %></td>
				<td><%=mb.getId() %></td>
				<td><%=mb.getPasswd() %></td>
				<td><%=mb.getName() %></td>
				<td><%=mb.getRegister() %></td>
				<td><a href="updateForm.jsp?num=<%=mb.getNum() %>">수정</a></td>
				<td><a href="deleteProc.jsp?num=<%=mb.getNum() %>">삭제</a></td>
			</tr>	
	<%			
		}
	%>
</table>

<a href="insertForm.jsp">삽입</a>













