var use = "";

function writeSave(){
//alert("1");
	if($('input[name=name]').val()==""){
		alert("이름을 입력해 주세요");
		$('input[name=name]').focus();
		return false;
	}
		
	if($('input[name=id]').val()==""){
		alert("아이디를 입력해 주세요");
		return false;
	}
	if($('input[name=password]').val()==""){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	if($('input[name=password2]').val()==""){
		alert("비밀번호확인을 입력해주세요");
		return false;
	}
	if($('input[name=password2]').val()!=$('input[name=password]').val()){
		alert("비밀번호가 다릅니다.");
		$('input[name=password]').focus();
		return false;
	}

	if($('input[name=email]').val()==""){
		alert("이메일을 입력해주세요");
		return false;
	}
	if($('input[name=phone]').val()==""){
		alert("전화번호를 입력해주세요");
		return false;
	}
	if(use=="impossible"){
		alert("이미 사용중인 아이디 입니다.");
		$('input[name=id]').focus();
		return false;
	}
}

function id_keyup(){
	$.ajax({
		url:"id_check_proc.jsp",
		data :({
			userid:$('input[name=id]').val()
		}),
		success : function(data){
			if($('input[name=id]').val()==""){
				$('#idmessage').html('<font color=red>아이디를 입력하세요</font>');
				$('#idmessage').show();
			} else if($.trim(data)=='YES'){
				$('#idmessage').html('<font color=blue>사용가능합니다.</font>');
				$('#idmessage').show();
				use="possible";
			}else {
				$('#idmessage').html('<font color=red>이미사용중입니다.</font>');
				$('#idmessage').show();
				use="impossible"//id가 사용중일때 가입하기 버튼 클릭시 writeSave()로 넘어가서 검사
			}
		}
	});
}

function passwd_keyup(){
	if($('input[name=password]').val()==$('input[name=password2]').val()){
		$('#pwmessage').html('<font color=blue>사용가능합니다.</font>');
		$('#pwmessage').show();
	} else{
		$('#pwmessage').html('<font color=red>비밀번호가 다릅니다.</font>');
		$('#pwmessage').show();
		//$('input[name=password]').focus();
		//return false;
	}
	
	
}//passwd_keyup()