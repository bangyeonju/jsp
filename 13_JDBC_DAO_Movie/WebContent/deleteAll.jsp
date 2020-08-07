<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
 request.setCharacterEncoding("UTF-8");
 %>
<jsp:useBean id="dao" class="DTO.MovieDao"/>
deleteAll.jsp

<%
String[] str = request.getParameterValues("row");
System.out.print(str[0]);
int cnt = dao.deleteAll(str);
if(cnt>0){
	response.sendRedirect("select.jsp");
}
%>