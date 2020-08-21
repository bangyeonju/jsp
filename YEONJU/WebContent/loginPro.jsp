<%@page import="yj.member.MemberBean"%>
<%@page import="yj.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String password = request.getParameter("password");
MemberDao mdao = MemberDao.getInstance();
MemberBean mb = mdao.getMemberInfo(id,password);
String url="";
if(mb!=null){ //가입된회원
	url=request.getContextPath()"/yshop/"
} else {
	
}
%>