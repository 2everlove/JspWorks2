<%@ include file="dbconn1.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt = null;
	int id = Integer.parseInt(request.getParameter("id"));	
	String name = request.getParameter("name");	
	String passwd = request.getParameter("passwd");	

	String sql = "insert into t_member values (?,?,?)";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setInt(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, passwd);
	pstmt.executeUpdate();
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("select01.jsp");
	dispatcher.forward(request, response);
%>
</body>
</html>