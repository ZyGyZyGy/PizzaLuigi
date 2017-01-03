<%@page contentType='text/html' pageEncoding='UTF-8' session='false'%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!doctype html>
<html lang="nl">
<head>
<title>Pizza's</title>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width,initial-scale=1'>
<link rel="icon" href="images/favicon.ico">
<link rel="stylesheet" href="styles/default.css">
</head>
<body>
	<h1>Pizza's</h1>
	<c:forEach begin='1' end='5'> 
    &#9733; <%-- de HTML code van een ster --%>
	</c:forEach>
	<ul class="zebra">
		<c:forEach var='entry' items='${pizzas}'>
			<li>${entry.key}: <c:out value="${entry.value.naam}" /> ${entry.value.prijs}&euro; ${entry.value.pikant ? "pikant" : "niet pikant"}
				<c:url value="/pizzas/detail.htm" var="detailURL">
					<c:param name="id" value="${entry.key}"></c:param>
				</c:url>
				<a href="${detailURL}">Detail</a>
			</li>
		</c:forEach>
	</ul>
</body>
</html>
