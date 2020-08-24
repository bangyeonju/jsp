<%@page import="my.shop.ProductDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="my.shop.CategoryBean"%>
<%@page import="my.shop.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
prod_input_proc.jsp
<%
String pname = request.getParameter("pname");

CategoryDAO cdao = CategoryDAO.getInstance();

System.out.println(pname);//null

%>
<!-- 
C:\jsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Minimall\myshop\images
 -->
 <%
 MultipartRequest mr = null;
 ServletContext sc=  config.getServletContext();//프로젝트입력까지C:\jsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Minimall
 String uploadDir = sc.getRealPath("/myshop/images");// C:\jsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Minimall\myshop\images
 System.out.print(uploadDir);
 int maxSize= 1024*1024*5;
 String encType="UTF-8";
 //순서대로
 //request:폼에서 넘어오는 모든정보가 담긴다.
 //uploadDir:파일을 올릴위치
 //maxSize:업로드할 최대용량
 //encType:한글처리
 //new DefaultFileRenamePolicy()중복데이터 처리
 mr = new MultipartRequest(request,
		 uploadDir,
		 maxSize,
		 encType,
		 new DefaultFileRenamePolicy()
		 );
 String pn = mr.getParameter("pname");
 System.out.println("pn:"+pn);//null
 String pimage = mr.getFilesystemName("pimage");
 System.out.println("pimage:"+pimage);
  
 ProductDao pdao= ProductDao.getInstance();
 String msg="";
 String url="";
 int cnt = pdao.insertProduct(mr);
 if(cnt>0){
	 msg="상품등록성공";
	 url="prod_list.jsp";
 } else {
	 msg="상품등록실패";
	 url="prod_input.jsp";
	 
 }
 %>
 <script type="text/javascript">
 alert("<%=msg%>"+"입니다.");
 location.href="<%=url%>";
 </script>
