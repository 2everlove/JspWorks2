<%@page import="dao.ProductRepository"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<meta charset="UTF-8">
<title>상품 상세 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductByid(id);
		DecimalFormat formatter = new DecimalFormat("###,###");
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<%-- <img src="C:/upload/<%=product.getFilename()%>" style="width: 100%"> --%>
				<img src="./resources/images/<%=product.getFilename()%>" style="width: 100%">
			</div>
			<div class="col-md-6">
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription() %>
				<p><b>상품 코드</b> : <span class="badge badge-danger"><%=product.getProductId() %></span>
				<p><b>제조사</b> : <%=product.getManufacturer() %>
				<p><b>분류</b> : <%=product.getCategory() %>
				<p><b>재고 수</b> : <%=formatter.format(product.getUnitInStock()) %> 개
				<h4><%=formatter.format(product.getUniPrice()) %> 원</h4>
				<p><a href="#" class="btn btn-info">상품 주문 &raquo;</a>
				<a href="products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a> <!-- right arrow quotation -->
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>