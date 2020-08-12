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
		
		
	
	
	
}