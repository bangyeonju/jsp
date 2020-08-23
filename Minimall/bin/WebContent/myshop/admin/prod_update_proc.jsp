<%@page import="java.io.File"%>
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
String old_pimage=mr.getParameter("old_pimage");//파일이름이 단순히 글자로 들어가 있기때문에 getParameter 사용
System.out.println("old_pimage"+old_pimage);
String pimage =mr.getFilesystemName("pimage");
System.out.println("pimage"+pimage);
//새로운 이미지를 올리고 삭제함..?
File dir = new File(uploadDir);//폴더취급한다.

if(pimage!=null){//새로선택한게 있다면 
	if(old_pimage!=null){//기존 이미지가 있다면 (기존이미지는 글자로 존재)
		File delFile= new File(dir,old_pimage);
		if(delFile.exists()){//dir에 old_pimage가 존재한가? ==> 웹서버 폴더에 존재한다면
				//존재한다.
				if(delFile.delete()){//dir에 old_pimage 존재하면 지워라=> true리턴
					%>
					<script type="text/javascript">
						alert("이미지삭제성공");
					</script>
					<% 
					}
			
		}
	}
	
	
}


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