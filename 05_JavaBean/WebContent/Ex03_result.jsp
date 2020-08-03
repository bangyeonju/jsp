<%@page import="myPkg.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
Ex03_result.jsp <br><br>
[request 객체 이용]<br><br>

<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	int price = Integer.parseInt(request.getParameter("price"));
	String date = request.getParameter("date");
	String kind = request.getParameter("kind");
	String[] bookstore = request.getParameterValues("bookstore");
	int count = Integer.parseInt(request.getParameter("count"));
%>

title : <%=title %> <br>
author : <%=author %> <br>
publisher : <%=publisher %> <br>
price : <%=price %> <br>
date : <%=date %> <br>
kind : <%=kind %> <br>
bookstore : 
	<%
		for(int i=0;i<bookstore.length;i++){
			out.print(bookstore[i]+" ");
		}
	%>
	<br>
count : <%=count %> <br><br><br>


[JAVA 객체 이용]<br><br>
<%
	myPkg.BookBean bb1 = new BookBean();
	bb1.setTitle(request.getParameter("title"));
	bb1.setAuthor(author);
	bb1.setPublisher(publisher);
	bb1.setPrice(price);
	bb1.setDate(date);
	bb1.setKind(kind);

	String str="";
	for(int i=0;i<bookstore.length;i++){
		str += bookstore[i]+" "; // str = yes24 aladin 
	}

	bb1.setBookstore(str); 
	bb1.setCount(count);
%>

title : <%=bb1.getTitle() %> <br>
author : <%=bb1.getAuthor() %> <br>
publisher : <%=bb1.getPublisher() %> <br>
price : <%=bb1.getPrice() %> <br>
date : <%=bb1.getDate() %> <br>
kind : <%=bb1.getKind() %> <br>
bookstore : <%=bb1.getBookstore() %> <br>
count : <%=bb1.getCount() %> <br> <br> <br> 


[JSP 객체 생성]<br><br>

<!-- myPkg.BookBean bb2 = new myPkg.BookBean(); -->
<jsp:useBean id="bb2" class="myPkg.BookBean"/>
<!-- bb2.setTitle(title) -->
<%-- <jsp:setProperty property="title" name="bb2" param="title"/>
<jsp:setProperty property="author" name="bb2" param="author"/>
<jsp:setProperty property="publisher" name="bb2"/> 
<jsp:setProperty property="bookstore" name="bb2" />--%>

<jsp:setProperty name="bb2" property="*"/>
<%
	bb2.setBookstore(str); // yes24 aladin 
%>

<!-- bb2.getTitle() -->
title : <jsp:getProperty property="title" name="bb2"/> <br>
author :  <jsp:getProperty property="author" name="bb2"/><br>
publisher :  <jsp:getProperty property="publisher" name="bb2"/><br>
price :  <jsp:getProperty property="price" name="bb2"/><br>
date :  <jsp:getProperty property="date" name="bb2"/><br>
kind :  <jsp:getProperty property="kind" name="bb2"/><br>
bookstore :  <jsp:getProperty property="bookstore" name="bb2"/><br>
count : <jsp:getProperty property="count" name="bb2"/><br> <br> <br> 





   




