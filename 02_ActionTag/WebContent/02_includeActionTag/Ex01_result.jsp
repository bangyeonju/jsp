<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	
	out.print(name+","+pw);
%>
<hr>
<!-- Ex01_body.jsp를 포함하겠다 -->
<%-- <jsp:include page="Ex01_body.jsp"/> --%>=> <!-- 액션어 Ex01_body.jsp를 실행한 결과를 가지고 온다. -->
<jsp:include page="Ex01_body.jsp">
	<jsp:param name="addr" value="서울"/>
</jsp:include>


  

<%--  <%@ include file="Ex01_body.jsp" %> 지시어를 쓰면 Ex01_body.jsp안에 있는 내용을 복사해서 온다. 위에 코드와 중복이 떠서 에러가 나온다 --%>

<!-- Ex01_body.jsp에서 request객체가 같다 공유한다. -->