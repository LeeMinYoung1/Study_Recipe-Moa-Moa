<%@page import="moamoa.signup.SignupDAO"%>
<%@page import="moamoa.signup.SignupDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"><!-- 한글 깨짐 오류 방지 -->
<title>Insert title here</title>
</head>
<body>
<!-- 회원가입 시 아이디 중복 체크 기능 -->
<%
	//회원가입한 아이디가 중복되는지 구분하기
	String id = request.getParameter("join_id");//전달 값 가져오기
	
	SignupDTO dto=new SignupDTO();
	
	dto.setJoin_id(id);

	SignupDAO dao = new SignupDAO();
	
	
	
	if(dao.loginCheckId(id)){
		out.println("<script>");
		out.println("alert('아이디가 중복됩니다. 다른 아이디를 선택해주세요')");
		//out.println("location.href='../indpage/ind_signup_step2.html'");
		out.println("window.history.back()");
		out.println("</script>");
		//response.sendRedirect("../indpage/ind_signup_step2.html");
		System.out.println("confirmID.jsp아이디중복");
	}else{
		out.println("<script>");
		out.println("alert('사용 가능한 아이디입니다.')");
		//out.println("location.href='../indpage/ind_signup_step2.html'");
		out.println("window.history.back()");
		out.println("</script>");
		System.out.println("confirmID.jsp아이디중복 사용 가능");
	}
%>
<script>
window.close();
</script>
</body>
</html>