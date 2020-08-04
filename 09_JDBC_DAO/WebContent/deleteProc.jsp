<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
deleteProc.jsp입니다.
<!-- 객체생성 jsp코드-->
<jsp:useBean id="dao" class="myPkg.MemberDao"/>
<%

request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num"));
System.out.println("deleteProc.jsp num"+num);
int cnt =dao.deleteData(num);//호출
if(cnt ==1) {
	response.sendRedirect("select.jsp");
}
%>
