<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="dao" class="myPkg.MovieDao"/>

<%
String userid = request.getParameter("userid");
System.out.println("userid:" + userid);

boolean flag = dao.searchId(userid); // kim
System.out.println("flag:" + flag);

String str="";
if(flag){//true
	str="NO"; //아이디가 사용불가하면  flag는 true
	out.print(str);//ajax에 No보냄
}else{
	str="YES";
	out.print(str);//ajax러 YES보냄
}
	
%>
