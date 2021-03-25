<%@page import="dao.ProductRepository"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<%
		ProductRepository dao = ProductRepository.getInstance();
		ArrayList<Product> listOfProducts = dao.getAllProducts();
		DecimalFormat formatter = new DecimalFormat("###,###");
	%>
	<div class="container">
		<div class="row" align="center">
			<%
				for(int i = 0; i<listOfProducts.size(); i++){
					Product product = listOfProducts.get(i);
				
			%>
			<div class="col-md-4">
				<img src="/WebMarket/resources/images/<%=product.getFilename()%>" style="width: 100%">
				<%-- <img src="./resources/images/<%=product.getFilename()%>" style="width: 100%"> --%>
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription() %>
				<p><%=formatter.format(product.getUniPrice()) %> 원
				<p><a href="./product.jsp?id=<%=product.getProductId() %>" class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
			</div>
			<%
				} 
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>