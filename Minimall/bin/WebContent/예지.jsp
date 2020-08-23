<%@page import="my.shop.ProductDao"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%
ServletContext sc = config.getServletContext();
int maxSize=1024*1024*5;

String encType="UTF-8";
String uploadDir=sc.getRealPath("/myshop/images");
MultipartRequest mr = new MultipartRequest(request, uploadDir, maxSize, encType, new DefaultFileRenamePolicy());
String pimage2 = mr.getFilesystemName("pimage");
System.out.println("pimage2:" + pimage2);
String old_pimage = mr.getParameter("old_pimage");
System.out.println("old_pimage:" + old_pimage); // 기존이미지.jpg
File dir = new File(uploadDir);

if(pimage2 != null){ // 
   if(old_pimage != null) { // 
      File delFile = new File(dir,old_pimage);//old이미지 파일 객체로 변환
      if(delFile.exists()){ 
         //델파일이 존재하면 true
         if(delFile.delete()){
             
%>
<script type="text/javascript">
               alert("이미지 화일 삭제 성공");
            </script>
<%               
         }//지우는데 성공하면 블리언 트루리턴
         
      }
   }
}
ProductDao pdao =ProductDao.getInstance();
int cnt = pdao.updateprodu(mr);
String msg,url="";
if(cnt>0){
   msg="상품수정성공";
   url="prod_list.jsp";
}else{
   msg="상품수정실패";
   url="prod_updateForm.jsp";
}
%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url %>";

</script>
<%-- String pname= request.getParameter("pname"); 타입이 파일인걸 넘어올떈 안됨 <jsp:usebean 안됨 
MultipartRequest(request<-from에서 넘어오는 모든정보 
             uploadDir<-업로드할 위치
             업로드할 파일의 최대용량
             변수 타입
             마지막은 중복되 파일을 이름변환해서 처리)
C:\JSP_yeji\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Minimall\ <- sc.getRealPath("")
C:\JSP_yeji\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Minimall\myshop\images --%>