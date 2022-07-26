<%@page import="moamoa.signup.SignupDAO"%>
<%@page import="moamoa.signup.SignupDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("join_id");
	
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