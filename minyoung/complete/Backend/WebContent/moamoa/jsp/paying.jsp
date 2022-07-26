<%@page import="java.text.DecimalFormat"%>
<%-- <%@page import="kr.gov.dto.Product"%> --%>
<%@page import="moamoa.product.ProductDTO"%>
<%@page import="moamoa.product.ProductDAO" %>
<%@page import="moamoa.cart.CartDAO" %>
<%@page import="moamoa.cart.CartDTO" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>결제하기</title>
   <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
   <%
      //세션 ID값 가져오기
/*       String cartId = session.getId();
      DecimalFormat dFormat = new DecimalFormat("###,###");      //숫자를 천단위 구분 */
   %>
           <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="../css/style.css" type="text/css">

        <link rel="stylesheet" href="https://use.typekit.net/puo4qmu.css">
        <link rel="stylesheet" type="text/css" href="../css/mypage/mypage.css">
		


</head>
<body>
   <%-- <jsp:include page="menu.jsp"/> --%>
   <div class="jumbotron">
      <div class="container">
         <h1 class="display-3">결제하기</h1>
      </div>
   </div>
   <div class="container">
      <div class="row">
         <table width=100%>
            <tr>
               <%-- <td align="left"><a href="./deleteCart.jsp?cartId=<%= cartId %>" class="btn btn-danger">삭제하기</a></td> --%>
            </tr>
         </table>
      </div>
      <div style="padding-top: 50px;">
         <!-- table-hover : 마우스 포인터가 있는 행의 배경을 바꾸어 눈에 띄도록 만들어진 클래스 -->
         <table class="table table-hover">
         <thead>
            <tr>
               <th>상품</th>
               <th>가격</th>
               <th>수량</th>
               <th>소계</th>
               <th>비고</th>
            </tr>
            </thead>
            <tbody>
            <%
				String product = request.getParameter("productTitle");
				System.out.println(product);
           		ProductDAO Pdao = new ProductDAO();
           		CartDAO Cdao = new CartDAO();
           		
				ProductDTO presult = Pdao.getProductByTitle(product);
				Cdao.addCart(presult);
				ArrayList<CartDTO> result = Cdao.getCartByid("bu");
               //int sum = 0;
               //세션 속성의 이름이 cardList인 세션 정보(장바구니에 담긴 물품 목록)를 가져와서 ArrayList에 대입
              // ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cardList");
               /* cart.jsp 파일에서 전체상품을 삭제하는 deleteCard.jsp에서 session.invalidate()를 호툴하게 되면
                  cartList는 null이 되기 때문에 아래와 같은 코드가 반드시 필요함. */
               /* if(cartList == null) {
                  cartList = new ArrayList<>();
               } */
               //상품 리스트 하나씩 출력하기
              /*  for(int i = 0; i < cartList.size(); i++) {
                  Product product = cartList.get(i);
                  int total = product.getUnitprice() * product.getQuantity();
                  sum += total; */
                  int sum = 0;
                  for(int i = 0; i<result.size(); i++){
  					/* ProductDTO product = listOfProduct.get(i); */
  					System.out.println(i);
            %>
            <tr>
               <td><%= result.get(i).getMealkit_title() %></td>
               	<td><%=result.get(i).getMealkit_count() %></td>
				<td><%=result.get(i).getMealkit_price() %></td>
               <%-- <td><%= dFormat.format(product.getUnitprice()) %></td>
               <td><%= product.getQuantity() %></td>
               <td><%= dFormat.format(total) %></td>
               <td><a href="./removeCard.jsp?id=<%= product.getProductId() %>" class="badge badge-danger">삭제</a></td> --%>
            </tr>
            <%
            sum += result.get(i).getMealkit_count()*result.get(i).getMealkit_price();
                 
                  }
            %>
		<script type="text/javascript">
			function pay(){
<%-- 				alert('결제가 완료되었습니다. 메인 화면으로 돌아갑니다.');
				<%
           		Cdao.DeleteCartByid("test");
				%> --%>
				location.href="../mainpage/index.html"
			}
		</script>
            <tr>
               <th></th>
               <th></th>
               <th>총액: <%= sum %> </th>
               <%-- <th><%= dFormat.format(sum) %></th> --%>
               <th></th>
            </tr>
     	</tbody>
         </table>
         
                 <div class="order_info">
                        <div class="order_zone_tit">
                            <h4>주문자 정보</h4>
                        </div>

                        <div class="order_table_type">
                            <table class="table_left">
                                <colgroup>
                                    <col style="width:15%;">
                                    <col style="width:85%;">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row"><span class="important">주문하시는 분</span></th>
                                    <td><input type="text" name="orderName" id="orderName" value="" data-pattern="gdEngKor" maxlength="20"/>
                                    </td>
                                </tr>
                                <!-- <tr>
                                    <th scope="row">전화번호</th>
                                    <td>
                                        <input type="text" id="phoneNum" name="orderPhone" value="" maxlength="20" />
                                    </td>
                                </tr> -->
                                <tr>
                                    <th scope="row"><span class="important">휴대폰 번호</span></th>
                                    <td>
                                        <input type="text" id="mobileNum" name="orderCellPhone" value="" maxlength="20" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="important">이메일</span></th>
                                    <td class="member_email">
                                        <input type="text" name="orderEmail" value="" />
                                        <select id="emailDomain" class="chosen-select">
                                            <option value="self">직접입력</option>
                                            <option value="naver.com">@naver.com</option>
                                            <option value="hanmail.net">@hanmail.net</option>
                                            <option value="daum.net">@daum.net</option>
                                            <option value="nate.com">@nate.com</option>
                                            <option value="hotmail.com">@hotmail.com</option>
                                            <option value="gmail.com">@gmail.com</option>
                                            <option value="icloud.com">@icloud.com</option>
                                        </select>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                          <!-- //order_info -->

                    <div class="delivery_info">
                        <div class="order_zone_tit">
                            <h4>배송정보</h4>
                        </div>

                        <div class="order_table_type shipping_info">
                            <table class="table_left shipping_info_table">
                                <colgroup>
                                    <col style="width:15%;">
                                    <col style="width:85%;">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row">배송지 확인</th>
                                    <td>
                                        <div class="form_element" >
                                           
                                                <span>
                                                    <input type="radio" name="shipping" id="shippingBasic">
                                                    <label for="shippingBasic" class="choice_s">기본 배송지</label>
                                                </span>
                                                <span style="margin-left:10px;">
                                                    <input type="radio" name="shipping" id="shippingRecently">
                                                    <label for="shippingRecently" class="choice_s">최근 배송지</label>
                                                </span>
                                                <span style="margin-left:10px;">
                                                    <input type="radio" name="shipping" id="shippingNew">
                                                    <label for="shippingNew" class="choice_s">직접 입력</label>
                                                </span>
                                                <span style="margin-left:10px;">
                                                    <input type="radio" name="shipping" id="shippingSameCheck">
                                                    <label for="shippingSameCheck" class="choice_s">주문자정보와 동일</label>
                                                </span>
                                            
                                            <!-- <span class="btn_gray_list"><a href="#myShippingListLayer" class="btn_gray_small btn_open_layer js_shipping"><span>배송지 관리</span></a></span>
                                            <input type="hidden" class="shipping-delivery-visit" value="n" /> -->
                                        </div>
                                    </td>
                                </tr>
                                <!-- <tr>
                                    <th scope="row"><span class="important">받으실분</span></th>
                                    <td><input type="text" name="receiverName" data-pattern="gdEngKor" maxlength="20"/></td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="important">받으실 곳</span></th>
                                    <td class="member_address">
                                        <div class="address_postcode">
                                            <input type="text" name="receiverZonecode" readonly="readonly" />
                                            <input type="hidden" name="receiverZipcode"/>
                                            <button type="button" class="btn_post_search" onclick="gd_postcode_search('receiverZonecode', 'receiverAddress', 'receiverZipcode');">우편번호검색</button>
                                        </div>
                                        <div class="address_input">
                                            <input type="text" name="receiverAddress" readonly="readonly"/>
                                            <input type="text" name="receiverAddressSub" />
                                        </div>
										<label class="c-blue" id="isdawnLabel" style="display: block;margin-top: 50px;color: #329cff !important;"></label>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">전화번호</th>
                                    <td>
                                        <input type="text" id="receiverPhone" name="receiverPhone" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="important">휴대폰 번호</span></th>
                                    <td>
                                        <input type="text" id="receiverCellPhone" name="receiverCellPhone"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">배달 참고메시지</th>
                                    <td class="td_last_say"><input type="text" name="orderMemo"/></td>
                                </tr> -->
                    <!-- 배송방법 -->
							</tbody>
						</table>
                    </div>
                    
                                        <div class="payment_progress">
                        <div class="order_zone_tit">
                            <h4>결제수단 선택 / 결제</h4>
                        </div>

                        <div class="payment_progress_list">
                            <div class="js_pay_content">
                                <!-- N : 일반결제 시작 -->
                                <div id="settlekind_general" class="general_payment">
                                    <dl>
                                        <dt>일반결제</dt>
                                        <dd>
                                            <div class="form_element">
                                                <ul class="payment_progress_select">
                                                    <li id="settlekindType_pc">
                                                        <input type="radio" id="settleKind_pc" name="settleKind" value="pc"/>
                                                        <label for="settleKind_pc" class="choice_s">신용카드</label>
                                                    </li>
                                                    <li id="settlekindType_pb">
                                                        <input type="radio" id="settleKind_pb" name="settleKind" value="pb"/>
                                                        <label for="settleKind_pb" class="choice_s">계좌이체</label>
                                                    </li>
                                                    <li id="settlekindType_pv">
                                                        <input type="radio" id="settleKind_pv" name="settleKind" value="pv"/>
                                                        <label for="settleKind_pv" class="choice_s">가상계좌</label>
                                                    </li>
                                                    <li id="settlekindType_ph">
                                                        <input type="radio" id="settleKind_ph" name="settleKind" value="ph"/>
                                                        <label for="settleKind_ph" class="choice_s">휴대폰결제</label>
                                                    </li>
                                                    <li id="settlekindType_pk">
                                                        <input type="radio" id="settleKind_pk" name="settleKind" value="pk"/>
                                                        <label for="settleKind_pk" class="choice_s">카카오페이</label>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- //pay_bankbook_box -->

                                            <!-- 신용카드 컨텐츠 -->
                                            <div class="card" id="settlekind_general_pc"></div>
                                            <!-- //신용카드 컨텐츠 -->

                                            <!-- 계좌이체 컨텐츠 -->
                                            <div class="account-bank" id="settlekind_general_pb"></div>
                                            <!-- //계좌이체 컨텐츠 -->

                                            <!-- 가상계좌 컨텐츠 -->
                                            <div class="virtual-bank" id="settlekind_general_pv"></div>
                                            <!-- //가상계좌 컨텐츠 -->

                                            <!-- 휴대폰 컨텐츠 -->
                                            <div class="cellphone" id="settlekind_general_ph"></div>
                                            <!-- //휴대폰 컨텐츠 -->


                                        </dd>
                                    </dl>
                                </div>
                                <!-- //general_payment -->
                                <!-- N : 일반결제 끝 -->
         
        		 <input type="button" onclick="pay()" value="결제하기">
      </div>
      <hr/>
   </div>
   <%-- <jsp:include page="footer.jsp"/> --%>
</body>
</html>