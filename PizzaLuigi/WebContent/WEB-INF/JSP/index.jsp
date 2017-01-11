<%@page contentType='text/html' pageEncoding='UTF-8' session='false' trimDirectiveWhitespaces ='true'%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%> 
<%@taglib prefix='vdab' uri='http://vdab.be/tags' %> 
<!doctype html>
<html lang='nl'>
<head>
<vdab:head title="Pizza Luigi"></vdab:head>
</head>
<body>
	<vdab:menu/>
	<h1>Pizza Luigi</h1>
	<img src=" <c:url value='/images/pizza.jpg'/> " alt="pizza"
		class="fullwidth">
	<h2>${begroeting}</h2>
	<h2>De zaakvoerder</h2>
	<dl>
		<dt>Naam</dt>
		<dd>${zaakvoerder.naam}</dd>
		<dt>Aantal kinderen</dt>
		<dd>${zaakvoerder.aantalKinderen}</dd>
		<dt>Gehuwd</dt>
		<dd>${zaakvoerder.gehuwd ? 'Ja' : 'Nee'}</dd>
		<dt>Adres</dt>
		<dd>${zaakvoerder.adres.straat}&nbsp;${zaakvoerder.adres.huisNr}<br> 
			${zaakvoerder.adres.postcode}&nbsp;${zaakvoerder.adres.gemeente}
		</dd>
		<dt>Aantal pizza's verkocht</dt> 
		<dd><fmt:formatNumber value='${aantalPizzasVerkocht}'/></dd> 
	</dl>
	<div>
		<small>Deze pagina werd ${indexRequests} keer bekeken.</small>
	</div>
	<div>
		<small>Webmaster: <a href="mailto:${initParam.emailAdresWebmaster}">${initParam.emailAdresWebmaster}</a></small>
	</div>
	<div>
		<fmt:parseDate value="${nu}" pattern="yyyy-MM-dd" var="nuAlsDate" type="date"/> 
		<small>Vandaag: <fmt:formatDate value="${nuAlsDate}"/></small>
	</div>
</body>
</html>
