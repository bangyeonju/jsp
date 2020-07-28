<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
        
<%


	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String hobby = request.getParameter("hobby");
	String color = request.getParameter("color");
	String abc = request.getParameter("abc");

%>
<%
	if(gender.equals("male")){ //문자열비교
		gender="남자";
	}else 
		gender="여자";
%>
<%= name%>님의 정보 입니다.<br>
나이 :<%= age%><br>
성별 : <%= gender%><br>
취미 : <%= hobby%><br>
색깔 : <img src="../images/<%= color%>.jpg"><br>
abc : <%=abc %>

<% 
if(abc==null){
	out.print("없음");
}
else {
	out.print("있음");
}


%>