<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Biblio</title>
</head>
<body>
 <!-- Navigation -->
    <nav class="navbar navbar-default navbar-custom navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Online Library</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="/biblio/home">Home</a>
                    </li>
                    <li>
                        <a href="/biblio/you">About You</a>
                    </li>
                      <li>
                        <a href="/biblio/notification">Notification <span class="badge">${nbre} </span></a>
                    </li>
                    <li>
                        <a href="/biblio/deconnecter" > Log out </a>
                    </li>
                    <li>
                        <a ><f:form  method="POST" action="recherche" class="navbar-form navbar-left" role="search">
 <div class="form-group">
    <div class="input-group input-group-lg icon-addon addon-lg">
        <input type="text" placeholder="Texte" name="code" id="schbox" class="form-control input-lg">
        <i class="icon icon-search"></i>
        <span class="input-group-btn">
            <button type="submit" class="btn btn-inverse">Find</button>
        </span>
    </div>
</div>
      </f:form>
      
      </a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-image: url('<spring:url value='/resources/assets/css/books.jpg'/>')">
        
	
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="site-heading">
                        <h1>Welcome</h1>
                        <hr class="small">
                        <span class="subheading">    ${Client.prenom} ${Client.nom}</span>
                    </div>
                </div>
            </div>
        </div>
    </header>
    
    <c:if test="${not empty msg1}">
		<div class="alert alert-${css} alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" 
                                aria-label="Close">
				<span aria-hidden="false">×</span>
			</button>
			<strong>${css1}</strong> ${msg1}
		</div>
	
	</c:if>
    <c:if test="${not empty msg}">
		<div class="alert alert-${css} alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" 
                                aria-label="Close">
				<span aria-hidden="false">×</span>
			</button>
			<strong>${css1}</strong> ${msg}
		</div>
	
	</c:if>
</body>
</html>