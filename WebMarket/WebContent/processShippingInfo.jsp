<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8")); 
	Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8")); 
	Cookie shippingDate = new Cookie("Shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate"), "utf-8")); 
	Cookie country = new Cookie("Shipping_country", URLEncoder.encode(request.getParameter("country"), "utf-8")); 
	Cookie zipCode = new Cookie("Shipping_zipCode", URLEncoder.encode(request.getParameter("zipCode"), "utf-8")); 
	Cookie addressName = new Cookie("Shipping_addressName", URLEncoder.encode(request.getParameter("addressName"), "utf-8")); 
	
	//유효 기간 설정 - 1일
	cartId.setMaxAge(24*60*60);
	name.setMaxAge(24*60*60);
	zipCode.setMaxAge(24*60*60);
	country.setMaxAge(24*60*60);
	addressName.setMaxAge(24*60*60);
	
	//addCookie() 생성완료 -> 클라이언트 컴에 응답(저장)
	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(shippingDate);
	response.addCookie(country);
	response.addCookie(zipCode);
	response.addCookie(addressName);
	
	response.sendRedirect("orderConfirmation.jsp");
%>