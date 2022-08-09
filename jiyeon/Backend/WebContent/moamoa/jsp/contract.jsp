<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>밀키트 계약</title>
<script type="text/javascript">
	var openlist;
	function mealkit_list_open(){
		window.name = "parentForm";
		parentForm = window.open("con_post_list.jsp", "post_list", "width=800, height= 500, top=50, left=50");
	}

	let today = new Date();
	
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);

	var dateString = year + '-' + month  + '-' + day;
	document.getElementById("now_date").value = dateString;
</script>
</head>
<body>
	<div class="jumbotron"> 
		<div class="container">
			<h1 class="display-3">밀키트 계약</h1>
		</div>
	</div>
	<div class="container">
	<!--action="../jsp/postWrite.jsp"  -->
		<form method="post" class="form-horizontal" 
			action="contractInfo.jsp">
			<%-- <input type="hidden" name="cartId" value="${param.cartId}"> --%>
			<div class="form-group row">
				<label class="col-sm-2">계약 밀키트</label>
				<div class="col-sm-3">
					<input type="text" id="pInput" name="contract_code" class="form-control" readonly/>
					<!-- 선택할 레시피(게시글) 이동 (팝업 창 생성하기) -->
					<input type="button" name="name" class="form-control" onclick="mealkit_list_open();" value="레시피 선택" />
				</div>
			</div>
			<div class="form-group row">
			<%
			//현재 날짜 가져오기
			Date nowTime = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
			
			%>
			
				<label class="col-sm-2">계약일</label>
				<div class="col-sm-3">
					<input type="text" style="width: 90%; border-left-width:0; 　border-right-width:0; 　border-top-width:0; 　border-bottom-width:1;" id="now_date" name="now_date" class="form-control" value="<%= sf.format(nowTime) %>" readonly />
				</div>
			</div>	
			<br>
			<div class="form-group row">
				<label class="col-sm-2">계약 사항</label>
				<div class="col-sm-3">
					<input type="text" style="width: 90%;border-left-width:0; 　border-right-width:0; 　border-top-width:0; 　border-bottom-width:1;" name="contract_fact" class="form-control" />
				</div>
			</div>	
			<br>
			<div class="form-group row">
				<label class="col-sm-2">밀키트 값 설정</label>
				<div class="col-sm-3">
					<input type="text" style="width: 90%;border-left-width:0; 　border-right-width:0; 　border-top-width:0; 　border-bottom-width:1;" name="milkit_registration_amount" class="form-control" />
				</div>
			</div>
			<br>
			<div class="form-group row">
				<label class="col-sm-2">계약 금액</label>
				<div class="col-sm-3">
					<input type="text" style="width: 90%;border-left-width:0; 　border-right-width:0; 　border-top-width:0; 　border-bottom-width:1;" name="contract_amount" class="form-control" />
				</div>
			</div>
			<br>
			<div class="form-group row">
				<label class="col-sm-2">밀키트 수량</label>
				<div class="col-sm-3">
					<input type="text" style="width: 90%;border-left-width:0; 　border-right-width:0; 　border-top-width:0; 　border-bottom-width:1;" name="mealkit_count" class="form-control" />
				</div>
			</div>
			<div>
                                <p>
                                    <strong>제목 : </strong>
                                    <input type="text" name="mealkit_title" id="mealkit_title" placeholder="제목을 입력해주세요" style="width: 90%;">
                                </p>
                                <p>
                                    <strong>재료 : </strong>
                                    <input type="text" name="main_ingredient" id="main_ingredient" placeholder="재료를 입력해주세요 (예 : 사과, 바나나)" style="width: 90%;">
                                </p>
                                <p>
                                    <strong>내용 : </strong>
                                <textarea  name="mealkit_content" id="mealkit_content" rows="10" cols="100" style="width: 100%; height: 600px;"></textarea>
                                </p>
                                <hr>
                                <p>
                                    <strong>카테고리 : </strong>
                                    <select name="mealkit_sort" id="mealkit_sort">
                                        <option value="none">선택</option>
                                        <option value="korean_food">한식</option>           
                                        <option value="chinese_food">중식</option>
                                        <option value="japanese_food">일식</option>
                                        <option value="western_food">양식</option>
                                        <option value="dessert">디저트</option>
                                        <option value="etc">기타</option>
                                    </select>
                                </p>
                                <!-- <p>
                                    <strong>해시태그 : </strong>
                                    <input type="text" placeholder="해시태그를 입력하세요" style="width: 30%;">
                                    <input type="button" value="등록">
                                </p>
                                <p>
                                    <strong>첨부파일 : </strong>
                                    <input type="button" value="파일 선택">
                                    선택된 파일 없음
                                </p>
                                <p>
                                    <strong>링크 : </strong>
                                    <input type="text" placeholder="링크를 입력하세요" style="width: 30%;">
                                    <input type="button" value="등록">
                                </p> -->
                                <hr>
			<div class="form-group row">
				<div class="col-sm-offset2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록" />
				</div>
			</div>
		</form>
	</div>
</body>
</html>