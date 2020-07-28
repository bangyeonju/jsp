<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <!-- HttpServletRequest request= new h -->
  
<!--   request는 웹브라우저의 요청정보를 저장하고있는 객체 -->
  요청정보 전송방식 : <%=request.getMethod() %> <br>
  요청 URL : <%=request.getRequestURI() %><br>
  컨텍스트경로:<%=request.getContextPath() %><br>
  <br><br> 
 <form action="Ex01_result.jsp" >
 	이름 : <input type="text" name="name" id="n"  value="길동"><br>
 	나이 : <input type="text" name="age" id="a" value="20"><br>
 	주소 : <input type="text" name="addr" id="b" value="서울"><br>
 	
 	<!-- name에 value가 담긴다
 	name:길동
 	age:20
 	 -->
 	
 	<input type="submit" value="확인">
 </form>
<!-- class Person{
	private String name;
	private int age;
	public void setName(String name){
	this.name= name;
	}
	public String getName(){
	return name;
	}
}
Person per= new Person();
per.setName("길동");
 -->