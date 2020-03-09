<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Something wrong</title>
<link rel="stylesheet" href="css/sample.css">
</head>
<body>
	<main>
	<article>
		<h1>Oh dear !</h1>
		<p>You caused a ${pageContext.exception} on the server!</p>
		<p>
			<a href="Controller">Home</a>
		</p>
	</article>
	</main>
</body>
</html>