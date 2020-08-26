<%@page import="java.io.File"%>
<%@page import="yj.food.FoodDao"%>
<%@page import="yj.food.FoodBean"%>
<%@page import="yj.kind.KindBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="yj.kind.KindDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file = "top.jsp" %>
<form action="food_updateProc.jsp" method="post" enctype="multipart/form-data">
<% request.setCharacterEncoding("UTF-8"); %>
<table border="1" align="center">
<%
int pnum = Integer.parseInt(request.getParameter("pnum"));
FoodDao fdao = FoodDao.getInstance();
ArrayList<FoodBean> fb = fdao.selectFood(pnum);
%>
	<tr>
		<td>
		<%=fb.get(0).getPnum() %>
		<input type="hidden" name="pnum" size="10" value="<%=fb.get(0).getPnum()%>">
		</td>
	</tr>
	<tr>	
		
		<th>종류</th>
		<td><select name="pkind_fk">
			<%
			 KindDao kdao = KindDao.getInstance();
			 ArrayList<KindBean> list = kdao.selectKind();
			 
			 if(list.size()==0){
				 %>
				 <option value="">종류가 없습니다.</option>
				 <%
			 } else{
				 for(KindBean kb : list){
					 %>
					 <option value="<%=kb.getFcode()%>"><%=kb.getFcode()%></option>
					 <%
				 }
			 }
			%>
		</select>
		</td>
	</tr>
	
	

	<tr>
		<th>이름</th>
		<input type="hidden" name="pkind_fk" size="10" value="<%=fb.get(0).getPkind_fk()%>"disabled >
		<td><input type="text" name="pname" size="10" value="<%=fb.get(0).getPname()%>"></td>
	</tr>


	<tr>
		<th>가격</th>
		<td><input type="text" name="price" size="10" value="<%=fb.get(0).getPrice() %>"></td>
	</tr>

	<tr>
		<th>수량</th>
		<td><input type="text" name="pqty" size="10" value="<%=fb.get(0).getPqty()%>"></td>
	</tr>


	<tr>
		<th>이미지</th>
		<td>
		<%
		String imgFolder = request.getContextPath() +"/yshop/images";
		String configFolder = config.getServletContext().getRealPath("/yshop/images");
		%>
			<img src="<%=imgFolder%>/<%=fb.get(0).getPimage()%>" width="100" height="100">
			<input type="file" name="pimage">
		<%
		//System.out.print(fb.get(0).getPimage());
		if(fb.get(0).getPimage() !=null){
			File existFile= new File(configFolder,fb.get(0).getPimage());
			if(existFile.exists()){
				%>
				<input type="text" name ="old_pimage" value="<%=fb.get(0).getPimage() %>">
				<%
			} else{
				fdao.updatePimage(pnum);
			}
		}
		
		%>
		</td>
	</tr>


	<tr>
		<th>상품스펙</th>
		<td><select name="pspec">
				<option value="NORMAL" <% if(fb.get(0).getPspec().equals("NORMALL")){%>selected<%}%>>::NORMAL::</option>
				<option value="HIT" <% if(fb.get(0).getPspec().equals("HIT")){%>selected<%}%>>HIT</option>
				<option value="NEW" <% if(fb.get(0).getPspec().equals("NEW")){%>selected<%}%>>NEW</option>
				<option value="BEST" <% if(fb.get(0).getPspec().equals("BEST")){%>selected<%}%>>BEST</option>
		</select></td>

	</tr>
	<tr>
		<th>포인트</th>
		<td><input type="text" name="point" size="10" value="<%=fb.get(0).getPoint()%>"></td>
	</tr>
	
	<tr>
		<th>설명</th>
		<td><textarea name="pcontent" cols="50" style="resize: none"; rows="10"><%=fb.get(0).getPcontent() %></textarea>
		</td>
	</tr>
	<tr>
	<td colspan="2"><input type="submit" value="저장"></td>
	</tr>
</table>
</form>