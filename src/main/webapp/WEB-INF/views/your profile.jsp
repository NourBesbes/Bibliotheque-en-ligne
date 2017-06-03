<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<html>
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
    
   
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
   
   
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">Personal Information</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic"
                 src="<spring:url value='/resources/UserImage/${c.photo}'/>" 
                 class="img-circle img-responsive"> </div>
        
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>First Name:</td>
                        <td>${c.nom}</td>
                      </tr>
                      <tr>
                        <td>Name:</td>
                        <td>${c.prenom}</td>
                      </tr>
                      <tr>
                        <td>Login</td>
                        <td>${c.login}</td>
                      </tr>
                   
                         <tr>
                             <tr>
                        <td>CIN:</td>
                        <td>${c.cin}</td>
                      </tr>
                        <tr>
                        <td>Home Address:</td>
                        <td>${c.adresse}</td>
                      </tr>
                      <tr>
                        <td>Email</td>
                        <td><a href="mailto:info@support.com">${c.mail}</a></td>
                      </tr>
                        <td>Password</td>
                        <td>${c.password}
                        </td>
                           
                      </tr>
                     
                    </tbody>
                  </table>
                  
                 
                </div>
              </div>
            </div>
                 <div class="panel-footer">
                        <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
                        <span class="pull-right">
                            <a href="/biblio/${c.login}/update" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning">Update</a>
                            <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
                    </div>
            
          </div>
        </div>
  
    
    

        <!-- jQuery -->
    <script src="/resources/user/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/user/js/bootstrap.min.js"></script>
    
        <!-- Custom Theme JavaScript -->
    <script src="/resources/user/js/clean-blog.min.js"></script>
        
</body>
</html>