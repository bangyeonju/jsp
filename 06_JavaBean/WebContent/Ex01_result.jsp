<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- DTOCheckboxBean bean = new DTO.CheckboxBean(); -->
<jsp:useBean id="bean" class="my.CheckboxBean"></jsp:useBean>
<jsp:setProperty property="name" name="bean" />
<jsp:setProperty property="fruit" name="bean" />
<!-- fruit를 배열로 해서 그냥 넘길수가있당.!!!!-->
이름:<jsp:getProperty property="name" name="bean"/>
과일:<jsp:getProperty property="fruit" name="bean"/><br>
과일 2:

<% if(bean.getFruit()!=null) {%>
<% 
	String[] fruit= bean.getFruit();
	for(int i=0;i<fruit.length;i++){
	%>
		<%= fruit[i] %>
<% 		
	}
%>
	<br>
<% } else{%>
	선택한값일없슨디ㅏ
<%}
%>
  

	