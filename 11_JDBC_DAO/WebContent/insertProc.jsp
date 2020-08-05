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
		msg = "»ðÀÔ¼º°ø";
		url = "select.jsp";
	}
	else{
		msg = "»ðÀÔ½ÇÆÐ";
		url = "insertForm.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>"); 
	location.href='<%=url %>'
</script>