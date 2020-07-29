<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%request.setCharacterEncoding("UTF-8"); %>
<%
	String id= request.getParameter("id");
	String passwd= request.getParameter("passwd");
	out.print(id +","+  passwd);
	session.setAttribute("id", id+"님 반감습니다/"); // abc라는 이름으로 세션을 설정 한다. 넘어온값을 abc로 설정한다.(별명처럼) 계속끌고다니고사용
	session.setAttribute("passwd",passwd); //  계속끌고다니고사용
	//session.setMaxInactiveInterval(60);// 세션유지시간
	
%>
<h2>session 내장객체</h2>
<form action="session2.jsp" method="post">
	<!-- 아이디 :  <input type="hidden" name="id" value="<%=id %>"><br> hidden 숨겨진다.-->
	<%-- <!-- 아이디 : --> <input type="text" name="id" value="<%=id %>" readonly><br> <!--  readonly 값을 볼수있다..-->
	<!-- 패스워드 : --> <input type="text" name="passwd" value="<%= request.getParameter("passwd")%>" disabled><br> <!-- disabled는 값이 안넘어간다. => null --> --%>
	★가장 좋아하는 스포츠를 선택하세용★<br>
	<input type="radio" name="sports" value="태권도">태권도
	<input type="radio" name="sports" value="유도">유도
	<input type="radio" name="sports" value="탁구">탁구
	<input type="radio" name="sports" value="농구">농구
	<br>
	<select  name="game">
		<option value="카트라이더">카트라이더</option>
		<option value="기적의 검">기적의검</option>
		<option value="리니지">리니지</option>
	</select>
	
	<input type="submit" value="전송">
</form>