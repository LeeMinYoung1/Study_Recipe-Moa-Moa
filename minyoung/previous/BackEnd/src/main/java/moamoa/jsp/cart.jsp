<%@page import="java.text.DecimalFormat"%>
<%-- <%@page import="kr.gov.dto.Product"%> --%>
<%@page import="moamoa.product.ProductDTO"%>
<%@page import="moamoa.product.ProductDAO" %>
<%@page import="moamoa.cart.CartDAO" %>
<%@page import="moamoa.cart.CartDTO" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<html lang="zxx">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>RECIPE MOA MOA</title>

        <!-- Google Font -->
        <link
            href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
            rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="../css/" type="text/css">
        <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="../css/style.css" type="text/css">
        <!--로그인 팝업창 관련 css, jquery 코드-->
        <link rel="stylesheet" href="../css/inquire/inquire_style.css" type="text/css">
        <link rel="stylesheet" href="./css/inquire/inquire_default.css" type="text/css">
        <!--로그인 팝업창 div 코드 css 파일-->
        <link rel="stylesheet" href="../css/login_signup/logindiv_default2.css" type="text/css">
        <link rel="stylesheet" href="../css/login_signup/logindiv_style2.css" type="text/css">
        <link rel="stylesheet" href="../css/slide.css">
        <!-- <link rel="stylesheet" href="./resources/css/bootstrap.min.css"> -->
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script type>
$(document).ready(function(){
	
	$(".open").on('click',function(){
		$(".popup").show();
		$(".dim").show();
	});
	$(".popup .close").on('click',function(){
		$(this).parent().hide();
		$(".dim").hide();
	});
});
</script>
</head>
<body>
<!-- 장바구니 화면 -->
        <div class="humberger__menu__overlay"></div>
        <div class="humberger__menu__wrapper">
            <div class="humberger__menu__logo">
                <a href="#">RECIPE MOA MOA</a>
            </div>
            <div class="humberger__menu__cart">
                <ul>
                    <li>
                        <a href="../indcompage/wish_list.html">
                            <i class="fa fa-heart"></i>
                            <span>1</span></a>
                    </li>
                    <li>
                        <a href="../indcompage/order.html">
                            <i class="fa fa-shopping-bag"></i>
                            <span>3</span></a>
                    </li>
                </ul>
                <div class="header__cart__price">총 주문가격
                    <span>15000</span></div>
            </div>
            <div class="humberger__menu__widget">
                <div class="header__top__right__auth">
                    <a href="./login.html">
                        <i class="fa fa-user"></i>
                        로그인</a>
                </div>
            </div>
            <nav class="humberger__menu__nav mobile-menu">
                            <ul>
                                <li class="active">
                                    <a href="../mainpage/index.html">홈</a>
                                </li>
                                <li>
                                    <!-- <a href="../indcompage/shop_grid.html">밀키트</a> -->
                                    <a href="../jsp/products.jsp">밀키트</a>
                                </li>
                                <li>
                                    <!-- <a href="../indcompage/order.html">주문하기</a> -->
                                    <a href="../jsp/cart.jsp">주문하기</a>
                                </li>
                                <li>
                                    <a href="../jsp/post_list.jsp">게시판</a>
                                    <ul class="header__menu__dropdown">
                                        <li>
                                            <a href="../jsp/post_list.jsp">레시피</a>
                                        </li>
                                    </ul>
                                </li>
                              </ul>
            </nav>
            <div id="mobile-menu-wrap"></div>
            <div class="header__top__right__social">
                <a href="#">
                    <i class="fa fa-facebook"></i>
                </a>
                <a href="#">
                    <i class="fa fa-twitter"></i>
                </a>
                <a href="#">
                    <i class="fa fa-linkedin"></i>
                </a>
            </div>
            <div class="humberger__menu__contact">
                <ul>
                    <li>
                        <i class="fa fa-envelope"></i>
                        hello@bc.kr</li>
                    <li>10000이상 무료배송</li>
                </ul>
            </div>
        </div>
        <!-- Humberger End -->

        <!-- Header Section Begin -->
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="header__top__left">
                                <ul>
                                    <li>
                                        <i class="fa fa-envelope"></i>
                                        hello@bc.kr</li>
                                    <li>10000이상 무료배송</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="header__top__right">
                                <div class="header__top__right__social">
                                    <a href="#">
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                    <a href="#">
                                        <i class="fa fa-twitter"></i>
                                    </a>
                                    <a href="#">
                                        <i class="fa fa-linkedin"></i>
                                    </a>
                                </div>
                                <!-- <div class="header__top__right__auth">
                                    <a href="../개인페이지/ind_login.html">
                                        <i class="fa fa-user"></i>
                                        개인&nbsp;&nbsp;</a>
                                </div>
                                <div class="header__top__right__auth">
                                    <a href="../기업로그인회원가입페이지/corp_login.html">
                                        기업&nbsp;&nbsp;</a>
                                </div> -->
                                <div class="header__top__right__auth">
                                    <a href="../jsp/contract.jsp">
                                        운영자</a>
                                </div>
                                <div class="header__top__right__auth">
                                    <a>
                                        ← 로그인</a> <!--이민영- 로그인하는 곳인 것을 알 수 있게 화살표 추가-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="header__logo">
                            <a href="../mainpage/index.html"><img src="../img/logo2.png"></a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <nav class="header__menu">
                            <ul>
                                <li class="active">
                                    <a href="../mainpage/index.html">홈</a>
                                </li>
                                <li>
                                    <!-- <a href="../indcompage/shop_grid.html">밀키트</a> -->
                                    <a href="../jsp/products.jsp">밀키트</a>
                                </li>
                                <li>
                                    <!-- <a href="../indcompage/order.html">주문하기</a> -->
                                    <a href="../jsp/cart.jsp">주문하기</a>
                                </li>
                                <li>
                                    <a href="../jsp/post_list.jsp">게시판</a>
                                    <ul class="header__menu__dropdown">
                                        <li>
                                            <a href="../jsp/post_list.jsp">레시피</a>
                                        </li>
                                    </ul>
                                </li>
                              </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3">
                        <!-- <div class="header__cart">
                            <ul>
                                <li>
                                    <a href="../indcompage/wish_list.html">
                                        <i class="fa fa-heart"></i>
                                        <span>1</span></a>
                                </li>
                                <li>
                                    <a href="../indcompage/order.html">
                                        <i class="fa fa-shopping-bag"></i>
                                        <span>3</span></a>
                                </li>
                            </ul>
                            <div class="header__cart__price">총 주문가격
                                <span>15000</span></div>
                        </div> -->
                    </div>
                </div>
                <div class="humberger__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>

        <section class="hero">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="hero__categories">
                            <div class="hero__categories__all">
                                <i class="fa fa-bars"></i>
                                <span>카테고리</span>
                            </div>
                            <ul>
                                <li>
                                    <a href="../jsp/category.jsp?category_name=korean_food">한식</a>
                                </li>
                                <li>
                                    <a href="../jsp/category.jsp?category_name=western_food">양식</a>
                                </li>
                                <li>
                                    <a href="../jsp/category.jsp?category_name=japanese_food">일식</a>
                                </li>
                                <li>
                                    <a href="../jsp/category.jsp?category_name=chinese_food">중식</a>
                                </li>
                                <li>
                                    <a href="../jsp/category.jsp?category_name=dessert">디저트</a>
                                </li>
                                <li>
                                    <a href="../jsp/category.jsp?category_name=etc">기타</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="hero__search">
                            <div class="hero__search__form">
                                <form action="../jsp/search.jsp">
                                    <input type="text" name="search_keyword" placeholder="무엇을 검색하시겠습니까?">
                                    <button type="submit" class="site-btn">찾기</button>
                                </form>
                            </div>
                            <div class="hero__search__phone">
                                <div class="hero__search__phone__icon">
                                    <i class="fa fa-phone"></i>
                                </div>
                                <div class="hero__search__phone__text">
                                    <h5>010-1234-5678</h5>
                                    <span>매일 24시간 전화 가능</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
   <%-- <jsp:include page="menu.jsp"/> --%>

         <!-- <h1 class="display-3">장바구니</h1> -->
       <h2 class="subtitle" id="sub1"style="padding-top:100px !important; ">장바구니</h2>

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
         <table class="table table-hover"> <!-- 장바구니 상품 목록 테이블 생성 -->
            <tr>
               <th>상품</th>
               <th>가격</th>
               <th>수량</th>
               <th>소계</th>
               <th>비고</th>
            </tr>
            <%	
            	//DAO를 통한 장바구니 목록 불러오기 및 연결 
				String product = request.getParameter("productTitle");
	            ProductDAO Pdao = new ProductDAO();
	       		CartDAO Cdao = new CartDAO();
				if(product!=null){
					ProductDTO presult = Pdao.getProductByTitle(product);
					Cdao.addCart(presult);
				}
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
                  int sum=0;
                  for(int i = 0; i<result.size(); i++){//for문을 통해 테이블 추가 및 연결
  					/* ProductDTO product = listOfProduct.get(i); */
            %>
            <!-- 가져온 목록 출력하기 -->
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
            sum += result.get(i).getMealkit_count()*result.get(i).getMealkit_price();}
            %>
            <tr>
               <th></th>
               <th></th>
               <th>총액: <%= sum %></th>
               <%-- <th><%= dFormat.format(sum) %></th> --%>
               <th></th>
            </tr>
         </table>
