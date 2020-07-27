<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
 int value1= 10;
 int value2= 20;
	int addResult = add(value1,value2);
	int subResult = subtract(10,20);
			
 %>
<%! //메서드 정의할때는 선언문 안에다가
 	public int add(int a,int b){
 		return a+b;
 	}	
 	public int subtract(int a, int b){
 		return a-b;
 	
 }
 %>
 결과1:<%= value1 %> + <%= value2 %> = <%= addResult %><br>
 결과2:<%= value1 %> - <%= value2 %> = <%= subResult %>
 
