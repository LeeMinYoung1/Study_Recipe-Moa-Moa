<%@page import="moamoa.post.PostDTO"%>
<%@page import="moamoa.post.PostDAO"%>
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
            <div class="container">
            <h2 class="subtitle" id="sub1"style="padding-top:100px !important; ">레시피</h2>
                        <br>
				<%
					String post_title=request.getParameter("postTitle");
					PostDTO dto = new PostDAO().getPost(post_title);
					
					//System.out.println(result.size());
				%>
		<script type="text/javascript">
			function setText(){
				var title = "<%=dto.getTitle() %>";
				var ingredient = "<%=dto.getIngredient() %>";
				<%-- var content = "<%=dto.getContent() %>"; --%>
				<%-- var category = "<%=dto.getCategory() %>";  --%>
				
				opener.document.getElementById("pInput").value =title;
				opener.document.getElementById("mealkit_title").value = title;
				opener.document.getElementById("main_ingredient").value = ingredient;
				
				/* opener.document.getElementById("mealkit_content").innerHTML= content;
				opener.document.getElementById("mealkit_sort").value = category; */
				window.close();
			}
		</script>
				<br>
				<table style="text-align: center; border: 1px solid #dddddd ; width: 100%; height: 600px;">
				
						 <tr>
						 	<td>제목</td>
						 	<td id="title" value="<%=dto.getTitle() %>"><%=dto.getTitle() %></td>
						 </tr>
					     <br>
					     <tr>
					     	<td>날짜</td>
					     	<td><%=dto.getDate() %></td>
					     </tr>
					     <br>
					     <tr>
					     	<td>재료</td>
					     	<td><%=dto.getIngredient() %></td>
					     </tr>
					     <br>
					     <tr>
					     	<td>내용</td>
					     	<td><%=dto.getContent() %></td>
					     </tr>
					     <br>
				</table>
					<input type="button" id="Input" class="box_btn w144 h45 fs15" value="계약하기" onclick="setText()">
					
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