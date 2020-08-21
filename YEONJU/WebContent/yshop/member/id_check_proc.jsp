<%@page import="yj.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String userid=request.getParameter("userid");
MemberDao mdao = MemberDao.getInstance();
boolean check = mdao.searchId(userid);
System.out.println(check);
String str="";
 if(check){
	str="NO";
	out.print(str);
} else{
	str="YES";
	out.print(str);
}
%>