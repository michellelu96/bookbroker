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

<title>Login and Register</title>
</head>
<body class="container">
	<div class="row">
		<div class="col">
			<h1>Register</h1>
			<form:form action="/register" method="post" modelAttribute="newUser">
				<p>
					<form:errors path="name" class="error" />
					<form:label path="name">Name:</form:label>
					<form:input path="name" type="text" />
				</p>
				<p>
					<form:errors path="email" class="error" />
					<form:label path="email">Email:</form:label>
					<form:input path="email" type="text" />
				</p>
				<p>
					<form:errors path="password" class="error" />
					<form:label path="password">Password:</form:label>
					<form:input path="password" type="password" />
				</p>
				<p>
					<form:errors path="confirm" class="error" />
					<form:label path="confirm">Confirm Password:</form:label>
					<form:input path="confirm" type="password" />
				</p>
				<button>Submit</button>
			</form:form>
		</div>
		<div class="col">
			<h1>Login</h1>
			<form:form action="/login" method="post" modelAttribute="newUser">
				<p>
					<form:errors path="email" class="error" />
					<form:label path="email">Email:</form:label>
					<form:input path="email" type="text" />
				</p>
				<p>
					<form:errors path="password" class="error" />
					<form:label path="password">Password:</form:label>
					<form:input path="password" type="password" />
				</p>
				<button>Submit</button>
			</form:form>
		</div>
	</div>
</body>
</html>