<!-- JSP -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- JSTL -->
<!-- c: -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!-- Form/Submit workflows -->
<!-- form: -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- The&nbsp;'isErrorPage'&nbsp;attribute indicates that the current JSP can be used as the error page for another JSP. -->
<%@ page isErrorPage="true" %>
<!-- The&nbsp;**errorPage**&nbsp;attribute tells the JSP engine which page to display if there is an error while the current page runs. The value of the errorPage attribute is a relative URL. -->
<%@ page errorPage = "MyErrorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Dojos</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
	<!-- YOUR own local CSS -->
	<link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
	<div class="container">
		<h1>Welcome to the Dojo!!</h1>
		<div class="topPart">
			<h2>Current Dojo(s)</h2>
			<c:forEach var="dojo" items="${dojos}">
				<div class="dojoNames">
					<c:out value="${dojo.name}"/>
					<form action="/dojos/${dojo.id}">
						<input class="btn btn-primary" type="submit" value="Details"/>
					</form>
					<form method="POST" action="/dojos/delete/${dojo.id}">
						<input type="hidden" name="_method" value="DELETE"/>
						<input class="btn btn-danger" type="submit" value="delete"/>
					</form>
				</div>
			</c:forEach>
		</div>
		<div class="bottomPart">
			<div class="createDojo">
				<!-- <h2>New Dojo</h2> -->
				<a href="/dojos/new">Create New Dojo</a>
			</div>
			<div class="createNinja">
				<!-- <h2>New Ninja</h2> -->
				<a href="/ninjas/new">Create New Ninja</a>
			</div>
			
		</div>
	
	</div>
</body>
</html>