<%@page import="yj.food.FoodDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="yj.kind.KindDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<%
	KindDao kdao = KindDao.getInstance();
	MultipartRequest mr = null;
	ServletContext sc = config.getServletContext();
	String uploadDir = sc.getRealPath("/yshop/images");
	int maxSize=1024*1024*5;
	String encType="UTF-8";
	
	mr = new MultipartRequest(request,
			uploadDir,
			maxSize,
			encType,
			new DefaultFileRenamePolicy()
			);
	String pname= mr.getParameter("pname");
	String pimage=mr.getParameter("pimage");
	FoodDao fdao = FoodDao.getInstance();
	int cnt = fdao.insertFood(mr);
	String msg ="",url="";
	if(cnt > 0) {
		msg="삽입성공";
		url="food_list.jsp";
	} else
	{
		msg="삽입실패";
		url="food_list.jsp";
	}
			
%>


<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>