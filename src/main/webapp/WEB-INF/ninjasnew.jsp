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
	<title>New Ninja</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
	<!-- YOUR own local CSS -->
	<link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
	<div class="container">
		<h1>New Ninja</h1>
		<div class="inputSection">
			<form:form class="inputSection" action="" method="post" modelAttribute="ninja">
				<div class="dojoSelection">
				<form:label for="selectDojo" path="dojo">Select Dojo : </form:label>
					<form:select path="dojo" id="selectDojo">
						<c:forEach var="dojo" items="${dojos}">
							<option value="${dojo.id}">${dojo.name}</option>
						</c:forEach>
					</form:select>
				</div>
				<div class="firstName">
					<form:label path="firstName">First Name : </form:label>
					<form:errors path="firstName" class="text-danger"></form:errors>
					<form:input path="firstName"/>				
				</div>
				<div class="lastName">
					<form:label path="lastName">Last Name : </form:label>
					<form:errors path="lastName" class="text-danger"></form:errors>
					<form:input path="lastName"/>				
				</div>
				<div class="age">
					<form:label path="age">Age : </form:label>
					<form:errors path="age" class="text-danger"></form:errors>
					<form:input path="age" type="number" min="16" max="70"/>				
				</div>
				<input type="submit" class="btn btn-primary" value="Create"/>
			</form:form>
		</div>
		<a href="/"><input type="submit" class="btn btn-secondary" value="Return to homepage"/></a>
	</div>
</body>
</html>