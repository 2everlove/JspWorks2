<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>flex 예제</title>
<style type="text/css">
	#wrap{
		display: flex;
	}
	.box{
		width: 100px;
		height: 100px;
		background-color: #00ff00;
		margin: 20px;
	}
</style>
</head>
<body>
	<div id="wrap">
		<div class="box"></div>
		<div class="box"></div>
		<div class="box"></div>
	</div>
</body>
</html>