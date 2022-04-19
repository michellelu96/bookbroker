<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

<title>Read Share</title>
</head>
<body class="container">
	<div class="row">
		<div class="col">
			<h1>${book.title}</h1>
		</div>
		<div class="col">
			<a href="/home">back to the shelves</a>
		</div>
	</div>
	<c:choose>
		<c:when test="${user_id == book.reader.id }">
			<h4>You read ${book.title} by ${book.author }</h4>
			<p>Here are your thoughts</p>
		</c:when>
		<c:otherwise>
			<h4>${book.reader.name} read ${book.title} by ${book.author}</h4>
			<p>Here are ${book.reader.name } thoughts</p>
		</c:otherwise>
	</c:choose>
	
	<p>${book.thought}</p>
	<c:if test="${user_id == book.reader.id }"><a href="/books/edit/${book.id }" class="button" >Edit</a></c:if>
</body>
</html>