<%@page import="myPkg.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
	String title =request.getParameter("title");
	String author= request.getParameter("author");
	String publisher= request.getParameter("publisher");
	int price = Integer.parseInt(request.getParameter("price"));
	String date = request.getParameter("date");
	String kind = request.getParameter("kind");
	int count = Integer.parseInt(request.getParameter("count"));
	String[] bookstore= request.getParameterValues("bookstore");	 
	String str = "";
	for(int i=0;i<bookstore.length;i++){
	str += bookstore[i]+"";
	}
	 
	
	
	
 	out.print("<table border=1>"
 			+"<tr>"
 			+"<th>제목</th>"
 			+"<td>"+title+"</td>"
 			+"</tr>"
 			+"<th>저자</th>"
  			+"<td>"+author+"</td>"
 			+"</tr>"
  			+"<th>출판사</th>"
 		 	+"<td>"+publisher+"</td>"
 		 	+"</tr>"
 		 	+"<th>가격</th>"
 		 	+"<td>"+price+"</td>"
 		 	+"</tr>"
 		 	+"<th>입고일</th>"
 		 	+"<td>"+date+"</td>"
 		 	+"</tr>"
 		 		 		  				+"<th>배송비</th>"
 		 		 		  			+"<td>"+kind+"</td>"
 		 		 		  			+"</tr>"		
 		 		 		  			+"<th>서점</th>"
 		 		 		 		  			+"<td>"+str+"</td>"
 		 		 		 		  			+"</tr>"
 		 		 		 		  				+"<th>보유수량</th>"
 		 	 		 		 		  			+"<td>"+count+"</td>"
 		 	 		 		 		  			+"</tr>"
			+"</table>");

%>
[자바객체이용]
<%
	BookBean bb = new BookBean();
	bb.setTitle(title);
	bb.setAuthor(author);
	bb.setPublisher(publisher);
	bb.setPrice(price);
	bb.setDate(date);
	bb.setKind(kind);
	bb.setBookstore(str);
	
	bb.setCount(count);
	
 	out.print("<table border=1>"
 			+"<tr>"
 			+"<th>제목</th>"
 			+"<td>"+bb.getTitle()+"</td>"
 			+"</tr>"
 					+"<th>저자</th>"
 		 			+"<td>"+bb.getAuthor()+"</td>"
 		 			+"</tr>"
 		 					+"<th>출판사</th>"
 		 		 			+"<td>"+bb.getPublisher()+"</td>"
 		 		 			+"</tr>"
 		 		 					+"<th>가격</th>"
 		 		 		 			+"<td>"+bb.getPrice()+"</td>"
 		 		 		 			+"</tr>"
 		 		 		 				+"<th>입고일</th>"
 		 		 		  			+"<td>"+bb.getDate()+"</td>"
 		 		 		  			+"</tr>"
 		 		 		  				+"<th>배송비</th>"
 		 		 		  			+"<td>"+bb.getKind()+"</td>"
 		 		 		  			+"</tr>"		
 		 		 		  			+"<th>서점</th>"
 		 		 		 		  			+"<td>"+bb.getBookstore()+"</td>"
 		 		 		 		  			+"</tr>"
 		 		 		 		  				+"<th>보유수량</th>"
 		 	 		 		 		  			+"<td>"+bb.getCount()+"</td>"
 		 	 		 		 		  			+"</tr>"
			+"</table>");

%>

<jsp:useBean id="bb2" class="myPkg.BookBean" />

<jsp:setProperty property="*" name="bb2" />
<%
	bb2.setBookstore(str);
%>
<table border=1>
	<tr>
		<th>제목</th>
		<td><jsp:getProperty property="title" name="bb2" /></td>
	</tr>
	<tr>
		<th>저자</th>
		<td><jsp:getProperty property="author" name="bb2" /></td>
	</tr>
	<tr>
		<th>출판사</th>
		<td><jsp:getProperty property="publisher" name="bb2" /></td>
	</tr>
	<tr>
		<th>가격</th>
		<td><jsp:getProperty property="price" name="bb2" /></td>
	</tr>
	<tr>
		<th>입고일</th>
		<td><jsp:getProperty property="date" name="bb2" /></td>
	</tr>
	<tr>
		<th>서점</th>
		<td><jsp:getProperty property="bookstore" name="bb2" /></td>
	</tr>
	<tr>
		<th>배송비</th>
		<td><jsp:getProperty property="kind" name="bb2" /></td>
	</tr>
	<tr>
		<th>보유수량</th>
		<td><jsp:getProperty property="count" name="bb2" /></td>
	</tr>
</table>

























