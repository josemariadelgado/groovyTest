<%--
  Created by IntelliJ IDEA.
  User: jose
  Date: 7/01/16
  Time: 13:51
--%>

<%@ page import="groovytest.ProfileController; groovytest.HomeScreenController" contentType="text/html;charset=UTF-8" %>
<%@ page import="groovytest.UserController" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Perfil @${groovytest.UserController.currentUser}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <style type="text/css">

        .editprofile-form {
            margin-top: 5%;
            margin-left: auto;
            width: 350px;
            font-family: "Ubuntu";
        }

        .changepassword-form {
            margin-top: 30px;
            margin-left: auto;
            width: 350px;
            font-family: "Ubuntu";
        }

        .form-control {
            border-width: 1px;
            border-color: #eeeeee;
            border-radius: 2px;
            margin-top: 7px;
        }

        .search-field{
            border-width: 1px;
            border-color: #eeeeee;
            border-radius: 2px;
            margin-top: 0;
        }

        .login-button {
            margin-top: 10px;
            width: 100%;
            background: #5882FA;
            border-width: 0px;
        }

        .fail-label {
            color: red;
            margin-left: 0px;
            margin-top: 20px;
            margin-bottom: -10px;
        }

        .fail-label-succes {
            color: green;
            margin-left: 0px;
            margin-top: 20px;
            margin-bottom: -10px;
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
                <li><a href="/groovyTest/homeScreen/index">Inicio<span class="sr-only">(current)</span></a></li>
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
<g:if test="${ProfileController.editProfile == 0}">
<div class="container">
    <h2>${user.name} ${user.lastName}</h2>
    <p>@${user.username}</p>
    <p>${user.phoneNumber}</p>
    <p>${user.address}</p>
    <g:form controller="Profile" action="editProfileView">
    <button type="submit" class="btn btn-default btn-large editprofile-button">Editar perfil</button>
        </g:form>
</div>
    </g:if>
    <g:elseif test="${ProfileController.editProfile == 1}">
        <g:form controller="Profile" action="editProfile">
        <div class="container editprofile-form">
            <input type="text" class="form-control login-username" value="${user.username}"
            placeholder="Nombre de Usuario" name="username" autocomplete="off">
            <input type="text" class="form-control login-username" value="${user.name}"
            placeholder="Nombre" name="name" autocomplete="off">
            <input type="text" class="form-control login-username" value="${user.lastName}"
            placeholder="Apellidos" name="lastName" autocomplete="off">
            <input type="text" class="form-control login-username" value="${user.phoneNumber}"
            placeholder="Teléfono" name="phoneNumber" autocomplete="off">
            <input type="text" class="form-control login-username" value="${user.address}"
            placeholder="Dirección" name="address" autocomplete="off">
            <button type="submit" class="btn btn-primary btn-large login-button">Guardar</button>
        </div>
        </g:form>
        <div class="container changepassword-form">
            <g:form controller="Profile" action="changePassword">
                <input type="password" class="form-control login-password" placeholder="Nueva  contraseña" name="password" autocomplete="off">
                <input type="password" class="form-control login-password" placeholder="Repite la contraseña" name="repeatPassword" autocomplete="off">
                <button type="submit" class="btn btn-primary btn-large login-button">Cambiar contraseña</button>
            </g:form>
        </div>
    </g:elseif>
<g:elseif test="${ProfileController.editProfile == 2}">
    <g:form controller="Profile" action="editProfile">
        <div class="container editprofile-form">
            <input type="text" class="form-control login-username" value="${user.username}"
                   placeholder="Nombre de Usuario" name="username" autocomplete="off">
            <input type="text" class="form-control login-username" value="${user.name}"
                   placeholder="Nombre" name="name" autocomplete="off">
            <input type="text" class="form-control login-username" value="${user.lastName}"
                   placeholder="Apellidos" name="lastName" autocomplete="off">
            <input type="text" class="form-control login-username" value="${user.phoneNumber}"
                   placeholder="Teléfono" name="phoneNumber" autocomplete="off">
            <input type="text" class="form-control login-username" value="${user.address}"
                   placeholder="Dirección" name="address" autocomplete="off">
            <button type="submit" class="btn btn-primary btn-large login-button">Guardar</button>
            <p class="fail-label">El nombre de usuario, el nombre y los apellidos no pueden estar vacios.</p>
        </div>
    </g:form>
    <div class="container changepassword-form">
        <g:form controller="Profile" action="changePassword">
            <input type="password" class="form-control login-password" placeholder="Nueva contraseña" name="password" autocomplete="off">
            <input type="password" class="form-control login-password" placeholder="Repite la contraseña" name="repeatPassword" autocomplete="off">
            <button type="submit" class="btn btn-primary btn-large login-button">Cambiar contraseña</button>
        </g:form>
    </div>
</g:elseif>
<g:elseif test="${ProfileController.editProfile == 3}">
    <g:form controller="Profile" action="editProfile">
        <div class="container editprofile-form">
            <input type="text" class="form-control login-username" value="${user.username}"
                   placeholder="Nombre de Usuario" name="username" autocomplete="off">
            <input type="text" class="form-control login-username" value="${user.name}"
                   placeholder="Nombre" name="name" autocomplete="off">
            <input type="text" class="form-control login-username" value="${user.lastName}"
                   placeholder="Apellidos" name="lastName" autocomplete="off">
            <input type="text" class="form-control login-username" value="${user.phoneNumber}"
                   placeholder="Teléfono" name="phoneNumber" autocomplete="off">
            <input type="text" class="form-control login-username" value="${user.address}"
                   placeholder="Dirección" name="address" autocomplete="off">
            <button type="submit" class="btn btn-primary btn-large login-button">Guardar</button>
        </div>
    </g:form>
    <div class="container changepassword-form">
        <g:form controller="Profile" action="changePassword">
            <input type="password" class="form-control login-password" placeholder="Nueva contraseña" name="password" autocomplete="off">
            <input type="password" class="form-control login-password" placeholder="Repite la contraseña" name="repeatPassword" autocomplete="off">
            <button type="submit" class="btn btn-primary btn-large login-button">Cambiar contraseña</button>
            <p class="fail-label">Los campos no coinciden.</p>
        </g:form>
    </div>
</g:elseif>
<g:elseif test="${ProfileController.editProfile == 4}">
    <g:form controller="Profile" action="editProfile">
        <div class="container editprofile-form">
            <input type="text" class="form-control login-username" value="${user.username}"
                   placeholder="Nombre de Usuario" name="username" autocomplete="off">
            <input type="text" class="form-control login-username" value="${user.name}"
                   placeholder="Nombre" name="name" autocomplete="off">
            <input type="text" class="form-control login-username" value="${user.lastName}"
                   placeholder="Apellidos" name="lastName" autocomplete="off">
            <input type="text" class="form-control login-username" value="${user.phoneNumber}"
                   placeholder="Teléfono" name="phoneNumber" autocomplete="off">
            <input type="text" class="form-control login-username" value="${user.address}"
                   placeholder="Dirección" name="address" autocomplete="off">
            <button type="submit" class="btn btn-primary btn-large login-button">Guardar</button>
        </div>
    </g:form>
    <div class="container changepassword-form">
        <g:form controller="Profile" action="changePassword">
            <input type="password" class="form-control login-password" placeholder="Nueva contraseña" name="password" autocomplete="off">
            <input type="password" class="form-control login-password" placeholder="Repite la contraseña" name="repeatPassword" autocomplete="off">
            <button type="submit" class="btn btn-primary btn-large login-button">Cambiar contraseña</button>
            <p class="fail-label-succes">Tu contraseña se ha actualizado.</p>
        </g:form>
    </div>
</g:elseif>
<g:elseif test="${ProfileController.editProfile == 5}">
    <g:form controller="Profile" action="editProfile">
        <div class="container editprofile-form">
            <input type="text" class="form-control login-username" value="${user.username}"
                   placeholder="Nombre de Usuario" name="username" autocomplete="off">
            <input type="text" class="form-control login-username" value="${user.name}"
                   placeholder="Nombre" name="name" autocomplete="off">
            <input type="text" class="form-control login-username" value="${user.lastName}"
                   placeholder="Apellidos" name="lastName" autocomplete="off">
            <input type="text" class="form-control login-username" value="${user.phoneNumber}"
                   placeholder="Teléfono" name="phoneNumber" autocomplete="off">
            <input type="text" class="form-control login-username" value="${user.address}"
                   placeholder="Dirección" name="address" autocomplete="off">
            <button type="submit" class="btn btn-primary btn-large login-button">Guardar</button>
            <p class="fail-label-succes">Tus datos se han actualizado.</p>
        </div>
    </g:form>
    <div class="container changepassword-form">
        <g:form controller="Profile" action="changePassword">
            <input type="password" class="form-control login-password" placeholder="Nueva contraseña" name="password" autocomplete="off">
            <input type="password" class="form-control login-password" placeholder="Repite la contraseña" name="repeatPassword" autocomplete="off">
            <button type="submit" class="btn btn-primary btn-large login-button">Cambiar contraseña</button>
        </g:form>
    </div>
</g:elseif>
</body>
</html>