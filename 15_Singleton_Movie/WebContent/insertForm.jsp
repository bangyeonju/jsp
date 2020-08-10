<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
td:first-child{
width:150px;
}
</style>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//alert(1);
	
	var isCheck=false;//중복체크 확인했을때
	var use;//가입하기 눌ㅇ렀을때도 중복체크 상태를 알기위해
	var isChange=false;//아이디상태가 변해쓰는지 안변했는지><
	
	$('#id_check').click(function(){
		//alert(2);
		isCheck=true;
		isChange=false;
		
		if($('input[name=id]').val()==""){
			alert("아이디를 입력하세영");
			return;
		}//if
		
		//화면의 일부만 바뀔떄 ajax
		$.ajax({ url:"id_check_proc.jsp",// url에 id값을 넘겨서 사용가능한지 안가능하지 확인을 한다 
				data:({
					userid:$('input[name=id]').val()//내가 입력한 id값
				}),
				success:function(data){
					if($.trim(data)=='YES'){//trim 공백제거하고
						$('#idmessage').html("<font color=red>사용가능합니다.</font>");
						$('#idmessage').show();
						use = "possible";
						
					}else{
						
						$('#idmessage').html("<font color=red>이미 사용중인 아이디입니다.</font>");//html
						$('#idmessage').show();
						use="impossible";
						
					}
					
				}
			
		});//ajax
	});//click
$('input[name=id]').keydown(function(){
	isChange=true;
	use="";
	$('#idmessage').css('display','none');
})	
$('#sub').click(function(){
	//alert(3);
	if(use=="impossible"){
		alert("이미사용중인아이디입니다.");
		return false;
	}
	else if(isCheck==false || isChange==true){
		alert("중복체크하세요");
		return false;
	}
	else if(('input[name=id]').val()==""){
		alert("아이디를 입력하세용");
		return false;
	}
});
	
	
});//ready
</script>

insertForm.jsp
<br>
<br>
<h2>영화 선호도 조사</h2>
<form action="inputProc.jsp" method="post">
	<table border="1" width="700px">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" value="IU"> <input
				type="button" id="id_check" value="중복체크"> <span
				id="idmessage" style="display: none">가나다라</span></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="아이유"></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" name="age" value="23"></td>
		</tr>
		<tr>
			<td>좋아하는 장르</td>
			<td><input type="checkbox" name="genre" value="공포">공포 <input
				type="checkbox" name="genre" value="다큐">다큐 <input
				type="checkbox" name="genre" value="액션">액션 <input
				type="checkbox" name="genre" value="애니메이션">애니메이션</td>

		</tr>

		<tr>
			<td>즐겨보는 시간대</td>
			<td><select name="time">

					<option value="08~10">08~10</option>
					<option value="10~12">10~12</option>
					<option value="12~14">12~14</option>
					<option value="14~16">14~16</option>
					<option value="16~18">16~18</option>
					<option value="18~20">18~20</option>

			</select></td>
		</tr>

		<tr>
			<td>동반 관객수</td>
			<td><input type="radio" name="partner" value="1">1 <input
				type="radio" name="partner" value="2">2 <input type="radio"
				name="partner" value="3">3 <input type="radio"
				name="partner" value="4">4</td>
		</tr>

		<tr>
			<td>영화관 개선사항</td>
			<td><textarea name="memo" cols="40" rows="3">value는 여기에 넣기</textarea>
			</td>
		</tr>
		<tr align="center">
			<td colspan="2"><input type="submit" value="가입하기" id="sub">
			</td>
		</tr>
	</table>
</form>