<%--          <script type="text/javascript">				
	         function del(){
					var answer;
					answer = confirm("장바구니를 삭제하시겠습니까?");
					if(answer == true){
						location.href="./products.jsp"
						<%Cdao.DeleteCartByid("test");%>
					}
	         }
	      </script> --%>
         <!-- <input type="button" onclick="del()"  value="담은내용삭제"> -->
         <a href="./products.jsp" class="btn btn-secondary">쇼핑 계속하기 &raquo;</a>
         <input type="button" class="btn btn-secondary" onclick="location.href='./paying.jsp'"  value="결제하기">
      </div>
      <hr/>
   </div>
   <%-- <jsp:include page="footer.jsp"/> --%>
   <!-- Js Plugins -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.js"></script>    
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/jquery.nice-select.min.js"></script>
        <script src="../js/jquery-ui.min.js"></script>
        <script src="../js/jquery.slicknav.js"></script>
        <script src="../js/mixitup.min.js"></script>
        <script src="../js/owl.carousel.min.js"></script>
        <script src="../js/main.js"></script>
        <script src="../js/slide.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script>
            $(document).ready(function(){
                
                $(".open").on('click',function(){
                    $(".popup").show();
                    $(".dim").show();
                });
                $(".popup .close").on('click',function(){
                    $(this).parent().hide();
                    $(".dim").hide();
                });
            });
        </script>
</body>
</html>