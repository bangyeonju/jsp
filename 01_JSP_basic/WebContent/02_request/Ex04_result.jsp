<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <% request.setCharacterEncoding("UTF-8");%>
   
   <%
   	String name = request.getParameter("name");
   	String[] name2 = request.getParameterValues("name");
   
   	String pw = request.getParameter("pw");
   	String[] pw2 = request.getParameterValues("pw");
   //	String fruit = request.getParameter("fruit");
    String[] fruit = request.getParameterValues("fruit");
  	out.print(name2[0]+pw2[0]); 	
   %>
   <%
   
   	   for(int i=0;i<fruit.length;i++){
		out.print(fruit[i]);   
   }
   %>
   
  