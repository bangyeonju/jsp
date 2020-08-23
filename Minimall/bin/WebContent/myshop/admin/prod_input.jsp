<%@page import="my.shop.CategoryDAO"%>
<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/style.css">
prod_input.jsp
<br>

<%@include file="top.jsp"%>
<td colspan="6">
	<form name="myform" action="prod_input_proc.jsp" method="post" enctype="multipart/form-data">
		<table width="600" class="outline">
			<caption valign="top">
				<b>상품등록</b>

			</caption>
			<tr>
				<th class="m2">카테고리</th>
				<td><select name="pcategory_fk">
						<%
				CategoryDAO cdao = CategoryDAO.getInstance();
				ArrayList<CategoryBean> lists = cdao.categoryList();
				if(lists.size()==0){
					out.print("<option value=''>카테고리 없음</option>");
				}else{
						for(int i = 0;i<lists.size();i++){
							CategoryBean cb=lists.get(i);
							String code = cb.getCode();
							String cname = cb.getCname();
							%>
						<option value="<%=code %>"><%=cname%>[<%=code %>]</option> 
						<%
						}
				 }
						  %>

				</select></td>
			</tr>
			<tr>
				<th class="m2">상품명</th>
				<td><input type="text" name="pname" value="이름"></td>

			</tr>
			<tr>
				<th class="m2">상품코드</th>
				<td><input type="text" name="pcode" value="이름"></td>

			</tr>
			<tr>
				<th class="m2">제조회사</th>
				<td><input type="text" name="pcompany" value="이름"></td>

			</tr>
			<tr>
				<th class="m2">상품이미지</th>
				<td><input type="file" name="pimage"></td>

			</tr>
			<tr>
				<th class="m2">상품수량</th>
				<td><input type="text" name="pqty" value="3"></td>

			</tr>

			<tr>
				<th class="m2">상품가격</th>
				<td><input type="text" name="price" value="100"></td>

			</tr>
			<tr>
				<th class="m2">상품스펙</th>
				<td><select name="pspec">
						<option value="NORMAL">::NORMAL::</option>
						<option value="HIT">HIT</option>
						<option value="NEW">NEW</option>
						<option value="BEST">BEST</option>
				</select></td>

			</tr>
			<tr>
				<th class="m2" >상품소개</th>
				<td><textarea  cols="50" name="pcontents" style="resize: none"; rows="10">설명</textarea></td>

			</tr>
			<tr>
				<th class="m2">상품포인트</th>
				<td><input type="text" name="point" value="222"></td>

			</tr>
			<tr>

				<td colspan="2" align="center" class="m1"><input type="submit"
					value="상품등록"> <input type="reset" value="취소"></td>

			</tr>

		</table>
	</form> <%@include file="bottom.jsp"%>