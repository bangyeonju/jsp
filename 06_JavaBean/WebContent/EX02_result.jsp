<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
/* 
String name= request.getParameter("name");
int[] jumsu= Integer.parseInt(request.getParameter("jumsu"));
String[] group= request.getParameter("group");
String song= request.getParameter("song"); 
*/
%>
<jsp:useBean id="bean" class="my.inputBean"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
이름:<jsp:getProperty property="name" name="bean"/>
점수:<% 
	String[] subject={"국어","영어","수학","과학","음악"};
	int[] jumsu= bean.getJumsu();	
	for(int i=0;i<jumsu.length;i++){
	
		out.print(subject[i]+":"+jumsu[i]+"<br>");
	}
	String[] group =bean.getGroup();
	for(int i=0;i<group.length;i++){
		out.print(group[i]+" ");
	}
	%>

좋아하는 노래:<jsp:getProperty property="song" name="bean"/>
