<%@page import="emart.EmartBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
updateForm.jsp<br><br>

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
<jsp:useBean id="dao" class="emart.EmartDao"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	EmartBean bean = dao.getEmartByNum(num); 
	out.println(bean.getProduct()+"<br>");
	out.println(bean.getTime()+"<br>");
	out.println(bean.getApprove()+"<br>");
	out.println(bean.getAgree()+"<br>");
%>

<%
	String[] product = {"식품","의류","도서","가구"};
	String[] time = {"9시~11시","11시~1시","1시~5시","5시~9시"};
	String[] approve = {"카드","핸드폰"};
%>
<body>
<h2> 이마트 상품 구매 내역 </h2>
<FORM name="myform" METHOD="post" ACTION="updateProc.jsp">
	<input type="hidden" name="num" value="<%=bean.getNum() %>">
 <span>아이디 :</span> <INPUT TYPE="text" NAME="id" value="<%=bean.getId() %>"><br>
 <span>비번 :</span> <INPUT TYPE="text" NAME="pw" value="<%=bean.getPw() %>"><br>
  <p> 
 
 
<span>구매상품:</span>
<!-- 
	<input type="checkbox" name="product" value="식품">식품
	<input type="checkbox" name="product" value="의류" checked>의류
	<input type="checkbox" name="product" value="도서">도서
	<input type="checkbox" name="product" value="가구" checked>가구
 -->	
 <%
 for(int i=0;i<product.length;i++){
 %>	 
 	<input type="checkbox" name="product" value="<%=product[i] %>" <%if(bean.getProduct().contains(product[i])) { %> checked <%} %> > <%=product[i] %>
 																			<!-- 의류 도서.contains("가구") -->	
 <%
 }
 %>
<p>

<span>배송시간 :</span> 
 	<SELECT NAME="time">
 		<OPTION VALUE="선택">선택</OPTION>
		<!-- <OPTION  VALUE="9시~11시">9시~11시</OPTION>
		<OPTION VALUE="11시~1시" selected>11시~1시</OPTION>
		<OPTION VALUE="1시~5시">1시~5시</OPTION>
		<OPTION VALUE="5시~9시">5시~9시</OPTION> -->
		
		<%
			for(int i=0;i<time.length;i++){
		%>
				<option value="<%=time[i]%>" <% if(bean.getTime().equals(time[i])) { %> selected <% }%> > <%=time[i]%> </option>
		<%											/* "1시~5시".equals("9시~11시") */
			}
		%>
	</SELECT>
<p>

<span>결재방법:</span>
<!-- 카드 <INPUT TYPE="radio" NAME="approve" VALUE="카드" checked>
핸드폰 <INPUT TYPE="radio" NAME="approve" VALUE="핸드폰"> -->

<%
	for(int i=0;i<approve.length;i++){
%>
		<%=approve[i] %> <INPUT TYPE="radio" NAME="approve" VALUE="<%=approve[i] %>" <%if(bean.getApprove().equals(approve[i])) { %> checked <% } %>>
<%																							/* "카드".equals("카드") */
	}
%>
<p>
<span>결재 동의합니다. </span>  
<INPUT TYPE="checkbox" NAME="agree" id="agree" <%if(bean.getAgree().equals("동의함")) {%> checked <% } %>> 
<p>													<!-- "동의함".equals("동의함") -->

<INPUT TYPE="submit" value="보내기" onClick="return check()">
</FORM>
</body>
</html>


