<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String user_id = "";
	String user_pw = "";
	String user_name = "";
	
	user_id = request.getParameter("id"); //ID�� ������
	user_pw = request.getParameter("pw"); //PW�� ������
	//���⼭ ���� DB ���� �ڵ�
	Connection conn = null;
	String driverName="oracle.jdbc.driver.OracleDriver";
	Class.forName(driverName);
	String serverName = "localhost";
	String serverPort = "1521";
	String sid = "orcl";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userName = "end";
	String userPassword = "end";
	conn = DriverManager.getConnection(url, userName, userPassword);
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("select * from MEMBER where id = '" + user_id + "' AND pwd ='" + user_pw + "'");
	Boolean check = false;
	while(rs.next()) // ������� �ϳ��� �����ͼ� �����ϱ� ���� while��
	{
		String id = rs.getString("ID"); //DB�� �ִ� ID������
	    String name = rs.getString("NAME"); // ����� ���� ������(�ʼ� �ƴ�)
	    ///session.setAttribute("user_id", id); //DB���� ���ǿ� ����
		///session.setAttribute("user_name", name); // ���ǿ� ������ ����
		check = true;	
	}
	if(check){ //ID,PW�� DB�� �����ϴ� ��� �Խ������� �̵��ϴ� �ڵ� 
	%> 
	 		<script>
	  		document.location.href='../mainpage/index.html'
	 		</script> <%
	    	rs.close();
	       	conn.close();
		}   else  { //ID,PW�� ��ġ���� �ʴ� ���
	     %>
	<script>
	alert("ID �Ǵ� PW�� �߸� �Է��߽��ϴ�.");
	document.location.href='../mainpage/main_login.html'
	</script>
	<%  }
%>
</body>
</html>