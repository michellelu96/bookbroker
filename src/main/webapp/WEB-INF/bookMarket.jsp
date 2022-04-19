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

<title>Book Lender Dashboard</title>
</head>
<body class="container">
	<div class="row">
		<div class="col">
			<h3>Hello, ${user.name }, Welcome to...</h3>
			<h1>The Book Broker</h1>
			<p>Available Books to Borrow</p>
		</div>
		<div class="col">
			<a href="/home"> back to the shelves</a>
		</div>
	</div>
	<table class="table">
		<thead>
			<tr>
				<th scope="row">ID</th>
				<th scope="row">Title</th>
				<th scope="row">Author Name</th>
				<th scope="row">Owner</th>
				<th scope="row" colspan="2">Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="book" items="${ nonBooks}">
				<th scope="row">${book.id}</th>
				<td>${book.title }</td>
				<td>${book.author }</td>
				<td>${book.reader.name }</td>
				<td><c:choose>
						<c:when
							test="${(book.borrow.id eq null) and (book.reader.id ne user.id) }">
							<form action="/books/borrow/${book.id}" method="post">
								<button type="submit" class="btn btn-link">borrow</button>
							</form>
						</c:when>
						<c:when test="${book.reader.id eq user.id}">
							<div class="btn-group" role="group">
								<form:form action="/books/edit/${book.id}">
									<button class="btn btn-link">edit</button>
								</form:form>
								<form:form action="/books/delete/${book.id}" method="post">
									<input type="hidden" name="_method" value="delete">
									<button type="submit" class="btn btn-link">delete</button>
								</form:form>
							</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose></td>
			</c:forEach>
		</tbody>
	</table>

	<p>Books I'm borrowing</p>
	<table class="table">
		<thead>
			<tr>
				<th scope="row">ID</th>
				<th scope="row">Title</th>
				<th scope="row">Author Name</th>
				<th scope="row">Owner</th>
				<th scope="row">Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="book" items="${borrowedBooks }">
				<tr>
					<th scope="row">${book.id }</th>
					<td>${book.title }</td>
					<td>${book.author }</td>
					<td>${book.reader.name }</td>
					<td><form:form action="/books/return/${book.id }" method="post"><button class="btn btn-link">return</button></form:form></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>