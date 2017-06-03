<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="/WEB-INF/fragments/bookHeader.jsp" />

<div class="container">

	<c:if test="${not empty msg}">
		<div class="alert alert-${css} alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" 
                                aria-label="Close">
				<span aria-hidden="true">×</span>
			</button>
			<strong>${msg}</strong>
		</div>
	</c:if>

	<h1>Book Detail</h1>
	<br />

	<div class="row">
		<label class="col-sm-2">Reference</label>
		<div class="col-sm-10">${livre.reference}</div>
	</div>

	<div class="row">
		<label class="col-sm-2">Titre</label>
		<div class="col-sm-10">${livre.titre}</div>
	</div>

	<div class="row">
		<label class="col-sm-2">Auteur</label>
		<div class="col-sm-10">${livre.auteur}</div>
	</div>

	<div class="row">
		<label class="col-sm-2">Categorie</label>
		<div class="col-sm-10">${livre.categorie}</div>
	</div>

	<div class="row">
		<label class="col-sm-2">Photo</label>
<div class="col-sm-10"><img src="<c:url value="/resources/image/${livre.photo}"/>" alt="" /></div>

	</div>

	<div class="row">
		<label class="col-sm-2">Description</label>
		<div class="col-sm-10">${livre.description}</div>
	</div>

</div>

<jsp:include page="/WEB-INF/fragments/footer.jsp" />

</body>
</html>