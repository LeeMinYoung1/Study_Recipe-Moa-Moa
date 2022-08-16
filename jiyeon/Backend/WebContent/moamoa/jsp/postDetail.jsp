<%@page import="moamoa.post.PostDTO"%>
<%@page import="moamoa.post.PostDAO"%>
<%@page import="moamoa.comment.CommentDTO"%>
<%@page import="moamoa.comment.CommentDAO"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Recipe Moa Moa</title>
        <link
            href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
            rel="stylesheet">

        <!-- CSS Styles -->
        <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="https://use.typekit.net/puo4qmu.css">
        <link rel="stylesheet" href="../css/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="../css/mypage/mypage.css">
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <link rel="stylesheet" type="text/css" href="../css/login_signup/signup.css">
        <link
            href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100;200;300;400;500;600;700;800;900&display=swap"
            rel="stylesheet">
        <!-- luna herina script start -->
        <script type="text/javascript">
            !function (h, e, a, r, i, n, c) {
                c = function () {};
                i = e.createElement(a);
                i.async = !0;
                i.src = r;
                i.onload = c;
                n = e.getElementsByTagName(a)[0];
                n
                    .parentNode
                    .insertBefore(i, n);
                if (h.hearinaJs) {
                    c();
                    return;
                }
            }(window, document, 'script', '//cdn.hearina.com/js/luna_hearina_v.0.4.js');
        </script>

    </head>
<body>
<!-- 게시글(레시피) 상세 보기 화면 -->
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
                                <div class="header__top__right__auth">
                                    <a href="../개인페이지/ind_login.html">
                                        <i class="fa fa-user"></i>
                                        </a>
                                </div>
                                <div class="header__top__right__auth">
                                    <a href="../기업로그인회원가입페이지/corp_login.html">
                                        </a>
                                </div>
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
                                <form action="#">
                                    <div class="hero__search__categories">
                                        카테고리
                                        <span class="arrow_carrot-down"></span>
                                    </div>
                                    <input type="text" placeholder="무엇이 필요하신가요?">
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
            <div class="container">
            <h2 class="subtitle" id="sub1"style="padding-top:100px !important; ">레시피</h2>
                        <br>
				<%
					//DAO를 통해 게시글 연결
					request.setCharacterEncoding("utf-8");
					String post_title=request.getParameter("postTitle");
					PostDTO dto = new PostDAO().getPost(post_title);
					
					//System.out.println(result.size());
				%>
				<br>
				<!-- 게시글 상세 조회 테이블 생성 -->
				<table style="text-align: center; border: 1px solid #dddddd ; width: 100%; height: 500px;">
				
						 <tr>
						 	<td style="width: 10%;  height: 10%;">제목</td>
						 	<td><%=dto.getTitle() %></td>
						 </tr>
					     <br>
					     <tr>
					     	<td style="width: 10%;  height: 10%;">날짜</td>
					     	<td><%=dto.getDate() %></td>
					     </tr>
					     <br>
					     <tr>
					     	<td style="width: 10%;  height: 10%;">재료</td>
					     	<td><%=dto.getIngredient() %></td>
					     </tr>
					     <br>
					     <tr>
					     	<td>내용</td>
					     	<td><%=dto.getContent() %></td>
					     </tr>				    
				</table>
				<br>
				<hr>
				<div style="text-align:right;">
					<span class="box_btn w144 h45 fs15"><a href="./post_list.jsp">목록으로 돌아가기</a></span>
					<span class="box_btn w144 h45 fs15"><a href="../indcompage/post_write.html">글쓰기</a></span>
				</div>
				<hr>
				<form action="commentInfo.jsp">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<tr>	
							<input type="hidden" name="title" value="<%=dto.getTitle() %>">
							<td><input type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name="context"></td>
							<td><br><br><input type="submit"  value="댓글 작성"></td>
						</tr>
					</table>
				</form>
				<hr>
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; width:100%;">
					<tbody>
						<tr>
							<td>댓글</td>
						</tr>
					<tr>
						<%
							CommentDAO cdao = new CommentDAO();
							List<CommentDTO> result = cdao.commentSet(post_title);
							for(int i=0; i<result.size(); i++){//for문을 통해 테이블 추가 및 연결
						%>
						<div class="container">
							<div class="row">
								<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
									<tbody>
										<tr>
											<tr>
												<td><%=result.get(i).getPost_comment_writer()%></td>
												<td rowspan="2" style="padding:30px;"><%=result.get(i).getPost_comment_content() %></td>
											</tr>
											<tr>
												<td style="width: 10%;"><%=result.get(i).getPost_comment_wirte_date() %></td>
											</tr>
										</tr>
									</tbody>
								</table>			
							</div>
						</div>
						<%
							}
						%>
				</tr>
				</table>
			</div>
			
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.js"></script>    
            <script src="../js/bootstrap.min.js"></script>
            <script src="../js/jquery.nice-select.min.js"></script>
            <script src="../js/jquery-ui.min.js"></script>
            <script src="../js/jquery.slicknav.js"></script>
            <script src="../js/mixitup.min.js"></script>
            <script src="../js/owl.carousel.min.js"></script>
            <script src="../js/main.js"></script>
            <script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
            <script src="../js/jquery-ui.js"></script>
            <script type="text/javascript" src="../js/jquery.form.min.js"></script>
            <script type="text/javascript" src="../js/clipboard.js"></script>
    
            <script type="text/javascript" src="../js/swiper.min.js"></script>
            <script type="text/javascript" src="../js/slick.min.js"></script>
            <script type="text/javascript" src="../js/ion.rangeSlider.js"></script>
            <script type="text/javascript" src="../js/jquery.countdown.min.js"></script>
            <script type="text/javascript" src="../js/cookie.js"></script>
            <script type="text/javascript" src="../js/script.js"></script>
            <script type="text/javascript" src="../js/custom.js"></script>
            <script type="text/javascript" src="../js/goods.js"></script>
            <script type="text/javascript" src="../js/buy.js"></script>
            <script type="text/javascript" src="../js/member.js"></script>
            <script type="text/javascript" src="../js/order.js"></script>
            <script type="text/javascript" src="../js/site.js"></script>
            <script type="text/javascript" src="../js/giftCard.js"></script>
            <script type="text/javascript" src="../js/scm.js"></script>
            <script type="text/javascript" src="../js/review.js"></script>
        </body>
</html>