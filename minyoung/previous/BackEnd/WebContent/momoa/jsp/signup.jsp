<%@page import="moamoa.signup.SignupDTO"%>
<%@page import="moamoa.signup.SignupDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>\
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- infoAction.jsp ���ϸ� �ϸ� �� -->
<%
//1. �Ķ��Ÿ �� �ޱ�(���ڵ�)
request.setCharacterEncoding("utf-8");

String id=request.getParameter("join_id");
String pw=request.getParameter("join_pw");
String name=request.getParameter("join_name");
String cell1=request.getParameter("join_cell1");
String cell2=request.getParameter("join_cell2");
String cell3=request.getParameter("join_cell3");
String email0=request.getParameter("join_email0");
String email1=request.getParameter("join_email1");

//2. �Էµ����͸� dto�� ���
SignupDTO dto = new SignupDTO();

dto.setJoin_id(id);
dto.setJoin_pw(pw);
dto.setJoin_name(name);
dto.setJoin_cell1(cell1);
dto.setJoin_cell2(cell2);
dto.setJoin_cell3(cell3);
dto.setJoin_email0(email0);
dto.setJoin_email1(email1);

//3. �޼ҵ�� ����
SignupDAO dao = new SignupDAO();
dao.SignupInsert(dto);




%>
</body>
</html>