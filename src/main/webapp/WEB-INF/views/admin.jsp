<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html >
<html>

    <!-- Bootstrap Core CSS -->
    <style type="text/css">
    <%@include file="/resources/admin/css/bootstrap.min.css" %>
    <%@include file="/resources/admin/css/agency.css" %>
    <%@include file="/resources/admin/font-awesome/css/font-awesome.min.css" %>

</style>
    <link href="/resources/admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/admin/css/agency.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body   background="<spring:url value='/resources/assets/css/books.jpg'/>"  />
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Online Library</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="/biblio/books">Books</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="/biblio/users">Users</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="/biblio/books1">Borrowed Books</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="/biblio/historique">History</a>
                    </li>
                      <li>
                        <a class="page-scroll"  href="/biblio/deconnecter" > Log out </a>
                    </li>
                   
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header>
        <div class="container">
            <div class="intro-text">
                <div class="intro-lead-in">Welcome Admin!</div>
                <div class="intro-heading">It's Nice To Meet You</div>
                <a href="http://localhost:8080/biblio/books1" class="page-scroll btn btn-xl">You have ${nbr} Borrowed Books ! </a>
            </div>
        </div>
    </header>

    

    
    
    
    <!-- jQuery -->
    <script src="/resources/admin/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/admin/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="/resources/admin/js/classie.js"></script>
    <script src="/recources/admin/js/cbpAnimatedHeader.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="/recources/admin/js/jqBootstrapValidation.js"></script>
    <script src="/recources/admin/js/contact_me.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/recources/admin/js/agency.js"></script>

</body>

</html>
