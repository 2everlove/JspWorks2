<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!!</title>
</head>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<style>
	.jumbotron{
		background:url("resources/img/spring.jpg");
	}
</style>
<body>
	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Good Buy Mall</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li><a class="nav-link" href="#">소개</a></li>
				<li><a class="nav-link" href="#">카테고리</a></li>
				<li><a class="nav-link" href="#">공지사항</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<h1 class="text-center">Welcome to Shopping Mall</h1>		
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<h4>다양한 상품</h4>
					<p>당신과 가장 가까운 마트...
					<p>장보기의 기쁨을 더합니다.
					<p><a class="btn btn-primary">상세정보 &raquo;</a>
				</div>
				<div class="col-md-4">
					<h4>다양한 상품</h4>
					<p>당신과 가장 가까운 마트...
					<p>장보기의 기쁨을 더합니다.
					<p><a class="btn btn-secondary">상세정보 &raquo;</a>
				</div>
				<div class="col-md-4">
					<h4>다양한 상품</h4>
					<p>당신과 가장 가까운 마트...
					<p>장보기의 기쁨을 더합니다.
					<p><a class="btn btn-success">상세정보 &raquo;</a>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>