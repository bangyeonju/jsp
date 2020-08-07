<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 request.setCharacterEncoding("UTF-8");

 %>
deleteProc.jsp
<jsp:useBean id="dao" class="DTO.MovieDao"/>
<jsp:useBean id="bean" class="DTO.MovieBean"/>

<%
int num = Integer.parseInt(request.getParameter("num"));
String msg; 
int cnt = dao.deleteData(num);
if(cnt == -1){
	msg="실패";
}else{
	msg="성공";
}
%>
<script type="text/javascript">
alert(<%=msg%>);
</script>
<%
response.sendRedirect("select.jsp");
%>