<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">


<jsp:include page="/WEB-INF/fragments/bookHeader.jsp" />

<body>
<form:form  method="POST" action="recherchebook" class="navbar-form navbar-left" role="search">
 <div class="form-group">
    <div class="input-group input-group-lg icon-addon addon-lg">
        <input type="text" placeholder="Texte" name="code" id="schbox" class="form-control input-lg">
        <i class="icon icon-search"></i>
        <span class="input-group-btn">
            <button type="submit" class="btn btn-inverse">Find</button>
        </span>
    </div>
</div>
      </form:form> <br> <br><br> <br>
      
          <c:if test="${not empty msg1}">
		<div class="alert alert-${css} alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" 
                                aria-label="Close">
				<span aria-hidden="false">×</span>
			</button>
			<strong>${css1}</strong> ${msg1}
		</div>
	
	</c:if>
      
     <c:if test="${not empty Livre.livre}">



	<div class="container">

		

		<h1>Reserched Books</h1>

		<table class="table table-striped">
			<thead>
				<tr>
					<th>#Refrence</th>
					<th>Titre</th>
					<th>Auteur</th>
					<th>Categorie</th>
					<th>Description</th>
					<th>Action</th>
				</tr>
			</thead>

	<c:forEach items="${Livre.livre}" var="var">
			    <tr>
				<td>
					${var.reference}
				</td>
				<td>${var.titre}</td>
				<td>${var.auteur}</td>
				<td>${var.categorie}</td>
				<td>${var.description}</td>
						
				<td>
				  <spring:url value="/books/${livre.reference}" var="bookUrl" />
				  <spring:url value="/books/${livre.reference}/delete" var="deleteUrl" /> 
				  <spring:url value="/books/${livre.reference}/update" var="updateUrl" />

				  <button class="btn btn-info" 
                                          onclick="location.href='${bookUrl}'">Details</button>
				  <button class="btn btn-primary" 
                                          onclick="location.href='${updateUrl}'">Update</button>
				  <button class="btn btn-danger" 
                                          onclick="this.disabled=true;post('${deleteUrl}')">Delete</button>
                                          
                                </td>
			    </tr>
			</c:forEach>
		</table>
</div></c:if>
	
<c:if test="${ empty Livre.livre}"> 
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

		<h1>All Books</h1>

		<table id="table" class="table table-striped">
			<thead>
				<tr>
					<th>#Reference</th>
					<th>Titre</th>
					<th>Auteur</th>
					<th>Categorie</th>
					<th>Action</th>
				</tr>
			</thead>

			<c:forEach var="livre" items="${books}">
			    <tr>
				<td>
					${livre.reference}
				</td>
				<td>${livre.titre}</td>
				<td>${livre.auteur}</td>
				<td>${livre.categorie}</td>
				
				<td>
				  <spring:url value="/books/${livre.reference}" var="bookUrl" />
				  <spring:url value="/books/${livre.reference}/delete" var="deleteUrl" /> 
				  <spring:url value="/books/${livre.reference}/update" var="updateUrl" />

				  <button class="btn btn-info" 
                                          onclick="location.href='${bookUrl}'">Details</button>
				  <button class="btn btn-primary" 
                                          onclick="location.href='${updateUrl}'">Update</button>
				  <button class="btn btn-danger" 
                                          onclick="this.disabled=true;post('${deleteUrl}')">Delete</button>
                                          
                                </td>
			    </tr>
			</c:forEach>
		</table>

	</div> </c:if>

	<jsp:include page="/WEB-INF/fragments/footer.jsp" />

</body>
</html>