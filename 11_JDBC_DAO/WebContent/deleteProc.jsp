<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="emart.EmartDao"></jsp:useBean>
deleteProc.jsp
<%
	String msg;
	int no = Integer.parseInt(request.getParameter("no"));
	int cnt = dao.deleteData(no);
	if (cnt == -1) {
		response.sendRedirect("select.jsp");
	} else {
		msg="삭제실패";
%>
		<script type="text/javascript">
			alert("<%=msg%>");
		</script>
<%
	response.sendRedirect("select.jsp");
	}
%>
