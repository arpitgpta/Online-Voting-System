<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="org.dao.*" %>
<%
	DataExchange de = new DataExchange();
	de.end_election();
	response.sendRedirect("results.jsp");
%>
</body>
</html>