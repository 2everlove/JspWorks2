<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn1.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from t_member";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while(rs.next()){
	
%>	
		<p><strong>번호</strong> : <%=rs.getInt("id")%><br>
		<b>이름</b> :<%=rs.getString("name")%><br>
		<b>비밀번호</b> : <%=rs.getString("passwd")%>
<%
	}	
	if(rs != null)
		rs.close();
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
%>
</body>
</html>