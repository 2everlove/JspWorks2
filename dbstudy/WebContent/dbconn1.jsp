<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	
		final String url = "jdbc:mysql://localhost:3307/JSPBookDB?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=Asia/Seoul";
		final String user = "root";
		final String password = "root";
		
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
	} catch (Exception e){
		out.println("데이터베이스 연결이 실패했습니다.<br>");
		out.println("SQLExecption : "+e.getMessage());
	}
%>