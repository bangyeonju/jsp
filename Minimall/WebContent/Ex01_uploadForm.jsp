<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
Ex01_uploadForm.jsp<br><br>

<form method="post" action="Ex01_uploadProc.jsp" enctype="multipart/form-data">
	이름:<input type="text" name="name" ><br>
	<input type="file" name="filename"> <br>
	<input type="submit" value="업로드">

</form>
<!-- 
※파일 업로드 규칙※
1.cos.jar포함!
2.메서드(method)는 post!
3.form에 enctype타입설정 해야한다.!

jsp -> java (servlet)

-->