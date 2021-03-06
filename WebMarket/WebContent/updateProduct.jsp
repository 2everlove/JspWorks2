<%@page import="java.text.DecimalFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<meta charset="UTF-8">
<title>상품 수정</title>
</head>
<%
	String productId = request.getParameter("id");
%>
<body>
	<jsp:include page="menu.jsp"/>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>
	<%
		DecimalFormat formatter = new DecimalFormat("###,###");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from product where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();
		if(rs.next()){
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="/WebMarket/resources/images/<%=rs.getString("p_fileName")%>" alt="image" style="width: 100%">
			</div>
		</div>
		<div class="col-md-7">
			<form name="newProduct" action="processUpdateProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data" >
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="productId"/></label>
					<div class="col-sm-3">
						<input type="text" id="productId" name="productId" class="form-control" value="<%=rs.getString("p_id")%>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="pname"/></label>
					<div class="col-sm-3">
						<input type="text" id="pname" name="pname" class="form-control" value="<%=rs.getString("p_name")%>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="unitPrice"/></label>
					<div class="col-sm-3">
						<input type="number" id="unitPrice" name="unitPrice" class="form-control" value="<%=rs.getInt("p_unitPrice")%>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="description"/></label>
					<div class="col-sm-5">
						<textarea name="description" rows="2" cols="50" class="form-control"><%=rs.getString("p_description")%></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="manufacturer"/></label>
					<div class="col-sm-3">
						<input type="text" name="manufacturer" class="form-control" value="<%=rs.getString("p_manufacturer")%>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="category"/></label>
					<div class="col-sm-3">
						<input type="text" name="category" class="form-control" value="<%=rs.getString("p_category")%>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="unitsInStock"/></label>
					<div class="col-sm-3">
						<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value="<%=rs.getString("p_unitsInStock")%>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="condition"/></label>
					<div class="col-sm-5">
					<% if(rs.getString("p_condition").equals("New")){ %>
						<label><input type="radio" name="condition" value="New" checked><fmt:message key="condition_New"/></label>
						<label><input type="radio" name="condition" value="Old"><fmt:message key="condition_Old"/></label>
						<label><input type="radio" name="condition" value="Refurbished"><fmt:message key="condition_Refurbished"/></label>
					<% } else if(rs.getString("p_condition").equals("Old")) { %>
						<label><input type="radio" name="condition" value="New"><fmt:message key="condition_New"/></label>
						<label><input type="radio" name="condition" value="Old" checked><fmt:message key="condition_Old"/></label>
						<label><input type="radio" name="condition" value="Refurbished"><fmt:message key="condition_Refurbished"/></label>
					<% } else if(rs.getString("p_condition").equals("Refurbished")) { %>
						<label><input type="radio" name="condition" value="New" ><fmt:message key="condition_New"/></label>
						<label><input type="radio" name="condition" value="Old"><fmt:message key="condition_Old"/></label>
						<label><input type="radio" name="condition" value="Refurbished" checked><fmt:message key="condition_Refurbished"/></label>
					<% } %>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="productImage"/></label>
					<div class="col-sm-5">
						<input type="file" name="productImage" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="button" class="btn btn-primary" value='<fmt:message key="button"/>' onclick="CheckAddProduct()">
					</div>
				</div>
			</form>
		</div>
	</div>
	<% 
			}
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
	%>
	</fmt:bundle>
	<jsp:include page="footer.jsp"/>
</body>
</html>