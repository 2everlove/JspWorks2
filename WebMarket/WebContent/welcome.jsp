<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<meta charset="UTF-8">
<title>welcome</title>
</head>
<body>
	<jsp:include page="./menu.jsp"/>
	<%-- <%@ include file="./menu.jsp" %> --%>
	<%
		String greeting = "Welcom to Web Shopping Mall";
		String tagline = "welcom to Web Market!";
		
	%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3" align="center">
				<%=greeting %>
			</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline %>
			</h3>
			<%
				response.setIntHeader("Refresh", 5);
				Date day = new java.util.Date();
				String am_pm;
				int hour = day.getHours();
				int minute = day.getMinutes();
				int second = day.getSeconds();
				String h="";
				String m="";
				String s="";
				if(hour / 12 == 0)
					am_pm = "AM";
				else{
					am_pm = "PM";
					hour = hour - 12;
				}
				if(hour<10){
					h = "0"+String.valueOf(hour).toString();
				} else {
					h = String.valueOf(hour).toString();
				}
				if(minute<10){
					m = "0"+String.valueOf(minute).toString();
				} else {
					m = String.valueOf(minute).toString();
				}
				if(second<10){
					s = "0"+String.valueOf(second).toString();
				} else {
					s = String.valueOf(second).toString();
				}
				String CT = am_pm+" "+h + ":" + m + ":" + s;
				out.println("현재 접속 시간: "+CT+"\n");
			%>
		</div>
		<hr>
	</div>
	<%@ include file="./footer.jsp" %>
</body>
</html>