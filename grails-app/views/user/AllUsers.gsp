<%--
  Created by IntelliJ IDEA.
  User: jose
  Date: 21/01/16
  Time: 10:07
--%>

<%@ page import="groovytest.UserController" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <style type="text/css">
        .btn-users {
            margin-top: 10px;
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
            <a class="navbar-brand" href="">@${groovytest.UserController.currentUser.username}</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="/groovyTest/HomeScreen/index">Inicio<span class="sr-only">(current)</span></a></li>
                <li class="active"><a href="/groovyTest/allusers">Usuarios</a></li>
            </ul>
            <g:form controller="User" action="searchUser" class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" name="search" class="form-control search-field" placeholder="Buscar">
                </div>
                <button type="submit" class="btn btn-default">Buscar</button>
            </g:form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/groovyTest/Profile/index">Mi perfil</a></li>
                <li><a href="/groovyTest/User/logout">Cerrar sesión</a> </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container">
<g:each in="${allUsers}">
    <g:if test="${groovytest.UserController.currentUser.username != it.username}">
    <g:form controller="User" action="searchUser">
        <input hidden type="text" name="search" value="${it.username}">
        <button type="submit" class="btn btn-primary btn-users">@${it.username} | ${it.name} ${it.lastName} </button><br>
    </g:form>
    </g:if>
</g:each>
</div>
</body>
</html>