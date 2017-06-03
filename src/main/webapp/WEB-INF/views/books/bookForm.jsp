<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="/WEB-INF/fragments/bookHeader.jsp" />
<div class="container">
	<c:choose>
		<c:when test="${bookForm['new']}">
			<h1>Add Book</h1>
			
		</c:when>
		<c:otherwise>
			<h1>Update Book</h1>
		</c:otherwise>
	</c:choose>
	<br />

	<spring:url value="/books" var="bookActionUrl" />

	<form:form class="form-horizontal" method="post" 
                modelAttribute="bookForm" action="${bookActionUrl}" enctype="multipart/form-data">
    <spring:bind path="reference">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Reference</label>
			<div class="col-sm-10">
				<form:input path="reference" type="text" class="form-control" 
                                id="reference" placeholder="reference" />
				<form:errors path="reference" class="control-label" />
			</div>
		  </div>
		</spring:bind>

		<spring:bind path="titre">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Titre</label>
			<div class="col-sm-10">
				<form:input path="titre" type="text" class="form-control" 
                                id="titre" placeholder="titre" />
				<form:errors path="titre" class="control-label" />
			</div>
		  </div>
		</spring:bind>

		<spring:bind path="auteur">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Auteur</label>
			<div class="col-sm-10">			 				
				<form:input path="auteur" class="form-control" 
                                id="auteur" placeholder="auteur" />
				<form:errors path="auteur" class="control-label" />
			</div>
		  </div>
		</spring:bind>

	<spring:bind path="photo">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Photo</label>
			<div class="col-sm-10">
 <input name="image" type="file" class="form-controll" value="image" accept="photo/gif, photo/png" onchange="testExtension(this.value, 'gif,jpg,jpeg,png');"/>
				<form:errors path="photo" class="control-label" />
			</div>
		  </div>
		</spring:bind>

		<spring:bind path="categorie">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Categorie</label>
			<div class="col-sm-10">
				<form:input path="categorie" class="form-control" 
                                id="categorie" placeholder="categorie" />
				<form:errors path="categorie" class="control-label" />
			</div>
		  </div>
		</spring:bind>
		
		<spring:bind path="description">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Description</label>
			<div class="col-sm-10">
				<form:textarea path="description" class="form-control" 
                                id="description" placeholder="description" />
				<form:errors path="description" class="control-label" />
			</div>
		  </div>
		</spring:bind>
		
			<spring:bind path="etat">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Etat</label>
			<div class="col-sm-10">
				<form:input value="Disponible" path="etat" class="form-control" 
                                id="etat" placeholder="etat" />
				<form:errors path="etat" class="control-label" />
			</div>
		  </div>
		</spring:bind>

		<div class="form-group">
		  <div class="col-sm-offset-2 col-sm-10">
			<c:choose>
			  <c:when test="${bookForm['new']}">
			     <button type="submit" class="btn-lg btn-primary pull-right">Add
                             </button>
			  </c:when>
			  <c:otherwise>
			     <button type="submit" class="btn-lg btn-primary pull-right">Update
                             </button>
			  </c:otherwise>
			</c:choose>
		  </div>
		</div>
	</form:form>
</div>
<jsp:include page="/WEB-INF/fragments/footer.jsp" />

</body>
</html>