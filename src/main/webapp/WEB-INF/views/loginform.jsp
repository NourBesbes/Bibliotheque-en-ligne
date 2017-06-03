<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Biblio</title>
<style type="text/css">
    <%@include file="/resources/assets/bootstrap/css/bootstrap.min.css" %>
    <%@include file="/resources/assets/font-awesome/css/font-awesome.min.css" %>
    <%@include file="/resources/assets/css/form-elements.css" %>
    <%@include file="/resources/assets/css/style.css" %>

</style>
<spring:url value="/resources/assets/css/a.css" var="bootstrapCss4" />
<link href="${bootstrapCss4}"  rel="stylesheet" />
   
 <!-- Favicon and touch icons -->
<spring:url value="/resources/assets/ico/favicon.png" var="coreCss2" />
<spring:url value="/resources/assets/ico/apple-touch-icon-144-precomposed.png" var="bootstrapCss2" />
<link href="${bootstrapCss2}"  rel="shortcut icon" />
<link href="${coreCss2}" rel="apple-touch-icon-precomposed" sizes="144x144" />
<spring:url value="/resources/assets/ico/apple-touch-icon-114-precomposed.png" var="coreCss3" />
<spring:url value="/resources/assets/ico/apple-touch-icon-72-precomposed.png" var="bootstrapCss3" />
<link href="${bootstrapCss3}"  rel="apple-touch-icon-precomposed" sizes="114x114"/>
<link href="${coreCss3}" rel="apple-touch-icon-precomposed" sizes="72x72"/>
</head>
<body   background="<spring:url value='/resources/assets/css/books.jpg'/>"/>

   <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>Online Library</strong> Login Form</h1>
                          
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>Login to our site </h3>
                        			    <c:if test="${not empty msg}">
		<div class="alert alert-${css} alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" 
                                aria-label="Close">
				<span aria-hidden="false">×</span>
			</button>
			<strong>${css1}</strong> ${msg}
		</div>
	
	</c:if>
                            		<p>Enter your username and password to log on:</p>
                        		</div>
                        		<div class="form-top-right">
                        		<p><i class="fa fa-lock"></i></p>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <f:form role="form" action="/biblio/login" method="post" class="login-form" modelAttribute="userForm">
			                    	 <spring:bind path="login">
			                    	 <div class="form-group ${status.error ? 'has-error' : ''}">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username"><i class=" icon-user"></i>Username</label>
			                        	
			                        	<f:input type="text" path="login" placeholder="Username..." class="form-username form-control" id="form-username"/>
			                       <f:errors path="login" class="control-label" />
			                        </div>
			                        </div>
			                        </spring:bind>
			                        <spring:bind path="password">
			                        <div class="form-group ${status.error ? 'has-error' : ''}">
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<f:input type="password" path="password" placeholder="Password..." class="form-password form-control" id="form-password"/>
			                 
			                         <f:errors path="password" class="control-label" />
			                        </div>
			                       </div>
			                       </spring:bind>
			                        <button type="submit" class="btn">Sign in!</button>
			                    </f:form> <br>
			                    If You Don't Have An Account, <a href="inscrit">Register Now !</a>
		                    </div>
                        </div> 
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                        	<h3>...or login with:</h3>
                        	<div class="social-login-buttons">
	                        	<a class="btn btn-link-2" href="#">
	                        		<i class="fa fa-facebook"></i> Facebook
	                        	</a>
	                        	<a class="btn btn-link-2" href="#">
	                        		<i class="fa fa-twitter"></i> Twitter
	                        	</a>
	                        	<a class="btn btn-link-2" href="#">
	                        		<i class="fa fa-google-plus"></i> Google Plus
	                        	</a>
                        	</div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="/resources/assets/js/jquery-1.11.1.min.js"></script>
        <script src="/resources/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="/resources/assets/js/jquery.backstretch.min.js"></script>
        <script src="/resources/assets/js/scripts.js"></script>
  
            <script src="/resources/assets/js/placeholder.js"></script>
    
<jsp:include page="/WEB-INF/fragments/footer.jsp" />
	</body>
	</html>