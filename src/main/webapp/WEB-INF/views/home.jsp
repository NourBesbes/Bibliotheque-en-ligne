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
				  <spring:url value="/books/${var.reference}/emprunter" var="bookUrl" />
		

				  <button class="btn btn-info" 
                                          onclick="location.href='${bookUrl}'">Emprunter</button>
				  
                                          
                                </td>
			    </tr>
			</c:forEach>
		</table>
</div></c:if>
	
<c:if test="${ empty Livre.livre}">
    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
             
                <hr>
</div></div></div>
<!-- Page Content -->
    <div class="container">

        <!-- Page Header -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Available Books
                    <small>Hope you will find what you are searching!</small>
                </h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
       <c:forEach var="livre" items="${books}">
            <div class="col-md-4 portfolio-item">
                <a href="#">
                    <img class="img-responsive"  src="<spring:url  value='/resources/image/${livre.photo}'/>" alt="">
                </a>
                <h3>
                    <a   href="/biblio/books/${livre.reference}/user" >${livre.titre}</a>
                </h3>
                <p>Auteur: ${livre.auteur}</p>
              
                <p>   <spring:url value="/books/${livre.reference}/emprunter" var="bookUrl" />
		

				  <button class="btn btn-info" 
                                          onclick="location.href='${bookUrl}'">Emprunter</button></p>
            </div>
            
            </c:forEach>
            </div>
       
        <!-- /.row -->

       

      
        

     
    

    </div>
    </c:if>
    
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
