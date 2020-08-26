<%@page import="yj.food.FoodDao"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MultipartRequest mr = null;
	int maxSize = 1024*1024*5;
	String encType="UTF-8";
	ServletContext sc = config.getServletContext();
	String uploadDir = sc.getRealPath("/yshop/images");

	mr =new MultipartRequest(request,
							uploadDir,
							maxSize,
							encType,
							new DefaultFileRenamePolicy());
	
	String pimage = mr.getFilesystemName("pimage");
	System.out.println("pimage:" + pimage);
	String old_pimage =mr.getParameter("old_pimage");
	System.out.println("old_pimage:" + old_pimage);
	
	File dir = new File(uploadDir);
	
	if(pimage !=null){//수정할 이미지가 null이 아니고
		if(old_pimage != null){//기존이미지가 null이 아니면
			File delFile = new File(dir,old_pimage);
		
			if(delFile.exists()){
				if(delFile.delete()){
				%>
				<script type="text/javascript">
					alert("이미지파일삭제성공");
				</script>
				<%
				}
			}
		}
	}
	FoodDao fdao = FoodDao.getInstance();
	int cnt = fdao.foodUpdate(mr);
	String msg="",url="";
	if(cnt >0 ){
		msg="수정성공";
		url="food_list.jsp";
	} else{
		msg="수정실패";
		url="food_update.jsp";
	}
%>



<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>  
