<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title> Update Profile</title>
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
   
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
   
   <f:form  method="post" modelAttribute="c" action="/biblio/update" enctype="multipart/form-data">
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">Personal Information</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="<spring:url value='C:/Users/nouha/Desktop/Nouveau dossier/BibliothequeV2/UserImage/${c.photo}'/>" class="img-circle img-responsive"> </div>

                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                       
                         <spring:bind path="nom">
		   <div class="form-group ${status.error ? 'has-error' : ''}">
			<td> First Name:</td>
			<td> <div class="col-sm-10">
				<f:input path="nom" type="text" class="form-control" 
                                id="nom" placeholder="nom" />
				<f:errors path="nom" class="control-label" />
			</div></td>
		  </div>
			
		</spring:bind>
		
		              
                      </tr>
                    
                      <tr>
                       
                         <spring:bind path="prenom">
		   <div class="form-group ${status.error ? 'has-error' : ''}">
			<td> Name:</td>
			<td><div class="col-sm-10">
				<f:input path="prenom" type="text" class="form-control" 
                                id="prenom" placeholder="prenom" />
				<f:errors path="prenom" class="control-label" />
			</div></td>
		  </div>
			
		</spring:bind>
		
		              
                      </tr>
                        
                         <tr>
                       
                         <spring:bind path="login">
		   <div class="form-group ${status.error ? 'has-error' : ''}">
			<td>Login:</td>
			<td><div class="col-sm-10">
				<f:input path="login" type="text" class="form-control" 
                                id="login" placeholder="login" />
				<f:errors path="login" class="control-label" />
			</div></td>
		  </div>
			
		</spring:bind>
		
		              
                      </tr>
             
                               <tr>
                       
                         <spring:bind path="cin">
		   <div class="form-group ${status.error ? 'has-error' : ''}">
			<td>CIN:</td>
			<td><div class="col-sm-10">
				<f:input path="cin" type="text" class="form-control" 
                                id="cin" placeholder="cin" />
				<f:errors path="cin" class="control-label" />
			</div></td>
		  </div>
			
		</spring:bind>
		
		              
                      </tr>
                             <tr>
                       
                         <spring:bind path="adresse">
		   <div class="form-group ${status.error ? 'has-error' : ''}">
			<td>Home Adress:</td>
			<td><div class="col-sm-10">
				<f:input path="adresse" type="text" class="form-control" 
                                id="adresse" placeholder="adresse" />
				<f:errors path="adresse" class="control-label" />
			</div></td>
		  </div>
			
		</spring:bind>
		
		              
                      </tr>
                      <tr>
                       
                         <spring:bind path="mail">
		   <div class="form-group ${status.error ? 'has-error' : ''}">
			<td>Email:</td>
			<td><div class="col-sm-10">
				<f:input path="mail" type="text" class="form-control" 
                                id="mail" placeholder="mail" />
				<f:errors path="mail" class="control-label" />
			</div></td>
		  </div>
			
		</spring:bind>

                      </tr>
                          <tr>
                       
                         <spring:bind path="password">
		   <div class="form-group ${status.error ? 'has-error' : ''}">
			<td>Password:</td>
			<td><div class="col-sm-10">
				<f:input path="password" type="text" class="form-control" 
                                id="password" placeholder="password" />
				<f:errors path="password" class="control-label" />
			</div></td>
		  </div>
			
		</spring:bind> </tr>
                          <tr>
		
                         <spring:bind path="photo">
		   <div class="form-group ${status.error ? 'has-error' : ''}">
			<td>Photo:</td>
			<td><div class="col-sm-10">
			 <input name="image" type="file" class="form-controll"
			  value="<spring:url value='/resources/UserImage/${c.photo}'/>"
			   accept="photo/gif, photo/png" onchange="testExtension(this.value, 'gif,jpg,jpeg,png');"/>
				<form:errors path="photo" class="control-label" />
			</div></td>
		  </div>
			
		</spring:bind>
		
		

                      </tr>
                           
                     
                     
                    </tbody>
                  </table>
                  
                 
                </div>
              </div>
            </div>
            
                 <div class="panel-footer">
                        <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
                        <span class="pull-right">
                            <button   data-toggle="tooltip" type="submit" class="btn btn-sm btn-warning">Update</button>
                            <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
                    </div>
            
          </div></f:form>
        </div>
  
    
    

        <!-- jQuery -->
    <script src="/resources/user/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/user/js/bootstrap.min.js"></script>
    
        <!-- Custom Theme JavaScript -->
    <script src="/resources/user/js/clean-blog.min.js"></script>
        
</body>
</html>