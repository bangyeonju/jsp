<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
insertProc.jsp
<%
request.setCharacterEncoding("UTF-8");

%>
<jsp:useBean id="dao" class="emart.emartDao"/>
<jsp:useBean id="bean" class=emart.EmartBean/>
<jsp:setProperty name="bean" property="*"/>
<%	
	String msg;
	String url;
	
	int cnt = dao.insertData(bean); 
	if(cnt == 1){
		msg = "���Լ���";
		url = "select.jsp";
	}
	else{
		msg = "���Խ���";
		url = "insertForm.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>"); 
	location.href='<%=url %>'
</script>