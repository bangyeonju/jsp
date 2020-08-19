<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mall_top.jsp" %>

<script type="text/javascript">

   function goCart(num){
//      alert("goCart");
      var pnum = num;
      oqty = document.f.oqty.value;
      if(oqty==null || oqty<=0){
         alert("상품갯수에 0보다 큰 수를 입력하세요");
         return;
      }
      location.href="<%=request.getContextPath()%>/myshop/display/mall_cartAdd.jsp?pnum="+pnum+"&oqty="+oqty;
      
      
   }//goCart

   function goOrder(){
      
      alert("goOrder");
      
   }//goOrder

</script>



<%
   int pnum = Integer.parseInt(request.getParameter("pnum"));
   ProductDao pdao = ProductDao.getInstance();
   ArrayList<ProductBean> plists = pdao.getProductByNum(pnum);
   DecimalFormat df = new DecimalFormat("###,###"); 
%>
   <table class="outline" width="100%">
<%   
   for(ProductBean pb : plists){
      
      String imgPath = request.getContextPath()+ "/myshop/images/" + pb.getPimage();
%>
      <tr>
         <th colspan="2" align="center" class="m1">
            <font color="green" size=3>[<%=pb.getPname()%>] 상품 정보</font>
         </th>
      </tr>
      <tr>
         <td class="m3" align="center" >
            <img src="<%=imgPath %>"  width="200" height="200">
         </td>
         <td class="m3">
            <form name="f" method="post" >
               상품번호 : <%=pb.getPnum() %><br>
               상품이름 : <%=pb.getPname() %><br>
               상품가격 : <font color="red"><%=df.format(pb.getPrice()) %></font>원 <br>
               상품포인트 : <font color="red">[<%=pb.getPoint() %>]</font> point <br>
               상품 갯수:   <input type="text" name="oqty" value="1" size="2" maxlength="2">개 <br><br>
               
                  <table width="90%" align="center" >
                     <tr>
                        <td>                  
                           <a href="javascript:goCart(<%=pb.getPnum() %>)" ><img src="<%=request.getContextPath()%>/myshop/images/cartbtn.gif" width="90" height="35"></a>
                        </td>
                        <td>                  
                           <a href="javascript:goOrder()" ><img src="<%=request.getContextPath()%>/myshop/images/orderbtn.gif" width="90" height="35"></a>
                        </td>
                     </tr>
                  </table>
               </form>
         </td>
      </tr>   
      
      <tr height="200">
         <td colspan="2" valign="top">
            <b>상품 상세 설명</b><br>
            <%=pb.getPcontents() %>
         </td>
      </tr>
   
   </table>
<%      
            
      
   }//for
%>





<%@ include file="mall_bottom.jsp" %>