<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

session2.jsp <br><br>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");//request
	String passwd = request.getParameter("passwd");
	String sports = request.getParameter("sports");
	String game = request.getParameter("game");
	
	String  sid = (String)session.getAttribute("id");//session
	String spw =(String)session.getAttribute("passwd");
//	session.invalidate();
	
%>	

id : <%=id%> <br>
passwd : <%=passwd%> <br>
sports : <%=sports%> <br>
game : <%=game%> <br>
sid :<%=sid %><br>
spw:<%=spw %>





