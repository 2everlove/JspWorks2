<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	if(id==null || id.trim().equals("")){ //trim 문자열의 좌 우 공백을 " 문자 열 "을 지워서 "문자 열"로 만듬 // 내부 공백은 replacement로 제거
		response.sendRedirect("products.jsp");
		return;
	}
	
	// 주문 제품의 객체 가져오기
	ProductRepository dao = ProductRepository.getInstance();
	
	Product product = dao.getProductByid(id);
	if(product == null){
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	ArrayList<Product> goodsList = dao.getAllProducts();
	Product goods = new Product();
	for(int i=0; i<goodsList.size();i++){
		goods = goodsList.get(i);
		if(goods.getProductId().equals(id)){
			break;
		}
	}
	
	//세션 발금 및 유지
	ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
	if(list==null){
		list = new ArrayList<Product>();
		session.setAttribute("cartlist", list);
	}
	
	//계산(제품의 개수)
	int cnt = 0;
	Product goodsQnt = new Product();
	for(int i=0;i<list.size();i++){
		goodsQnt = list.get(i);
		if(goodsQnt.getProductId().equals(id)){ //한번 더 눌렀을 때 같은 id면
			cnt++; //개수 증가
			int orderQuantity = goodsQnt.getQuantity() +1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	
	if(cnt==0){ //첫 주문시 1을 저장
		goods.setQuantity(1);
		list.add(goods);
	}
	
	response.sendRedirect("product.jsp?id="+id);
%>