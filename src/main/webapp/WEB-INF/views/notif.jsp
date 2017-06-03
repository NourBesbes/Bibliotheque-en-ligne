<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<head>
<spring:url value="/resources/user/css/bootstrap.min.css" var="coreCss" />
<spring:url value="/resources/user/css/clean-blog.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
</head>

<body>
  <jsp:include page="/WEB-INF/fragments/userHeader.jsp" /> 
  
     <c:if test="${empty emprunt}">
     <div class="container">
		<h1>You have nothing !</h1>
		</div>
     </c:if>
     
    <c:if test="${not empty emprunt}">
	<div class="container">
		<h1>You have tried to order those books, You can do it now !</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#Refrence</th>
					<th>Titre</th>
					<th>Action</th>
				</tr>
			</thead>
	<c:forEach items="${emprunt}" var="em" varStatus="status" >
			    <tr>
				<td>${em.reference}</td>
				<td>${em.titre}</td>	
				<td>
				<c:if test="${msg3[status.index] == 'Disponible'}">
				  <spring:url value="/books/${em.reference}/emprunter" var="bookUrl" /> 
		            <spring:url value="/emprunt/${em.id}/delete" var="deleteUrl" /> 
				  <button class="btn btn-success"  onclick="location.href='${bookUrl}'">Borrow</button>
				  <button class="btn btn-warning"  onclick="this.disabled=true;post('${deleteUrl}')">Delete</button>
                  </c:if>    
                        
                   <c:if test="${msg3[status.index] == 'non Disponible' }">
                   <spring:url value="/emprunt/${em.id}/delete" var="deleteUrl" /> 
				  <button class="btn btn-danger"  >Not Available</button>  
				  <button class="btn btn-warning"  onclick="this.disabled=true;post('${deleteUrl}')">Delete</button>
                  </c:if> </td>
			    </tr>
			</c:forEach>
		</table>		
</div></c:if>
    
	<!-- /.container -->
    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>         
                <hr>
    <hr>

    <jsp:include page="/WEB-INF/fragments/footer.jsp" />
    <!-- jQuery -->
    <script src="/resources/user/js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/user/js/bootstrap.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="/resources/user/js/clean-blog.min.js"></script>
</body>
