<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
inputProc.jsp

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="DTO.MovieDao"/>
<jsp:useBean id="bean" class="DTO.MovieBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
String str="";
if(bean.getGenre()==null){
	bean.setGenre("선택항목없음");
}else{
String[] genre = request.getParameterValues("genre");
//ystem.out.println(genre[2]);
for (int i=0;i<genre.length;i++){
	str += genre[i]+ " ";
}
bean.setGenre(str);
} 

	
	int cnt = dao.insertData(bean);
	System.out.println(cnt);
	if(cnt == -1){
		response.sendRedirect("insertForm.jsp");
	} else{
		response.sendRedirect("select.jsp");
	}
%>