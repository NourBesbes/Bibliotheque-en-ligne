<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="/WEB-INF/fragments/header.jsp" />

<body>

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

		<h1>Borrowed Books</h1>

		<table class="table table-striped">
			<thead>
				<tr>
					<th>#Id</th>
					<th>Login</th>
					<th>Reference</th>
					<th>DateEmprunt</th>
					
					<th>DateRetour</th>
					<th>Action</th>
				</tr>
			</thead>
 		<c:forEach var="h" items="${histo}">
			    <tr>
				<td>
					${h.id}
				</td>
				<td>${h.login}</td>
				<td>${h.reference}</td>
				<td>${h.dateEmprunt}</td>
				<td>${h.dateRetour}</td>
				<td>
				  <spring:url value="/historique/${h.id}/delete" var="deleteUrl" /> 
				 

				  <button class="btn btn-danger" 
                                          onclick="this.disabled=true;post('${deleteUrl}')">Delete</button>
                                </td>
			    </tr>
			</c:forEach>
		</table>

	</div>

	<jsp:include page="/WEB-INF/fragments/footer.jsp" />

</body>
</html>