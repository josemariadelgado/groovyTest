<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Social</title>
    <g:javascript library="jquery" />
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <style type="text/css">

    .body {
        background: white;
    }

    .login-form {
        margin-top: 250px;
        margin-left: auto;
        width: 350px;
        border-spacing: 20px;
        border-radius: 5px;
        background: white;
        border: solid;
        border-width: 1px;
        border-color:#F0F0F0;
        font-family: "Ubuntu";
    }

    .login-form .form-control {
        margin-top: 7px;;
    }

    .login-button {
        margin-top: 10px;
        width: 100%;
        background: #5882FA;
        border-width: 0px;
        width: 300px;
        margin-left: 10px;
    }



    .signup-form .form-control {
        margin-top: 7px;
    }

    .signup-form .signup-button {
        margin-top: 15px;
    }

        .login-username {
            border-width: 1px;
            border-color: #eeeeee;
            border-radius: 2px;
            width: 300px;
            margin-left: 10px;
        }

        .login-password {
            border-width: 1px;
            border-color: #eeeeee;
            border-radius: 2px;
            width: 300px;
            margin-left: 10px;
        }

        .login-label{
            margin-top: 0px;
            margin-left: 28%;
            color: #424242;
        }

        .fail-label {
            color: red;
            margin-left: 18px;
            margin-top: 20px;
            margin-bottom: -10px;
        }

        .signup-link {
            width: 200px;
            margin-left: 100px;
            margin-top: 30px;
            margin-bottom: -20px;
        }

        .user-count {

            margin-left: ;
            margin-top: 200px;
        }

    </style>
</head>
<body class="body">
<div class="container login-form">
    <g:form controller="User" action="login">
        <h1 class="login-label"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Log In</h1>
        <br>
            <input type="text" class="form-control login-username" placeholder="Nombre de Usuario" name="username">
            <input type="password" class="form-control login-password" placeholder="Contraseña" name="password" autocomplete="off">
            <button type="submit" class="btn btn-primary btn-large login-button">Iniciar sesión</button>
    </g:form>
    <g:if test="${groovytest.UserController.loginFailed == 1}">
        <p class="fail-label">Nombre de usuario o contraseña incorrectos</p>
    </g:if>
    <div class="signup-link">
        <a class="" href="signup">¿No tienes cuenta?</a>
    </div>
    <g:link controller="User" action="login" elementId="link">Log in</g:link>
    <div id="contenido">
</div>
</div>
%{--<p class="user-count">Usuarios registrados: ${usersCount}</p>--}%
<script>
$(document).ready(function() {

    $('#link').click(function() {
        $('#contenido').load(this.href); return false;
    });

});
</script>
</body>
</html>