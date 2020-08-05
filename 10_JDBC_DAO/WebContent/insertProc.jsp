<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
insertProc.jsp<br><br>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dao" class="myPkg.EmpleDao"/>
<jsp:useBean id="bean" class="myPkg.EmpleBean"/>
<jsp:setProperty name="bean" property="*"/>

<%	
	String msg;
	String url;
	
	int cnt = dao.insertData(bean); 
	if(cnt == 1){
		msg = "삽입성공";
		url = "select.jsp";
	}
	else{
		msg = "삽입실패";
		url = "insertForm.jsp";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>"); 
	location.href='<%=url %>'
</script>

<!-- 
자바스크립트 객체
opener 
document
image
math
Date

 -->





















