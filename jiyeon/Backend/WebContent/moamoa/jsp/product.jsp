<%-- <%@page import="kr.gov.dto.Product"%>
<%@page import="kr.gov.dao.ProductRepository"%> --%>
<%@page import="moamoa.product.ProductDTO"%>
<%@page import="moamoa.product.ProductDAO" %>
<%@page errorPage="exceptionNoProductId.jsp" %> <!-- id값이 유효하지 않으면 에러페이지로 이동시킨다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="productDAO" class="kr.gov.dao.ProductRepository" scope="session"/> --%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8"><!-- 한글 깨짐 오류 방지 -->
  <title>상품 상세 정보</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
</head>
<body>
<!-- 상품(밀키트) 상세보기 화면 -->
  <%--  <jsp:include page="menu.jsp"/> --%>
   <div class="jumbotron">
      <div class="contaner">
         <h1 class="display-3">상품 정보</h1>
      </div>
   </div>
   <%
      //넘어온 상품 아이디값을 얻었다.
      String title =request.getParameter("productTitle");//전달 값 가져오기
      //넘어온 상품아이디값을 이용해 실제 해당되는 Product객체를 얻음.
      ProductDTO product = new ProductDAO().getProductByTitle(title);
   %>
   <div class="container">
      <div class="row">
<%--          <div class="col-md-5">
            <img alt="" src="C:/workspace-jsp/upload/<%=product.getFilename() %>" style="width:100%">
            <img alt="" src="${pageContext.request.contextPath}/resources/images/<%=product.getMealkit_num() %>" style="width:100%">
         </div> --%>
         <div class="col-md-6">
        <!-- 해당하는 상품 가져오기 -->
            <h3><b>상품 이름 :</b><span class="badge badge-danger" ><%=product.getMealkit_title() %><span></b></h3>
            <p><b>주 재료 : </b><%=product.getMain_ingredient() %></p>
            <p><b>재고 수 : </b><%=product.getMealkit_count() %></p>
            <p><b>설명 : </b><%=product.getMealkit_content() %></p>
            
            <h4><%=product.getMealkit_price() %>원</h4>
            <p><form name="addForm" action="./cart.jsp" method="post">
            <!-- 상품 주문을 클릭하면 자바스크립트 핸들러 함수 addToCart()호출 -->
               <!-- <a href="#" class="btn btn-info" onclick="addToCart()">상품 주문&raquo;</a> -->
               <!-- 장바구니 버튼 추가, 클릭시 /cart.jsp로 이동함 -->
               <a href="./cart.jsp?productTitle=<%=product.getMealkit_title() %>" class="btn btn-warning">장바구니&raquo;</a>
               <a href="./products.jsp" class="btn btn-secondary">상품 목록&raquo;</a>
            </form>
            <!--
            <p><a href="addProduct.jsp" class="btn btn-info">상품 등록&raquo;</a></p>
            <a href="./products.jsp" class="btn btn-secondary">상품 목록&raquo;</a>
            -->
         </div>
      </div>
      <hr>
   </div>
   <%-- <jsp:include page="footer.jsp"/> --%>
   <script type="text/javascript">
      /* 장바구니에 추가하기 위한 헨들러 함수 */
      function addToCart() {
         if(confirm('해당 상품을 장바구니에 추가하겠습니까?')) {   /* confirm() : 사용자가 선택할 때 이용(확인, 취소) */
            document.addForm.submit();
         }
         else {
            document.addForm.reset();
         }
      }
   </script>
</body>
</html>