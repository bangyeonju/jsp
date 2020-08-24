<%@page import="yj.food.FoodDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
food_delete.jsp
<%
int pnum = Integer.parseInt(request.getParameter("pnum"));

FoodDao fdao = FoodDao.getInstance();
int cnt = fdao.deleteFood(pnum);
String msg= "",url="food_list.jsp";
if(cnt > 0){
	msg="삭제성공";
} else{
	msg="삭제실패";
}


%>
<script type="text/javascript">
	alert("<%=msg%>"+"입니다.");
	location.href="<%=url%>";
</script>