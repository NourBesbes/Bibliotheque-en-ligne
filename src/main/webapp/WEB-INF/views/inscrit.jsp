


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                            <h1><strong>Online Library</strong> Registration Form</h1>
                          
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>Register in our site</h3>
                            
                        		</div>
                        		<div class="form-top-right">
                        		<p><i class="fa fa-lock"></i></p>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                   
			                    	
			                    	<form:form class="form-horizontal" method="post" role="form"
                modelAttribute="userForm" action="/biblio/inscrit" enctype="multipart/form-data">
    <spring:bind path="login">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">UserName</label>
			<div class="col-sm-10">
				<form:input path="login" type="text" class="form-control" 
                                id="login" placeholder="Login..." />
				<form:errors path="login" class="control-label" />
			</div>
		  </div>
		</spring:bind>

		<spring:bind path="password">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Password</label>
			<div class="col-sm-10">
				<form:input path="password" type="text" class="form-control" 
                                id="password" placeholder="Password" />
				<form:errors path="password" class="control-label" />
			</div>
		  </div>
		</spring:bind>

		<spring:bind path="nom">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Name</label>
			<div class="col-sm-10">			 				
				<form:input path="nom" class="form-control" 
                                id="nom" placeholder="Name" />
				<form:errors path="nom" class="control-label" />
			</div>
		  </div>
		</spring:bind>
<spring:bind path="prenom">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">First name</label>
			<div class="col-sm-10">			 				
				<form:input path="prenom" class="form-control" 
                                id="prenom" placeholder="First name" />
				<form:errors path="prenom" class="control-label" />
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

		<spring:bind path="adresse">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Adress</label>
			<div class="col-sm-10">
				<form:input path="adresse" class="form-control" 
                                id="adresse" placeholder="Adress" />
				<form:errors path="adresse" class="control-label" />
			</div>
		  </div>
		</spring:bind>
		
		<spring:bind path="mail">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">Mail</label>
			<div class="col-sm-10">
				<form:textarea path="mail" class="form-control" 
                                id="mail" placeholder="Mail" />
				<form:errors path="mail" class="control-label" />
			</div>
		  </div>
		</spring:bind>
		
			<spring:bind path="cin">
		  <div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="col-sm-2 control-label">CIN</label>
			<div class="col-sm-10">
				<form:input path="cin" class="form-control" 
                                id="cin" placeholder="CIN" />
				<form:errors path="cin" class="control-label" />
			</div>
		  </div>
		</spring:bind>

		 
			                          <button type="submit" class="btn">Sign in!</button>
	
	</form:form> <br>
	  If You Already Have An Account, <a href="/biblio">Sign In !</a>
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

               