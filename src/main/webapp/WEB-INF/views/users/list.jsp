<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="/WEB-INF/fragments/header.jsp" />

<body>
<form:form  method="POST" action="rechercheuser" class="navbar-form navbar-left" role="search">
 <div class="form-group">
    <div class="input-group input-group-lg icon-addon addon-lg">
        <input type="text" placeholder="Texte" name="login" id="schbox" class="form-control input-lg">
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
      
          <c:if test="${not empty Livre}">

	<div class="container">

		

		<h1>Reserched Users</h1>

		<table class="table table-striped">
			<thead>
				<tr>
					<th>#Login</th>
					<th>Nom</th>
					<th>Prenom</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
			</thead>

	<c:forEach items="${Livre}" var="var">
			    <tr>
				<td>
					${var.login}
				</td>
				<td>${var.nom}</td>
				<td>${var.prenom}</td>
				<td>${var.mail}</td>
				
						
		<td>
				  <spring:url value="/users/${user.login}/delete" var="deleteUrl" /> 
				  <spring:url value="/users/${user.login}" var="showUrl" />

				  <button class="btn btn-primary" 
                                          onclick="location.href='${showUrl}'">Details</button>
				  <button class="btn btn-danger" 
                                          onclick="this.disabled=true;post('${deleteUrl}')">Delete</button>
                                </td>
			    </tr>
			</c:forEach>
		</table>
</div></c:if>
	
<c:if test="${ empty Livre}"> 
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

		<h1>All Users</h1>

		<table class="table table-striped">
			<thead>
				<tr>
					<th>#Login</th>
					<th>Nom</th>
					<th>Prenom</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
			</thead>
 		<c:forEach var="user" items="${users}">
			    <tr>
				<td>
					${user.login}
				</td>
				<td>${user.nom}</td>
				<td>${user.prenom}</td>
				<td>${user.mail}</td>
				<td>
				  <spring:url value="/users/${user.login}/delete" var="deleteUrl" /> 
				  <spring:url value="/users/${user.login}" var="showUrl" />

				  <button class="btn btn-primary" 
                                          onclick="location.href='${showUrl}'">Details</button>
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