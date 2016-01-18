<%--
  Created by IntelliJ IDEA.
  User: jose
  Date: 7/01/16
  Time: 13:51
--%>

<%@ page import="groovytest.HomeScreenController" contentType="text/html;charset=UTF-8" %>
<%@ page import="groovytest.UserController" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>@${groovytest.UserController.userSearched.username}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <style type="text/css">

    .search-field{
        border-width: 1px;
        border-color: #eeeeee;
        border-radius: 2px;
        margin-top: 0;
    }

    </style>
</head>

<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="">@${groovytest.UserController.currentUser}</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="#">Inicio<span class="sr-only">(current)</span></a></li>
                <li><a href="#">Amigos</a></li>
            </ul>
            <g:form controller="User" action="searchUser" class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" name="search" class="form-control search-field" placeholder="Buscar">
                </div>
                <button type="submit" class="btn btn-default">Buscar</button>
            </g:form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/groovyTest/profile">Mi perfil</a></li>
                <li><a href="/groovyTest/User/logout">Cerrar sesión</a> </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container">
    <h2> @${UserController.userSearched.username}</h2>
    <p>${UserController.userSearched.name} ${UserController.userSearched.lastName}</p>
    <p>${UserController.userSearched.phoneNumber}</p>
    <p>${UserController.userSearched.address}</p>
    <g:form controller="User" action="addAsFriend">
    <button type="submit" class="btn btn-primary btn-large login-button">Añadir como amigo</button>
    </g:form>
</div>
</body>
</html>