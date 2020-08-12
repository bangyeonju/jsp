<%@page import="my.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String userid = request.getParameter("userid");
MemberDAO dao = MemberDAO.getInstance();//객체생성

boolean check = dao.searchId(userid);
System.out.println(check);
String str="";
if(check){ //true
	str="NO"; //id가 있으면 중복되어서 사용불가 이므로  no!
	out.print(str);
}else{
	str="YES";
	out.print(str);
}
%>