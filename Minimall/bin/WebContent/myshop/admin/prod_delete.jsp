<%@page import="java.io.File"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
prod_delete.jsp
<%
int pnum= Integer.parseInt(request.getParameter("pnum"));
String pimage= request.getParameter("pimage");

System.out.println("pnum:"+pnum);
System.out.println("pimage:"+pimage);

ServletContext sc = config.getServletContext();
String delPath = sc.getRealPath("/myshop/images");
System.out.println("delPath="+delPath);//글자

//파일로 만드는 작업
File dir = new File(delPath);//글자를 폴더로 만드는 작업/Minimall/myshop/images
File delFile =new File(dir,pimage);//파일로만드는 작업

if(delFile.exists()){
	if(delFile.delete()){
		%>
		<script type="text/javascript">
			alert("이미지화일 삭제 성공");
		</script>
		<% 
	}
}

ProductDao pdao = ProductDao.getInstance();
int cnt = pdao.deleteProduct(pnum);


String msg="",url="";
if(cnt >0){
	msg="상품삭제성공";
}else{
	msg="상품삭제실패";
}
url="prod_list.jsp";
%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>