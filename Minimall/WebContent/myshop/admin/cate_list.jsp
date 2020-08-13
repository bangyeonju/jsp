<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8"); %>
/myshop/admin/cate_list.jsp<br>
<%@include file="top.jsp" %>
<td colspan="6" valign="top">cate_list.jsp
<table border="1" align="center" width="500">
	<caption><b>카테고리 목록</b></caption>
<tr bgcolor="yellow">
	<th width="10%">번호</th>
	<th width="30%">카테고리 코드</th>
	<th width="50%">카테고리명</th>
	<th width="10%">삭제</th>
</tr>
<%
	
	CategoryDAO cdao = CategoryDAO.getInstance();
	ArrayList<CategoryBean> list = cdao.categoryList();
	if(list.size()==0){
		%>
		<tr>
			<td colspan="4" align="center">
				<b>등록된 카테고리가 없습니다.</b>
			</td>
		</tr>
		<%
	}
%>


<!-- 
for(int i =0;list.size();i++){
	CategoryBean cb = list.get(i);
	
		<tr>
		<td><%-- <%=cb.getCnum() %> --%></td>
		<td><%-- <%=cbean.getCode() %> --%></td>
		<td><%-- <%=cbean.getCname() %> --%></td>
		<td><a href="" >삭제</a></td>
	</tr>
	
}
 -->
 <%

for(CategoryBean cbean : list){
%>
	<tr>
		<td align="right"><%=cbean.getCnum() %></td>
		<td align="center"><%=cbean.getCode() %></td>
		<td align="center"><%=cbean.getCname() %></td>
		<td align="center"><a href="cate_delete.jsp?cnum=<%=cbean.getCnum()%>">삭제</a></td>
	</tr>
<% }%>

</table>

</td>
<%@include file="bottom.jsp" %>