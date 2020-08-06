<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
deleteAll.jsp<br><br>
<jsp:useBean id="dao" class="emart.EmartDao"/>
<%
String[] str = request.getParameterValues("rowcheck");
System.out.print(str);
for(int i =0;i<str.length;i++){
System.out.print(str[i]);

int cnt = dao.deleteCheckData(str);
if(cnt>0){
	response.sendRedirect("select.jsp");
}
}
%>