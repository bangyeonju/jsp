<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="insertResult.jsp" method="post">
아이디 <input type="text" name="id"><p>
비밀번호<input type="password" name="pw"><p>
이름<input type="text" name="name"><p>
성별<input type="radio" name="gender" value="남">남
<input type="radio" name="gender" value="여">여<p>
이메일<input type="text" name="uname">@
<select name="dname">
<option value="naver.com">naver.com</option>
<option value="daum.net">daum.net</option>

<option value="nate.com">nate.com</option>
<option value="google.com">google.com</option>
<option value=yahoo.com>yahoo.com</option>

</select><p>
<input type="submit" value="전송">





</form>