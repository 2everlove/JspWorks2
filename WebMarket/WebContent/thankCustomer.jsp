<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.net.URLDecoder"%>
<%@ include file="dbconn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<meta charset="UTF-8">
<title>주문 완료</title>
</head>
<body>
	<%
		String shipping_cartId = "";
		String shipping_name = "";
		String shipping_shippingDate = "";
		String shipping_country = "";
		String shipping_zipCode = "";
		String shipping_addressName = "";
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null){
			for(int i = 0; i < cookies.length; i++){
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				if(n.equals("Shipping_cartId"))
					shipping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("Shipping_shippingDate"))
					shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			}
		}
		
		int sum = 0;
		DecimalFormat formatter = new DecimalFormat("###,###");
		ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
		if(cartList == null)
			cartList = new ArrayList<Product>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		for(int i = 0; i < cartList.size(); i++){
			
			Product product = cartList.get(i);
			
			int total = product.getUniPrice()*product.getQuantity();
			
			
			String sql="select p_unitsInStock from product where p_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getProductId());
			rs = pstmt.executeQuery();
			rs.next();
			
			long qun = (rs.getLong("p_unitsInStock")-product.getQuantity());
			
			sql="update product set p_unitsInStock=? where p_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, qun);
			pstmt.setString(2, product.getProductId());
			pstmt.executeUpdate();
		}
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
	%>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p> 주문은 <%out.println(shipping_shippingDate);%>에 배송될 예정입니다!
		<p> 주문번호 : <%out.println(shipping_cartId);%>
	</div>
	<div class="container">
		<p><a href="./products.jsp" class="btn btn-secondary">&laquo; 상품 목록</a>
	</div>
</body>
</html>
<%
	session.invalidate();
	
	for(int i = 0; i < cookies.length; i++){
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if(n.equals("shipping_cartId"))
			thisCookie.setMaxAge(0);
		if(n.equals("shipping_name"))
			thisCookie.setMaxAge(0);
		if(n.equals("shipping_shippingDate"))
			thisCookie.setMaxAge(0);
		if(n.equals("shipping_country"))
			thisCookie.setMaxAge(0);
		if(n.equals("shipping_zipCode"))
			thisCookie.setMaxAge(0);
		if(n.equals("shipping_addressName"))
			thisCookie.setMaxAge(0);
	}
	
	
%>