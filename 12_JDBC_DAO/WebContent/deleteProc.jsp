<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    deleteProc.jsp
<%
 request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="Book.BookDao"/>

<%
String msg;
int num = Integer.parseInt(request.getParameter("num"));
int cnt = dao.deleteData(num);
if(cnt == -1){
	response.sendRedirect("select.jsp");
}else {
	msg="삭제실패";
%>
	<script type="text/javascript">
		alert("<%=msg%>");
	</script>
<%
response.sendRedirect("select.jsp");
}
%>
