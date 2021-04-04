<%@page import="filter.LogFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<!DOCTYPE html>

<link rel="stylesheet" href="resources/css/bootstrap.css">
<meta charset="UTF-8">
<nav class="navbar navbar-expand navbar-dar bg-dark">
	<div class="container">
		<div class="navbar-header">
		<%
			LogFilter log = new LogFilter();
			boolean url = log.getURL(request).contains("member");
		%>
				<c:if test="<%=url%>">
					<a class="navbar-brand" href="<c:url value="../welcome.jsp"/>">Home</a>
				</c:if>
				<c:if test="<%=!url%>">
					<a class="navbar-brand" href="<c:url value="./welcome.jsp"/>">Home</a>
				</c:if>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
			<c:choose>
				<c:when test="${empty sessionId}">
					<li class="nav-item"><a class="nav-link" href="<c:url value="/member/loginMember.jsp"/>">로그인 </a></li>
					<li class="nav-item"><a class="nav-link" href='<c:url value="/member/addMember.jsp"/>'>회원 가입</a>
				</c:when>
				<c:otherwise>
					<li style="padding-top: 7px; color: white">[<%=sessionId%>님]</li>
					<li class="nav-item"><a class="nav-link" href="<c:url value="/member/logoutMember.jsp"/>">로그아웃 </a></li>
					<li class="nav-item"><a class="nav-link" href='<c:url value="/member/updateMember.jsp"/>'>회원 수정</a>
				</c:otherwise>
			</c:choose>
				<c:if test="<%=url%>">
					<li class="nav-item"><a class="nav-link" href="../products.jsp">상품 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="../addProduct.jsp">상품 등록</a></li>
				<li class="nav-item"><a class="nav-link" href="../editProduct.jsp?edit=update">상품 수정</a></li>
				<li class="nav-item"><a class="nav-link" href="../editProduct.jsp?edit=delete">상품 삭제</a></li>
				</c:if>
				<c:if test="<%=!url%>">
					<li class="nav-item"><a class="nav-link" href="./products.jsp">상품 목록</a></li>
					<li class="nav-item"><a class="nav-link" href="./addProduct.jsp">상품 등록</a></li>
					<li class="nav-item"><a class="nav-link" href="./editProduct.jsp?edit=update">상품 수정</a></li>
					<li class="nav-item"><a class="nav-link" href="./editProduct.jsp?edit=delete">상품 삭제</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>