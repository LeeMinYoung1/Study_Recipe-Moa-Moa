<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="moamoa.comment.CommentDTO"%>
<%@page import="moamoa.comment.CommentDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 댓글 작성 버튼 클릭시 실행 -->
<%	
	request.setCharacterEncoding("utf-8");// 한글 깨짐 오류 방지
	String title = request.getParameter("title");//전달 값 가져오기
	String content = request.getParameter("context");//전달 값 가져오기
	
	System.out.println("타이틀"+title);
	
	CommentDTO dto=new CommentDTO();
	
	dto.setPost_comment("1");
	dto.setPost_title(title);
	dto.setPost_comment_writer("부천대");
	dto.setPost_comment_content(content);
	
	CommentDAO dao = new CommentDAO();
	dao.write(dto);
	%> 
		<script>
		document.location.href='./post_list.jsp'
		</script> 
	<%

%>
</body>
</html>