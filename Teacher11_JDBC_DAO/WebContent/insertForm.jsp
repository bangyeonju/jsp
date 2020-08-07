<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
insertForm.jsp<br><br>

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

<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	

	function check(){
		if($('input[name="id"]').val()==""){
			alert("아이디를 입력하세요.");
			$('input[name="id"]').focus();
			return false;
		}
		
		if($('input[name="pw"]').val()==""){
			alert("비번을 입력하세요.");
			$('input[name="pw"]').focus();
			return false;
		}
		
		
		if(!$("input:checkbox[name='product']").is(":checked")){
			alert("하나라도 선택하세요");
			
			return false;
		}
		
		
		 if($('select[name="time"] option:selected').val()=="선택"){ //  option:selected 생략가능
				alert("시간을 선택하세요");
				return false;
		 }
		
		 if(!$("input[name='approve']").is(":checked")){
				alert("결재 체크 누락");
				$("input[type='radio']")[1].focus();
				return false;
			}
		 
		if(!$('#agree').is(':checked')){
			alert("동의 체크하세요");
			$('#agree').focus();
			return false;
		}
			
	}
</script>

<%
	String[] product = {"식품","의류","도서","가구"};
	String[] time = {"9시~11시","11시~1시","1시~5시","5시~9시"};
	String[] approve = {"카드","핸드폰"};
%>
<body>
<h2> 이마트 상품 구매 내역 </h2>
<FORM name="myform" METHOD="post" ACTION="insertProc.jsp">

 <span>아이디 :</span> <INPUT TYPE="text" NAME="id"><br>
 <span>비번 :</span> <INPUT TYPE="text" NAME="pw"><br>
  <p> 
 
 
<span>구매상품:</span>
<!-- 
	<input type="checkbox" name="product" value="식품">식품
	<input type="checkbox" name="product" value="의류">의류
	<input type="checkbox" name="product" value="도서">도서
	<input type="checkbox" name="product" value="가구">가구
 -->	
 <%
 for(int i=0;i<product.length;i++){
 %>	 
 	<input type="checkbox" name="product" value="<%=product[i] %>"> <%=product[i] %>
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
				<option value="<%=time[i]%>"> <%=time[i]%> </option>
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
		<%=approve[i] %> <INPUT TYPE="radio" NAME="approve" VALUE="<%=approve[i] %>">
<%		
	}
%>
<p>
<span>결재 동의합니다. </span>  <INPUT TYPE="checkbox" NAME="agree" id="agree"> 
<p>

<INPUT TYPE="submit" value="보내기" onClick="return check()">
</FORM>
</body>
</html>


