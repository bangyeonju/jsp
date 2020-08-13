<%@page import="my.shop.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
cate_delete.jsp
<%
CategoryDAO cdao = CategoryDAO.getInstance();
int cnum = Integer.parseInt(request.getParameter("cnum"));
int cnt = cdao.deleteCategory(cnum);
String msg="",url="";
if(cnt>0){
	msg="삭제성공";
} else{
	msg="삭제실패";

}
%>
<script type="text/javascript">
alert("<%=msg%>입니다");
location.href="cate_list.jsp";
</script>