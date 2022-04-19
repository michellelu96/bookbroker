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

<title>Book Share</title>
</head>
<body class="container">
	<div class="row">
		<div class="col">
			<h1>Change Your Entry:</h1>
		</div>
		<div class="col">
			<a href="/home">back to the shelves</a>
		</div>
	</div>
		<form:form action="/books/edit/${book.id}" method="post" modelAttribute="book">
		<input type="hidden" name="_method" value="put">
		<form:hidden path="reader" value="${user.id}"/>
		<p>
			<form:label path="title">Title</form:label>
			<form:input path="title" value="${book.title }"/>
			<form:errors path="title"/>
		</p>
		<p>
			<form:label path="author">Author</form:label>
			<form:input path="author" value="${book.author }"/>
			<form:errors path="author"/>
		</p>
		<p>
			<form:label path="thought">My Thoughts:</form:label>
			<form:input path="thought" type="textbox" value="${book.thought }"></form:input>
			<form:errors path="thought"/>
		</p>
		<button>Submit</button>
	</form:form>
</body>
</body>
</html>