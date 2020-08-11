
function writeSave(){
	if($('input[name=writer]').val()==""){
		alert("작성자를 입력하세여");
	$('input[name=writer]').focus();
	return false;
	}
	
	if($('input[name=subject]').val()==""){
		alert("제목을 입력하세여");
	$('input[name=subject]').focus();
	return false;
	}
	
	if($('input[name=email]').val()==""){
		alert("email을 입력하세여");
	$('input[name=email]').focus();
	return false;
	}
	if($('#abc').val()==""){
		alert("내용을 입력하세여");
	$('#abc').focus();
	return false;
	}
	
	if($('input[name=passwd]').val()==""){
		alert("비밀번호를  입력하세여");
	$('input[name=passwd]').focus();
	return false;
	}

}