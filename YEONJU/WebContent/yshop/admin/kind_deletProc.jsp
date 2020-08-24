<%@page import="com.sun.org.apache.xml.internal.serializer.utils.MsgKey"%>
<%@page import="yj.kind.KindDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int fnum = Integer.parseInt(request.getParameter("fnum"));
	
	KindDao kdao = KindDao.getInstance();
 	int cnt = kdao.deleteKind(fnum);
	String msg= "",url="kind_list.jsp";
	if(cnt > 0){
		msg="삭제성공";
	} else{
		msg="삭제실패";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>"+"입니다.");
	location.href="<%=url%>";
</script>