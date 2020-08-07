<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
updateProc.jsp<br><br>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="emart.EmartDao"/>
<jsp:useBean id="eb" class="emart.EmartBean"/>
<jsp:setProperty name="eb" property="*"/>

<%
	System.out.println(eb.getId());
	System.out.println(eb.getProduct());
	System.out.println(eb.getTime());
	System.out.println(eb.getApprove());
%>

<%
	if(eb.getProduct() == null){
		eb.setProduct("선택항목없음");
		
	} else{
		String[] product = request.getParameterValues("product");
		String str="";
		for(int i=0;i<product.length;i++){
			str += product[i]+" "; // str=의류 도서 
		}
		eb.setProduct(str);
	}


	if(eb.getApprove() == null){
		eb.setApprove("결재X");
	}

	
	if(eb.getAgree() == null){
		eb.setAgree("동의안함");
	}
	else if(eb.getAgree().equals("on")){
		eb.setAgree("동의함");
	}
	
	
	
	
	int cnt = dao.updateData(eb);  
	if(cnt == 1){
		response.sendRedirect("select.jsp");
	}
	else{
		response.sendRedirect("updateForm.jsp");
	}
%>

