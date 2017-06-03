<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">


<jsp:include page="/WEB-INF/fragments/bookHeader.jsp" />

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

		<h1>Borrowed Books </h1>

		<table id="table" class="table table-striped">
			<thead>
				<tr>
				<th>#Id Emprunt</th>
					<th>Reference</th>
					
					<th>Login</th>
					
					
					<th>Action</th>
				</tr>
			</thead>

			<c:forEach var="livre" items="${books}">
			    <tr>
			    <td>${livre.id}</td>
				<td>${livre.reference}</td>
			
				<td>${livre.login}</td>
				
				
				
				<td>
				  <spring:url value="/books/${livre.reference}/${livre.id}/change" var="bookUrl" />
		

				  <button class="btn btn-info" 
                                          onclick="location.href='${bookUrl}'">Retour</button>
				  
                                          
                                </td>
			    </tr>
			</c:forEach>
		</table>

	</div>

	<jsp:include page="/WEB-INF/fragments/footer.jsp" />

</body>
</html>