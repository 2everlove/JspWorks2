<%@page import="java.text.DecimalFormat"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
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
		DecimalFormat formatter = new DecimalFormat("###,###");
	%>
	<div class="container">
		<div class="row" align="center">
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
				
			%>
			<div class="col-md-4">
				<img src="/WebMarket/resources/images/<%=rs.getString("p_fileName")%>" style="width: 100%">
				<%-- <img src="./resources/images/<%=product.getFilename()%>" style="width: 100%"> --%>
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><%=formatter.format(rs.getInt("p_unitPrice")) %> 원
				<p><a href="product.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
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