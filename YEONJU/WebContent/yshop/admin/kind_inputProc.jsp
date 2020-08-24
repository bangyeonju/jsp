<%@page import="yj.kind.KindDao"%>
<%@page import="yj.kind.KindBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<%
String fcode = request.getParameter("fcode");
String fname = request.getParameter("fname");
KindDao kdao = KindDao.getInstance();
int cnt = kdao.insertKind(fcode,fname);
String msg="",url="";
if(cnt>0){
	msg="성공";
	System.out.print("1");
	url="kind_list.jsp";
} else {
	msg="실패";
	System.out.print("2");
	url="kind_input.jsp";
}

%>
<script type="text/javascript"> 
alert("<%=msg%>");
location.href="<%=url%>";


</script>