<%--
  Created by IntelliJ IDEA.
  User: jose
  Date: 7/01/16
  Time: 13:51
--%>

<%@ page import="groovytest.HomeController" contentType="text/html;charset=UTF-8" %>
<%@ page import="groovytest.UserController" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Inicio @${groovytest.UserController.currentUser}</title>
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
            <a class="navbar-brand" href="">@${user.username}</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Inicio<span class="sr-only">(current)</span></a></li>
                <li><a href="/groovyTest/allusers">Usuarios</a></li>
            </ul>
            <g:form controller="User" action="searchUser" class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" name="search" class="form-control search-field" placeholder="Buscar">
                </div>
                <button type="submit" class="btn btn-default">Buscar</button>
            </g:form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/groovyTest/Profile/index">Mi perfil</a></li>
                <li><a href="j_spring_security_logout">Cerrar sesión</a> </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container">
    <div class="user-info">
    <h2> @${user.username}</h2>
    <p>${user.name}</p>
    </div>
</div><br>
<div class="container">
    <label>Mensaje:</label>
    <textarea class="form-control" rows="5"></textarea>
</div>
</body>
</html>