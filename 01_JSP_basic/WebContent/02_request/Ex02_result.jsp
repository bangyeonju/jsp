<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex02_result.jsp입니다.
<%
	//num1,num2 문자열로 받았다가
	String num1= request.getParameter("num1");
	String num2= request.getParameter("num2");
	
	// 정수형으로 바까준다
	int i1=Integer.parseInt(num1);
	int i2=Integer.parseInt(num2);
	
	int mul =1 ;
	int count=0;
	while(count<i2){
		mul=mul*i1;
		count++;
	}
%>
<%= mul  %>
