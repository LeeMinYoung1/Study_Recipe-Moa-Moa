<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="moamoa.post.PostDAO"%>
<%@page import="moamoa.post.PostDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<!-- 게시글(레시피) 쓰기 기능 -->
<%	
	String title = request.getParameter("title");
	String ingredient = request.getParameter("ingredient");
	String content = request.getParameter("content");
	String category = request.getParameter("category");
	
	
	PostDTO dto=new PostDTO();
	
	dto.setTitle(title);
	dto.setIngredient(ingredient);
	dto.setContent(content);
	dto.setCategory(category);
	
	PostDAO dao = new PostDAO();
	dao.write(dto);
	%> 
		<script>
		document.location.href='./post_list.jsp'
		</script> 
	<%

%>
</body>
</html>