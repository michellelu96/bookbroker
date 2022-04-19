<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

<title>Read Share</title>
</head>
<body class="container">
	<div class="row">
		<div class="col">
			<h1>Welcome, ${user.name}</h1>
			<p>Books from everyone's shelves</p>
		</div>
		<div class="col">
			<p><a href="/logout">Logout</a></p> <p><a href="/books/new">+ Add a book to
				my shelf!</a></p>
		</div>
	</div>
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="row">Id</th>
				<th scope="row">Title</th>
				<th scope="row">Author Name</th>
				<th scope="row">Posted By:</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="book" items="${books }">
				<th scope="row"><c:out value="${book.id}"></c:out></th>
				<th><a href="/books/${book.id}"><c:out value="${book.title}"/></a></th>
				<th><c:out value="${book.author}"></c:out></th>
				<th><c:out value="${book.reader.name}"></c:out></th>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>