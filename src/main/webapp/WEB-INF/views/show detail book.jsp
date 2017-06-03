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
    <div class="container">
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

<div class="row">
		<label class="col-sm-2">Action</label>
		<div class="col-sm-10">  <spring:url value="/books/${livre.reference}/emprunter" var="bookUrl" />
		

				  <button class="btn btn-info" 
                                          onclick="location.href='${bookUrl}'">Emprunter</button></div>
	</div>


</div>
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
</html>