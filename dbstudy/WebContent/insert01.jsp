<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insertProcess.jsp" method="post">
		<p>번호 : <input type="text" name="id">
		<p>이름 : <input type="text" name="name">
		<p>비밀번호 : <input type="password" name="passwd">
		<p><input type="submit" value="가입">
		<input type="reset" value="취소">
	</form>
</body>
</html>