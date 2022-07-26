<%@page import="moamoa.signup.SignupDAO"%>
<%@page import="moamoa.signup.SignupDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
</head>
<body>

<%



	String id = request.getParameter("join_id");
	String password = request.getParameter("join_pw");
	String password1 = request.getParameter("join_pw1");
	String name = request.getParameter("join_name");
	String cell1 = request.getParameter("join_cell1");
	String cell2 = request.getParameter("join_cell2");
	String cell3 = request.getParameter("join_cell3");
	String email0 = request.getParameter("Join_email0");
	String email1 = request.getParameter("Join_email1");
	
	SignupDTO dto=new SignupDTO();
	
	dto.setJoin_id(id);
	dto.setJoin_pw(password);
	dto.setJoin_pw1(password1);
	dto.setJoin_name(name);
	dto.setJoin_cell1(cell1);
	dto.setJoin_cell2(cell2);
	dto.setJoin_cell3(cell3);
	dto.setJoin_email0(email0);
	dto.setJoin_email1(email1);
	
	SignupDAO dao = new SignupDAO();
	dao.signuplnsert(dto);
	response.sendRedirect("../indpage/ind_signup_step3.html");
	
	/* if(dao.loginCheckId(id)){
		out.println("<script>");
		out.println("alert('아이디가 중복됩니다. 다른 아이디를 선택해주세요')");
		//out.println("location.href='ind_signup_step2.html'");
		out.println("</script>");
	}
	else  */
	if(password.equals(password1)){
		out.println("<script>");
		//out.println("alert('사용 가능한 아이디입니다.')");
		out.println("location.href='ind_signup_step3.html'");
		out.println("</script>");
		dao.signuplnsert(dto);
		System.out.println("signup.jsp 값 넣기 성공");
	}
	else{
		out.println("<script>");
		out.println("alert('비밀번호가 일치하지 않습니다.')");
		//out.println("location.href='ind_signup_step2.html'");
		out.println("</script>");
		System.out.println(password + "-" + password1);
	}
	//==
	
%>
<script>
window.close();
</script>

</body>
</html>