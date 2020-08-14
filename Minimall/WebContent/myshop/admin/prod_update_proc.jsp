<%@page import="my.shop.ProductDao"%>
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
ProductDao pdao =ProductDao.getInstance();
int cnt = pdao.updateProduct(mr);
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