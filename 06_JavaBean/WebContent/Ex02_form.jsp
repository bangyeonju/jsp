<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		String[] subject ={"국어","영어","수학","과학","음악"};
	%> 

<form action="EX02_result.jsp" method="post">
	이름:<input type="text" name="name" value="수영"><br>
	과목점수<br>
	<% for(int i =0;i<subject.length;i++){%>
		<%=subject[i] %>:<input type="text" name="jumsu" value="1"><br>
	 <%}%>
	<!-- 
	영어:<input type="text" name="jumsu" value="1"><br>
	수학:<input type="text" name="jumsu" value="1"><br> 
	-->
	<br>
	<select name="group" multiple size=3>
		<option value="블랙핑크">블랙핑크</option>
		<option value="핑클">핑클</option>
		<option value="레드벨벳">레드벨벳</option>
		<option value="소녀시대">소녀시대</option>
		<option value="에이핑크">에이핑크</option>
		<option value="트와이스">트와이스</option>
	</select>
	<br>
	좋아하는 노래:
	<input type="radio" name="song" value="좋은날">좋은날 &nbsp;&nbsp;
	<input type="radio" name="song" value="너랑나">너랑나 &nbsp;&nbsp;
	<input type="radio" name="song" value="별이진다네">별이진다네 &nbsp;&nbsp;
	<input type="radio" name="song" value="단발머리">단발머리 &nbsp;&nbsp;
	<br><br>
	<input type="submit" value="전송">
</form>
