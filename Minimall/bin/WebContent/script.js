var isCheck=false; //중복체크 누르면 true로 변경
var isChange=false;//키보드 누르면
var use = "";
$(function(){
	$('input[name=id]').keydown(function(){
		$('#idmessage').css('display','none');
		isChange=true;
		use="";
	})//키가 눌렸을때
});

//submit눌렀을때 writeSave()
function writeSave(){

   if($('input[name=id]').val()==""){
      alert("id를 입력하세요");
      $('input[name=id]').focus();
      return false;
   }
   
   if(use == "impossible"){
	   alert("이미사용중인 아이디 입니다.");
	   return false;//못넘어가게! false
	   
}
   if(isCheck==false ||isChange==true){
	   alert("중복체크하세요");
	   return false;
   }
   
   
   if($('input[name=password]').val()==""){
      alert("비밀번호를 입력하세요");
      $('input[name=password]').focus();
      return false;
   }
   if(pwsame=='비번불일치'){
		alert('비번불일치');
		return false; 
		
	}
   
   
}//writeSave

function duplicate(){
	isCheck=true;
	isChange=false;
	
	
		//화면의 일부만 변화시키고 싶을때 ajax함수 사용
		$.ajax({
			url : "id_check_proc.jsp",
			data : ({
				userid:$('input[name=id]').val()//userid=kim
		}), 
			success :function(data){
				if($('input[name=id]').val()==""){
					$('#idmessage').html('<font color=red> id입력누락.</font>');
					$('#idmessage').show();
				}
				
				else if($.trim(data)=='YES'){ //trim 공백제거
					$('#idmessage').html('<font color=red>사용가능합니다.</font>');
					$('#idmessage').show();
					use="possible";
				}
				else{
					$('#idmessage').html('<font color=red>이미 사용중인 아이디입니다.</font>');
					$('#idmessage').show();
					use= "impossible";
				}
			}
			
		});//ajax
	
}//duplicate


function passwd_keyup(){
//	alert(2);
	if($('input[name=password]').val() == $('input[name=repassword]').val()){
		$('#pwmessage').html('<font color=blue>사용가능합니다.</font>');
		$('#pwmessage').show();
		pwsame="비번일치";
	}else {
		$('#pwmessage').html('<font color=red>비밀번호가 다릅니다..</font>');
		$('#pwmessage').show();
		pwsame="비번불일치";
	}
	

}//passwd_keyup


//비밀번호 유효검사
function pwcheck() {
	//alert("pwcheck()");
	var pw = document.forms[0].password.value; 
	var regexp =/^[a-z0-9]{3,8}$/i;// i=>대소문 자 구별하지 않는다아.
	if(!regexp.test(pw)){
		alert("비밀번호 형식이 틀렸습니다.");
		return false;
	}

	var chk_num = pw.search(/[0-9]/);
	var chk_eng =pw.search(/[a-z]/i);
	
	if(chk_num < 0 || chk_eng<0) {
		
		alert("비밀번호는 영문자 숫자 조합해 주세요");
		return false;
	}
//	test(0) : true, flase 리턴!
//	search : 검색된 문자열에 위치를 리턴!
}












