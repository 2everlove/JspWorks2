<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	if(id == null || id.trim().equals("")){
		response.sendRedirect("proudcts.jsp");
		return;
	}
	
	ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
	Product goodsQnt = new Product();
	for(int i = 0; i < cartList.size(); i++){
		goodsQnt = cartList.get(i);
		if(goodsQnt.getProductId().equals(id)){
			cartList.remove(goodsQnt);
		}
	}
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
	dispatcher.forward(request, response);
%>
