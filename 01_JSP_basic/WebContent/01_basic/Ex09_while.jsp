<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int count = 1;
while(count<=20){
	int num = (int)(Math.random()*10)+1;
	//out.println(count+"번째:"+num+"<br>");
%>
	<%= count %>번째 <%= num %> <br>
<%	count++;
	if(num == 7)
		break;
		
}
%>