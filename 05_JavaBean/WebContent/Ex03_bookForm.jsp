<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript"> -->
<script type="text/javascript"></script>

<script src="jquery.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	
});

function inputCheck(){
	
	
	if($('input[name=title]').val()==""){
		alert("제목누락");
		return false;
	}
	
	if($('input[name=author]').val()==""){
		alert("작가누락");
		return false;
	}
	
	if($('input[name=publisher]').val()==""){
		alert("출판사누락");
		return false;
	}
	

	if($('input[name=price]').val()==""){
		alert("가격누락");
		return false;
	}
	if(isNaN($('input[name=price]').val())){
		alert("숫자만");
		return false;
	}
	if($('input[name=date]').val()==""){
		alert("입고일");
		return false;
	}
	
	
	
	 if($('input[name=bookstore]:checked').length==0) {
		alert("서점을 선택해주세용");
		return false;
	}
	
	if(!$('input[name=kind]:checked').is(":checked")){
		alert("배송비를 선택해주세요");
		return false;
	} 
	

	if($('select[name=count] option:selected').val()=="선택"){
		alert("보유수량 선택해주세요");
		return false;
	}  

	
	
	
	
	
	
	
	alert(str);
}
</script>
</head>
<body>  
	<h1>도서 정보 입력</h1>
	<form name="myform" action="Ex03_bookResult.jsp" method="post">
		<table border=1>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="author">
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="publisher">
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price">
			</tr>
			<tr>
				<td>입고일</td>
				<td><input type="date" name="date">
			</tr>

			<tr>
				<td>배송비</td>
				<td>유료 <input type="radio" name="kind" value="유료"> 
					무료 <input type="radio" name="kind" value="무료">
			</tr>
			<tr>
				<td>구입가능 서점</td>
				<td>교보문고 <input type="checkbox" name="bookstore" value="kyobo">
					알라딘 <input type="checkbox" name="bookstore" value="aladin">
					yes24 <input type="checkbox" name="bookstore" value="yes24">
					인터파크 <input type="checkbox" name="bookstore" value="interpark">
			</tr>
			<tr>
				<td>보유수량</td>
				<td><select name="count" id="count">
						<option value="선택">선택
						<option value="1">1
						<option value="2">2
						<option value="3">3
						<option value="4">4
						<option value="5">5
				</select></td>
			</tr>

		</table>
		<br> <input type="submit" value="전송" onclick="return inputCheck()"> 
		<input type="reset"	value="취소">
	</form>
</body>
</html>

<!-- 
제목 누락 체크
저자 누락 체크
출판사 누락 체크
가격 누락 체크
가격은 숫자만 입력 가능
입고일 누락 체크
배송비  누락 체크
서점  누락 체크 : 1개는반드시 선택, 실제로2개이상 선택
보유수량 누락 체크
입력한 모든것 alert에 출력하고 jsp로 넘어가기

 -->
 
 