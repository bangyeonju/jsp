<%@page import="my.shop.CategoryBean"%>
<%@page import="my.shop.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
cate_input_proc.jsp
<jsp:useBean id="bean" class="my.shop.CategoryBean"/>
<jsp:setProperty property="*" name="bean"/>

<%
String code=request.getParameter("code");
String cname=request.getParameter("cname");
CategoryDAO cdao = CategoryDAO.getInstance();
int cnt = cdao.categoryInsert(code,cname);
String msg="",url="";
if(cnt >0){
	msg="삽입성공";
	url="cate_list.jsp";
} else{
	msg="삽입실패";
	url="cate_input.jsp";
}
%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>