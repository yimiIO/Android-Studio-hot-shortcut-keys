<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<head>
<link rel="shortcut icon"
	href="/files/images/favicon.ico">
</head>
<%
	response.sendRedirect(getServletContext().getContextPath()
			+ "/blog/HomeServlet");
%>