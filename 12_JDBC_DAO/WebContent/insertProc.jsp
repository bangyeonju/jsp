<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertProc.jsp
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="Book.BookDao"/>
<jsp:useBean id="bean" class="Book.BookBean"/>
<jsp:setProperty property="*" name="bean"/>

<%
String str = "";
String[] bookstore = request.getParameterValues("bookstore");
for(int i=0;i<bookstore.length;i++){
	str += bookstore[i] + " ";
}
bean.setBookstore(str);

%>

<%
int cnt = dao.insertData(bean);
if(cnt == 1){
	response.sendRedirect("select.jsp");
} else{
	response.sendRedirect("insertForm.jsp");
	
}
%>