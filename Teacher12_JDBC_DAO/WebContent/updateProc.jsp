<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br><br>


<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- DTO.BookBean bean = new DTO.BookBean(); -->
<jsp:useBean id="dao" class="my.BookDao"/>
<jsp:useBean id="bean" class="my.BookBean"/>
<jsp:setProperty property="*" name="bean"/>


<%
	String temp=""; 
	String[] bs = request.getParameterValues("bookstore");
	for(int i=0;i<bs.length;i++){
		temp += bs[i] + " "; // 교보문고 알라딘 
	}
	bean.setBookstore(temp);
	
	int cnt = dao.updataData(bean);   
	if(cnt >0 ){
		response.sendRedirect("select.jsp");
	}
	else{
		response.sendRedirect("updateForm.jsp?no="+bean.getNo());
	}
%>


