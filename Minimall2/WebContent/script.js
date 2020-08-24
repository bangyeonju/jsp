var isCheck = false;
var isChange = false;
var use = "";

$(function(){
	
	$('input[name="id"]').keydown(function(){
		$('#idmessage').css('display','none');
		isChange = true;
		use="";
	});
	
	
});

function writeSave(){ // 
	if($('input[name="id"]').val()==""){
		alert("id를 입력하세요."); 
		$('input[name="id"]').focus();
		return false;
	}
	
	if(use == "impossible"){
		alert("이미 사용중인 아이디입니다.");
		return false;
	}
	
	if(isCheck == false || isChange == true){
		alert("중복체크 하세요");
		return false; 
	}
	
	
	
	if($('input[name="password"]').val()==""){
		alert("비번을 입력하세요.");
		$('input[name="password"]').focus();
		return false;
	}
	
	if(pwsame == "비번불일치"){
		alert("비번 불일치");
		return false;
	}
	
}//writeSave()


function duplicate(){ // 
	//alert("1");
	isCheck = true;
	isChange = false;
	
	$.ajax({
		url : "id_check_proc.jsp",
		data : ({
				userid:$('input[name="id"]').val() // userid=kim
		}),
		success : function(data){
			
			if($('input[name="id"]').val() == ""){
				$('#idmessage').html('<font color=red>id입력 누락</font>');
				$('#idmessage').show();
			}
			else if($.trim(data) == 'YES'){
				$('#idmessage').html('<font color=red>사용 가능합니다.</font>');
				$('#idmessage').show();
				use = "possible";
			}
			else{
				$('#idmessage').html('<font color=red>이미 사용중인 아이디입니다.</font>');
				$('#idmessage').show();
				use = "impossible";
				
			}
		}
	}); // ajax
	
} // duplicate()


function passwd_keyup(){
	//alert(2);
	
	if($('input[name=password]').val() == $('input[name=repassword]').val()){
		$('#pwmessage').html("<font color=red>비번일치</font>");
		$('#pwmessage').show();
		pwsame = "비번일치";
		
	}else{
		$('#pwmessage').html("<font color=red>비번 불일치</font>");
		$('#pwmessage').show();
		pwsame = "비번불일치";
	}
} // passwd_keyup의 끝
  


function pwcheck(){
	//alert("pwcheck()");
	
	var pw = document.forms[0].password.value; // abc 12a4
	
	var regexp = /^[a-z0-9]{3,8}$/i; // abc  1234
	
	if(!regexp.test(pw)){
		alert("비밀번호 형식이 틀렸습니다.");
		return false;
	}
	
	var chk_num = pw.search(/[0-9]/);  
	var chk_eng = pw.search(/[a-z]/i); 
	
	if(chk_num < 0 || chk_eng < 0){
		alert("비밀번호는 영문자 숫자 조합해 주세요.");
		return false;
	}
	
	//test() : true, false리턴 
	//search() : 위치를 리턴 , 못찾으면 -1리턴
	
}













