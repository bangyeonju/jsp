<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_uploadForm.jsp<br><br>

<form method="post" action="Ex01_uploadProc.jsp" enctype="multipart/form-data" >

   이름: <input type="text" name="name" > <br>
   
   <input type="file" name="filename"> <br>
   
   <input type="submit" value="업로드">
   
</form>



<!-- 
서블릿파일 만들어지는 경로
C:\JSP_lsa\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\18_Upload

*파일 업로드 규칙
1. [lib]-cos.jar 포함시킨다
2. method="post" 로 해야한다
3. enctype속성 설정해야한다       enctype="multipart/form-data"  >>이걸사용하면 request.getParameter()로 받을수없게됨




*jar 파일 용도
cos.jar :업로드할때 필요할 파일
ojdbc8.jar : db작업할 때 필요할 파일
servlet-api.jar :
commons-   dbcp 때 필요할 파일
commons-   dbcp 때 필요할 파일
commons-   dbcp 때 필요할 파일
-->