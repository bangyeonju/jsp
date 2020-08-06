<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertProc.jsp
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="emart.EmartDao"/>
<jsp:useBean id="bean" class="emart.EmartBean"/>
<jsp:setProperty name="bean" property="*"/>

<%
	if(bean.getProduct()== null){
		bean.setProduct("선택된 항목없음");
	}else{
	String str="";
	String[] product = request.getParameterValues("product");
	for(int i=0;i<product.length;i++){
		str += product[i]+" "; // ex) str = 의류 도서
	}
	bean.setProduct(str);
	}
	
%>
<%	
	String msg;
	String url;
	if(bean.getApprove()==null){
		bean.setApprove("결재안함");
	}
	if(bean.getAgree()==null){
		bean.setAgree("동의안함");
	}else if(bean.getAgree().equals("on")){
		bean.setAgree("동의");
	}
	int cnt = dao.updateData(bean); 
	
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