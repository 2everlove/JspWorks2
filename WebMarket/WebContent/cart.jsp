<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<%
	String cartId = session.getId();
%>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table style="width: 100%">
				<tr>
					<%
						int sum=0;
						DecimalFormat formatter = new DecimalFormat("###,###");
						ArrayList<Product>cartList = (ArrayList<Product>) session.getAttribute("cartlist");
						if(cartList==null)
							cartList = new ArrayList<Product>();
						
						if(cartList.size()==0){
					%>
						<td align="left"><a href="#" class="btn btn-danger" onclick="alert('삭제할 품목이 없습니다.')">삭제하기</a>
						<td align="right"><a href="#" class="btn btn-success" onclick="alert('주문할 품목이 없습니다.')">주문하기</a>
					<%
						} else {
					%>
						<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a>
						<td align="right"><a href="./shippingInfo.jsp?cartId=<%=cartId%>" class="btn btn-success">주문하기</a>
					<% 
						}
					%>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%					
					for(int i = 0; i < cartList.size();i++){
						Product product = cartList.get(i);
						int total = product.getUniPrice() * product.getQuantity();
						sum = sum + total;
				%>
				<tr>
					<td><b><%=product.getProductId()%></b> <%=product.getPname()%></td>
					<td><%=formatter.format(product.getUniPrice())%></td>
					<td><%=product.getQuantity()%></td>
					<td><%=formatter.format(total)%></td>
					<td><a href="removeCart.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">삭제</a></td>					
				</tr>
				<% } %>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=formatter.format(sum)%>원</th>
					<th></th>
				</tr>
			</table>
			<a href="./products.jsp" class="btn btn-secondary">&laquo; 쇼핑 계속하기</a>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>