<%@page import="my.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String userid = request.getParameter("userid");  
	
	MemberDAO dao = MemberDAO.getInstance();
	boolean check = dao.searchID(userid);  
	String str="";
	if(check){ // true
		str = "NO";
		out.print(str);
	}else{ // false
		str = "YES";
		out.print(str);
	}
%>

