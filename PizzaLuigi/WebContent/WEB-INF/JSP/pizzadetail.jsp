<%@page contentType='text/html' pageEncoding='UTF-8' session='false' trimDirectiveWhitespaces='true'%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@taglib prefix='vdab' uri='http://vdab.be/tags' %> 
<!doctype html>
<html lang="nl">
<head>
<vdab:head title="${pizza.naam}"></vdab:head>
</head>
<body>
	<vdab:menu/>
	<c:choose>
		<c:when test="${not empty fout}">
			<div class="fout">${fout}</div>
		</c:when>
		<c:when test="${empty pizza}">
			<div class="fout">Pizza niet gevonden</div>
		</c:when>
		<c:otherwise>
			<h1>${pizza.naam}</h1>
			<dl>
				<dt>Nummer</dt>
				<dd>${pizza.id}</dd>
				<dt>Naam</dt>
				<dd>${pizza.naam}</dd>
				<dt>Prijs</dt>
				<dd>${pizza.prijs}</dd>
				<dt>Pikant</dt>
				<dd>${pizza.pikant ? "ja" : "nee"}
			</dl>
		</c:otherwise>
	</c:choose>
</body>
</html>
