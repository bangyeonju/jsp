<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
	String title =request.getParameter("title");
	String author= request.getParameter("author");
	String publisher= request.getParameter("publisher");
	int price = Integer.parseInt(request.getParameter("price"));
	String kind = request.getParameter("kind");
	int count = Integer.parseInt(request.getParameter("count"));
	String[] bookstore= request.getParameterValues("bookstore");	

			
%>