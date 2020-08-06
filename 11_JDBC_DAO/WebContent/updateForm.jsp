<%@page import="emart.EmartBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm.jsp
<jsp:useBean id="dao" class="emart.EmartDao"/>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<title></title>
<style type="text/css">
span{
	float:left;
	display:block;
	width:150px;
	color:red;
}
</style>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	EmartBean bean = dao.getEmartByNum(no);
	
	out.println(bean.getNo()+" ");
	out.println(bean.getId()+" ");
	out.println(bean.getPw()+" ");
	out.println(bean.getProduct()+" ");
	out.println(bean.getProduct()+" ");
	out.println(bean.getTime()+" ");
	out.println(bean.getAgree()+" ");
	
	out.println(bean.getApprove()+" ");
%>

<%
String[] product= {"식품","의류","도서","가구"};
String[] time={"9시~11시","11시~1시","1시~5시","5시~9시"};
String[] approve={"카드","핸드폰"};
		

%>

<body>
<h2> 이마트 상품 구매 내역 </h2>
<FORM name="myform" METHOD="post" ACTION="updateProc.jsp">
	<input type="hidden" name="no" value="<%=bean.getNo() %>">
 <span>아이디 :</span> <INPUT TYPE="text" NAME="id" value="<%=bean.getId()%>"><br>
 <span>비번 :</span> <INPUT TYPE="text" NAME="pw" value="<%=bean.getPw()%>"><br>
  <p> 
  
 
<span>구매상품:</span>
<!-- 	<input type="checkbox" name="product" value="식품">식품
	<input type="checkbox" name="product" value="의류">의류
	<input type="checkbox" name="product" value="도서">도서
	<input type="checkbox" name="product" value="가구">가구 -->
	<%
	for(int i =0;i<product.length;i++){
		%>																		
	<input type="checkbox" name="product" value="<%=product[i] %>"<%if(bean.getProduct().contains(product[i])){%>checked<%} %>><%=product[i] %>
																	<!-- 의류 도서.contains("의류") => 포함되어있으면 true 
																		  의류 도서.contains("가구")	=> false-->
		<%
	}
		%>
	 
<p>

<span>배송시간 :</span> 
 	<SELECT NAME="time">
 		<OPTION VALUE="선택">선택</OPTION>
		<!-- <OPTION  VALUE="9시~11시">9시~11시</OPTION>
		<OPTION VALUE="11시~1시">11시~1시</OPTION>
		<OPTION VALUE="1시~5시">1시~5시</OPTION>
		<OPTION VALUE="5시~9시">5시~9시</OPTION> -->
		<%
		for(int i=0;i<time.length;i++){
		%>
		<option value="<%=time[i] %>" <%if(bean.getTime().equals(time[i])==true){%> selected <%}%>><%=time[i] %></option>
		<%
		}
		%>
		
	</SELECT>
<p>

<span>결재방법:</span>
<!-- 카드 <INPUT TYPE="radio" NAME="approve" VALUE="카드">
핸드폰 <INPUT TYPE="radio" NAME="approve" VALUE="핸드폰"> -->
<%
for(int i=0;i<approve.length;i++){
%>
<%=approve[i]%> <input type="radio" name="approve" value="<%=approve[i] %>" <%if(bean.getApprove().equals(approve[i])==true){ %> checked <%} %>>
<%
}
%>
<p>
<span>결재 동의합니다. </span>  <INPUT TYPE="checkbox" NAME="agree" id="agree" <% if(bean.getAgree().equals("동의")){%> checked <%}%> > 
<p>

<INPUT TYPE="submit" value="보내기" onClick="return check()">
</FORM>
</body>
</html>