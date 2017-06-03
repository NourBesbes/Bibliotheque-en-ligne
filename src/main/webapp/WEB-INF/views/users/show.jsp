<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="/WEB-INF/fragments/header.jsp" />

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

	<h1>User Detail</h1>
	<br />

	<div class="row">
		<label class="col-sm-2">Login</label>
		<div class="col-sm-10">${user.login}</div>
	</div>

	<div class="row">
		<label class="col-sm-2">Nom</label>
		<div class="col-sm-10">${user.nom}</div>
	</div>

	<div class="row">
		<label class="col-sm-2">Prenom</label>
		<div class="col-sm-10">${user.prenom}</div>
	</div>

	<div class="row">
		<label class="col-sm-2">Password</label>
		<div class="col-sm-10">${user.password}</div>
	</div>
    <div class="row">
		<label class="col-sm-2">CIN</label>
		<div class="col-sm-10">${user.cin}</div>
	</div>
	<div class="row">
		<label class="col-sm-2">Email</label>
		<div class="col-sm-10">${user.mail}</div>
	</div>

	<div class="row">
		<label class="col-sm-2">Adresse</label>
		<div class="col-sm-10">${user.adresse}</div>
	</div>

	<div class="row">
		<label class="col-sm-2">Enabled</label>
		<div class="col-sm-10">${user.enabled}</div>
	</div>
<jsp:include page="/WEB-INF/fragments/footer.jsp" />
</div>
</body>
</html>