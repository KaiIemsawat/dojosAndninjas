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
	<title><c:out value="${dojo.name}"/> Details</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
	<!-- YOUR own local CSS -->
	<link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
	<div class="container">
		<h1>Dojo Details</h1>
		<h3>Dojo name : <span>${dojo.name}</span></h3>
		<table class="dojotable">
			<thead>
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Age</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="ninja" items="${ninjas}">
					<c:choose>
						<c:when test="${ninja.dojo.id == dojo.id}">
							<tr>
								<td>${ninja.firstName}</td>
								<td>${ninja.lastName}</td>
								<td>${ninja.age}</td>
							</tr>
						</c:when>
					</c:choose>						 
				</c:forEach>
			</tbody>
		</table>
		<a href="/"><input type="submit" class="btn btn-secondary" value="Return to homepage"/></a>
	</div>
	
</body>
</html>