<%@page import="emart.emartDao"%>
<%@page import="emart.EmartBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<script type="text/javascript">
	function insert(){
		location.href="insertForm.jsp";//�̵� 
	}
	</script>
select.jsp�Դϴ�
<jsp:useBean id="dao" class="emart.emartDao" />
<%
ArrayList<EmartBean> lists = dao.getAllEmart(); 
%>
<form name="myform"> 
<input type="button" value="����" onClick="selectDelete()"> 
<input type="button" value="�߰�" onClick="insert()">
<table border="1">
	<tr>
		<th><input type="checkbox" name="allcheck" 
		onClick="allDelete(this)"></th>
		<th>��ȣ</th>
		<th>���̵�</th>
		<th>��й�ȣ</th>
		<th>��ǰ</th>
		<th>�ð���</th>
		<th>����</th>
		<th>����</th>
		<th>����</th>
		<th>����</th>


	</tr>
	<%
for( EmartBean bean : lists){
		%>
	<tr>
		<td></td>
		<td><%=bean.getNo() %></td>
		<td><%=bean.getId() %></td>
		<td><%=bean.getPw() %></td>
		<td><%=bean.getProduct() %></td>
		<td><%=bean.getTime() %></td>
		<td><%=bean.getApprove() %></td>
		<td><%=bean.getAgree() %></td>
		<td>����</td>
		<td>����</td>

	</tr>
	<%
	}
%>
</table>
</form>