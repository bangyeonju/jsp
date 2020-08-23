<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.MovieBean" %>    

<jsp:useBean id="dao"  class="DTO.MovieDao" />

<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	MovieBean movie = dao.getMovieByNum(num); 
%>
	<h2>영화 정보 수정</h2>
	<form action="updateProc.jsp" method="post" name="myform">
	<input type="hidden" name="num" value="<%=num%>"><br>
	<table border="1">
	<tr>
		<td>아이디</td>
		<td> <%=movie.getId() %></td>
	</tr>
	<tr>	
		<td>이름</td>
		<td> <input type="text" name="name" value="<%=movie.getName() %>"></td>
	</tr>
		
	<tr>
		<td>나이</td><td><input type="text" name="age" value="<%=movie.getAge() %>"></td>
	</tr>
		<tr>
			<td>
		
				좋아하는 장르 :
			</td>
			<td>
				<input type="checkbox" name="genre" value="공포" <%if(movie.getGenre().contains("공포")) { %> checked <%} %>>공포
				<input type="checkbox" name="genre" value="다큐" <%if(movie.getGenre().contains("다큐")) { %> checked <%} %>>다큐 
				<input type="checkbox" name="genre" value="액션" <%if(movie.getGenre().contains("액션")) { %> checked <%} %>>액션 
				<input type="checkbox" name="genre" value="애니메이션" <%if(movie.getGenre().contains("애니메이션")) { %> checked <%} %>>애니메이션 
			</td>
		</tr>

		<tr>
			<td>
		즐겨보는 시간대 : </td>
			<td>
			
		<select name="time">
			<option value="08~10" <% if((movie.getTime()).equals("08~10")) {%> selected <% } %>> 08~10</option>
			<option value="10~12" <% if((movie.getTime()).equals("10~12")) {%> selected <% } %>> 10~12</option>
			<option value="12~14" <% if((movie.getTime()).equals("12~14")) {%> selected <% } %>> 12~14</option>
			<option value="14~16" <% if((movie.getTime()).equals("14~16")) {%> selected <% } %>> 14~16</option>
			<option value="16~18" <% if((movie.getTime()).equals("16~18")) {%> selected <% } %>> 16~18</option>
			<option value="18~20" <% if((movie.getTime()).equals("18~20")) {%> selected <% } %>> 18~20</option>
		</select>
		
		
		</td>
		</tr>
		<tr>
			<td>동반 관객수 : </td>
			<td>
				<input type="radio" name="partner" value="1" <%if(movie.getPartner()==1) {%> checked <%} %>>1
				<input type="radio" name="partner" value="2" <%if(movie.getPartner()==2) {%> checked <%} %>>2 
				<input type="radio" name="partner" value="3" <%if(movie.getPartner()==3) {%> checked <%} %>>3 
				<input type="radio" name="partner" value="4" <%if(movie.getPartner()==4) {%> checked <%} %>>4 
				<input type="radio" name="partner" value="5" <%if(movie.getPartner()==5) {%> checked <%} %>>5 
			</td>
		
		</tr>
		<tr>
			<td>영화관 개선사항</td>
			<td>
			<textarea name="memo" cols="40" rows="3"><%if(movie.getMemo()!=null){%><%=movie.getMemo() %><%}%></textarea></td>
		</tr>
		<tr align="center">
			<td colspan="2"><input type="submit" value="수정하기"></td>
		</tr>
		</table>
	
	</form> 
</body>
</html>
