<%@page import="my.shop.ProductDao"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.CategoryDAO"%>
<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/style.css">

<%
int pnum= Integer.parseInt(request.getParameter("pnum"));
ProductDao pdao= ProductDao.getInstance();
ArrayList<ProductBean> lists= pdao.productSelect(pnum); 
%>
<%@include file="top.jsp"%>
<td colspan="6">
	<form name="myform" action="prod_update_proc.jsp" method="post" enctype="multipart/form-data">
		<table width="600" class="outline"> 
			<caption valign="top">
				<b>상품등록</b>

			</caption>
			<tr>
				<th class="m2">카테고리</th>
				<td><input type= "text" name="pcategory_fk" value="<%=lists.get(0).getPcategory_fk()%>" disabled="disabled">
				<input type= "hidden" name="pcategory_fk" value="<%=lists.get(0).getPcategory_fk()%>" ></td>
			
			</tr>
			<tr>
				<th class="m2">상품명</th>
				<td><input type="text" name="pname" value="<%=lists.get(0).getPname()%>"></td>

			</tr>
			
			<tr>
				<th class="m2">제조회사</th>
				<td><input type="text" name="pcompany" value="<%=lists.get(0).getPcompany()%>"></td>

			</tr>
			<tr>
				<th class="m2">상품이미지</th>
				<td>
				
				<%
				String imgFolder=request.getContextPath() +"/myshop/images";
				
				%>
				<img src="<%=imgFolder%>/<%=lists.get(0).getPimage() %>">
				<input type="file" name="pimage"><!--새 이미지 담길장소  -->
				</td>

			</tr>
			<tr>
				<th class="m2">상품수량</th>
				<td><input type="text" name="pqty" value="<%=lists.get(0).getPqty()%>"></td>

			</tr>

			<tr>
				<th class="m2">상품가격</th>
				<td><input type="text" name="price" value="<%=lists.get(0).getPrice()%>"></td>

			</tr>
			<tr>
				<th class="m2">상품스펙</th>
				<td><select name="pspec">
                  <option value="NORMAL" <%if(lists.get(0).getPspec().equals("NORMAL")){%>selected<%}%>>::NORMAL::</option>
                  <option value="HIT" <%if(lists.get(0).getPspec().equals("HIT")){%>selected<%}%>>HIT</option>
                  <option value="NEW" <%if(lists.get(0).getPspec().equals("NEW")){%>selected<%}%>>NEW</option>
                  <option value="BEST" <%if(lists.get(0).getPspec().equals("BEST")){%>selected<%}%>>BEST</option>
               </select></td>

			</tr>
			<tr>
				<th class="m2" >상품소개</th>
				<td><textarea  cols="50" name="pcontents" style="resize: none"; rows="10"><%=lists.get(0).getPcontents()%></textarea></td>

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
