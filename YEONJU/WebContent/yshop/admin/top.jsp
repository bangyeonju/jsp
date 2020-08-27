<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <table  width="100%" cellspacing="0" >
    <tr>
    <td align="center">
    <img
			src="<%=request.getContextPath() %>/images/1.jpg" weight="500"
			height="150">
	</td>
    </tr>
    </table>
    
<table border="1" width="100%" cellspacing="0" align = "center" >

<tr>
<td><a href="kind_input.jsp">종류 추가</a></td>
<td><a href="kind_list.jsp">종류 목록보기</a></td>
<td><a href="food_input.jsp">상품 추가 </a></td>
<td><a href="food_list.jsp">상품 목록보기 </a></td>
<td><a href="<%=request.getContextPath() %>/yshop/display/main.jsp">사용자 페이지 </a></td>

</tr>
</table>