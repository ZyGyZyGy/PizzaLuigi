<%@page contentType='text/html' pageEncoding='UTF-8' session='false' trimDirectiveWhitespaces='true'%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!doctype html>
<html lang="nl">
<head>
<c:import url="/WEB-INF/JSP/head.jsp">
	<c:param name="title" value="Pizza's"/>
</c:import>
</head>
<body>
	<script>
		document.getElementById('toevoegform').onsubmit = function() {
			document.getElementById('toevoegknop').disabled = true;
		};
	</script>
	<c:import url="/WEB-INF/JSP/menu.jsp"/>
	<h1>Pizza's</h1>
	<c:forEach begin='1' end='5'> 
    &#9733; <%-- de HTML code van een ster --%>
	</c:forEach>
	<ul class="zebra">
		<c:forEach var="pizza" items="${pizzas}">
			<li>${pizza.id}&nbsp;<c:out value="${pizza.naam}"/>&nbsp;${pizza.prijs}&euro;
			${pizza.pikant ? "pikant " : "niet pikant "}
				<c:url value="/pizzas/detail.htm" var="detailURL">
					<c:param name="id" value="${pizza.id}"></c:param>
				</c:url> 
				<a href="<c:out value='${detailURL}'/>">Detail</a>
				<c:if test="${pizzaIdsMetFoto.contains(pizza.id)}">
					<c:url value="/pizzafotos/${pizza.id}.jpg" var="fotoURL"/>
					<a href="${fotoURL}">Foto's</a>
				</c:if>
			</li>
		</c:forEach>
	</ul>
	<div>
		Webmaster: <a href="mailto:${initParam.emailAdresWebmaster}">${initParam.emailAdresWebmaster}</a>
	</div>
</body>
</html>
