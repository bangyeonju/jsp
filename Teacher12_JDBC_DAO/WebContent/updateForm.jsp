<%@page import="DTO.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
updateForm.jsp<br><br>
<jsp:useBean id="dao" class="DTO.BookDao"/>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	BookBean bean = dao.getBookByNo(no);  
%>

<%
	String[] kind = {"유료","무료"};
	String[] bookstore = {"교보문고","알라딘","yes24","인터파크"};
%>
	<h1>도서 정보 입력</h1>
	<form name="myform" action="updateProc.jsp" method="post">
		<input type="hidden" name="no" value="<%=bean.getNo()%>">
		<table border=1>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="<%=bean.getTitle()%>"></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="author" value="<%=bean.getAuthor()%>"></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="publisher" value="<%=bean.getPublisher()%>"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" value="<%=bean.getPrice()%>"></td>
			</tr>
			<tr>
				<td>입고일</td>
				<td><input type="date" name="buy"  value="<%=bean.getBuy()%>"> </td>
			</tr>

			<tr>
				<td>배송비</td>
				<td>
				<!-- 
				유료 <input type="radio" name="kind" value="유료"> 
				무료 <input type="radio" name="kind" value="무료" checked>
				 -->
				 <%
				 	for(int i=0;i<kind.length;i++){
				 %>
				 	<%=kind[i] %> <input type="radio" name="kind" value="<%=kind[i] %>" <%if(bean.getKind().equals(kind[i])) { %> checked <% }%> > 
				 <%	
				 	}
				 %>
				</td>
			</tr>
			<tr>
				<td>구입가능 서점</td>
			
				<td>
				<!-- 
				교보문고 <input type="checkbox" name="bookstore" value="kyobo">
				알라딘 <input type="checkbox" name="bookstore" value="aladin">
				yes24 <input type="checkbox" name="bookstore" value="yes24">
				인터파크 <input type="checkbox" name="bookstore" value="interpark">
				 -->
				<%
				 		for(int i=0;i<bookstore.length;i++){
				 			
				 	%>
				 		<%=bookstore[i] %>  <input type="checkbox" name="bookstore" value="<%=bookstore[i] %>" <%if(bean.getBookstore().contains(bookstore[i])) { %> checked <% } %>  >
				 	<%
				 		}
				 	%> 
				 
				</td>
				
			</tr>
			<tr>
				<td>보유수량</td>
				<td>
					<select name="count">
						<option value="선택">선택</option>
						<!-- 
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3" selected>3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						 -->
						 <%
						 	for(int i=1;i<=5;i++){
						%>
								<option value="<%=i%>" <%if(bean.getCount() == i){ %> selected <% } %> ><%=i%></option>
						<%						 		
						 	}
						 %>
					</select>
				</td>
			</tr>

		</table>
		<br> 
		<input type="submit" value="전송" onclick="return inputCheck()"> 
		<input type="reset"	value="취소">
	</form>


