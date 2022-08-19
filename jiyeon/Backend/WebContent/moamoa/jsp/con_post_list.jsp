<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="moamoa.post.PostDAO"%>
<%@page import="moamoa.post.PostDTO"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8"><!-- 한글 깨짐 오류 방지 -->
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
<!-- 팝업 게시글(레시피) 목록 화면 -->
            <div class="container">
            <h2 class="subtitle" id="sub1"style="padding-top:100px !important; ">계약 레시피 선택</h2>
                        <br>
				<%
					PostDAO dao = new PostDAO();
					List<PostDTO> result = dao.getAllPostDatas();
					//System.out.println(result.size());
				%>
				<!-- 게시글 목록 테이블 생성 -->
				<table style="text-align: center; border: 1px solid #dddddd ; width: 100%; height: 600px;">
				<thead>
					<tr>
						<th>제목</th>
						<th>날짜</th>
						<th>내용</th>
					</tr>
				</thead>
					<tbody>
						<%
						//게시글 목록 가져오기 및 연결
						for(int i=0; i< result.size(); i++){ //for문을 통해 테이블 추가 및 연결
						%>
							 <tr>
							 <td><a href="con_postDetail.jsp?postTitle=<%= result.get(i).getTitle()%>"><%=result.get(i).getTitle() %></a></td>
						     <td><%=result.get(i).getDate() %></td>
						     <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;max-width:280px; padding:20px;"><%=result.get(i).getContent() %></td>
						     </tr>
						<%	 
						} 
						%>
					</tbody>
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