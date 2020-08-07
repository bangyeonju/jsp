<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
insertForm.jsp<br><br>
  
	<h2>영화 선호도 조사 </h2>
	<form action="inputProc.jsp" method="post">
		<table border="1" width="700px">
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="id" value="IU">
			</td>  
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
			<td>
			
				<input type="checkbox" name="genre" value="공포">공포
				<input type="checkbox" name="genre" value="다큐">다큐 
				<input type="checkbox" name="genre" value="액션">액션 
				<input type="checkbox" name="genre" value="애니메이션">애니메이션
			
			</td>
			
		</tr>

		<tr>
			<td>즐겨보는 시간대</td>
			<td>
				<select name="time">
				
					<option value="08~10">08~10</option>
					<option value="10~12">10~12</option>
					<option value="12~14">12~14</option>
					<option value="14~16">14~16</option>
					<option value="16~18">16~18</option>
					<option value="18~20">18~20</option>
				
				</select>
			</td> 
		</tr>
		
		<tr>
			<td>동반 관객수</td>
			<td> 
			
				<input type="radio" name="partner" value="1">1
				<input type="radio" name="partner" value="2">2 
				<input type="radio" name="partner" value="3">3 
				<input type="radio" name="partner" value="4">4
			
			</td>
		</tr>
		
		<tr>
			<td>영화관 개선사항</td>
			<td>
				<textarea name="memo" cols="40" rows="3">value는 여기에 넣기</textarea> 
			</td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<input type="submit" value="가입하기" id="sub">
			</td>
		</tr>
		</table>
	</form>
