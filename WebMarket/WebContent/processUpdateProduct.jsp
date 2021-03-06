<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	String filename = "";
	String realFolder = "C:\\upload";
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	//form에서 enctype="multipart/form-data"이므로 multi로 받음
	String productId = multi.getParameter("productId");
	String pname = multi.getParameter("pname");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	Integer price;
	
	//가격
	if(unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);
	
	long stock;
	
	//재고수
	if(unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	
	//파일 가져오기
	Enumeration<String> files = multi.getFileNames(); //순서가 없으므로 for는 x, Enumeration을 써야함, 파일을 넘겨받음(getParmeter로 생각하면 됨)
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname); //파일을 가져오기

	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from product where p_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(fileName != null){
			sql="update product set p_name=?, p_unitPrice=?, p_description=?, p_manufacturer=?, p_category=?, "
					+"p_unitsInStock=?, p_condition=?, p_fileName=? where p_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,pname);
			pstmt.setInt(2,price);
			pstmt.setString(3,description);
			pstmt.setString(4,manufacturer);
			pstmt.setString(5,category);
			pstmt.setLong(6,stock);
			pstmt.setString(7,condition);
			pstmt.setString(8,fileName);
			pstmt.setString(9,productId);
			pstmt.executeUpdate();
		} else {
			sql="update product set p_name=?, p_unitPrice=?, p_description=?, p_manufacturer=?, p_category=?, "
					+"p_unitsInStock=?, p_condition=? where p_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,pname);
			pstmt.setInt(2,price);
			pstmt.setString(3,description);
			pstmt.setString(4,manufacturer);
			pstmt.setString(5,category);
			pstmt.setLong(6,stock);
			pstmt.setString(7,condition);
			pstmt.setString(8,productId);
			pstmt.executeUpdate();
		}
	}
	if(rs != null)
		rs.close();
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	
	
	
	/* //dao 처리
	ProductRepository dao = ProductRepository.getInstance(); //데이터 메모리
	
	//상품 추가
	Product newProduct = new Product(); //힙 메모리
	newProduct.setProductId(productId);
	newProduct.setPname(pname);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitInStock(stock);
	newProduct.setCondition(condition);
	newProduct.setFilename(fileName);
	
	dao.addProduct(newProduct); */
	
	response.sendRedirect("editProduct.jsp?edit=update");
%>