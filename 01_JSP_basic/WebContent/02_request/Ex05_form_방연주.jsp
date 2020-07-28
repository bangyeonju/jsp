<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src ="../js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	
});
function check(){
	if($('input[name=id]').val()==""){
		alert("id누락");
		return false;
	}
	
	if($('input[name=pw]').val()==""){
		alert("pw누락");
		return false;
	}
	if($('input[name=product]:checked').length==0){
		alert("구매상품을 선택해주세요");
		return false;
	} 
	if($('select option:selected').val()=="선택"){
		alert("배송시간을 선택해주새요");
		return false;
	}
	if(!$('input[name=approve]').is(":checked")){
		alert("결재방번을 선택해주세요");
		return false;
	}
	if(!$('input[name=agree]').is(":checked")){
		alert("동의해주세요");
		return false;
	}
	

}

</script>

<body>
<h2> 이마트 상품 구매 내역 </h2>
<FORM name="myform" METHOD="post" ACTION="Ex05_result_방연주.jsp">

 <span>아이디 :</span> <INPUT TYPE="text" NAME="id"><br>
 <span>비번 :</span> <INPUT TYPE="text" NAME="pw"><br>
  <p> 
  
 
<span>구매상품:</span>
	<input type="checkbox" name="product" value="식품">식품
	<input type="checkbox" name="product" value="의류">의류
	<input type="checkbox" name="product" value="도서">도서
	<input type="checkbox" name="product" value="가구">가구
<p>

<span>배송시간 :</span> 
 	<SELECT NAME="time">
 		<OPTION VALUE="선택">선택</OPTION>
		<OPTION  VALUE="9시~11시">9시~11시</OPTION>
		<OPTION VALUE="11시~1시">11시~1시</OPTION>
		<OPTION VALUE="1시~5시">1시~5시</OPTION>
		<OPTION VALUE="5시~9시">5시~9시</OPTION>
	</SELECT>
<p>

<span>결재방법:</span>
카드 <INPUT TYPE="radio" NAME="approve" VALUE="카드">
핸드폰 <INPUT TYPE="radio" NAME="approve" VALUE="핸드폰">
<p>
<span>결재 동의합니다. </span>  <INPUT TYPE="checkbox" NAME="agree" id="agree"> 
<p>

<INPUT TYPE="submit" value="보내기" onClick="return check()">
</FORM>
</body>
</html>
   

