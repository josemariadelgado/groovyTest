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

    </style>
</head>
<body class="body">
<div class="container login-form">
    <form  method="POST" id="ajaxLoginForm" name="ajaxLoginForm">
        <h1 class="login-label"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Log In</h1>
        <br>
            <input type="text" class="form-control login-username" placeholder="Nombre de Usuario" name="username">
            <input type="password" class="form-control login-password" placeholder="Contraseña" name="password" autocomplete="off">
            <input type="button" onclick="authAjax(); return false;" value="Iniciar sesión" id="enviar" class="btn btn-primary btn-large login-button"></input>
    </form>
    <g:if test="${groovytest.UserController.loginFailed == 1}">
        <p class="fail-label">Nombre de usuario o contraseña incorrectos</p>
    </g:if>
    <div class="signup-link">
        <a class="" href="signup">¿No tienes cuenta?</a>
    </div>
    <div id="contenido">
</div>
</div>
<script>
    function authAjax()
    {
        var formdata = $('#ajaxLoginForm').serialize();
        var dataUrl = "/groovyTest/User/login"
        jQuery.ajax({
            type : 'POST',
            url :  dataUrl ,
            data : formdata,
            success : function(response,textStatus)
            {
                if(response == "success")
                {
                    var redirectUrl="${ createLink(action:'index' ,controller:'HomeScreen') }";
                    window.location.assign(redirectUrl);
                }
                else
                {
                    $('#contenido').html("error");
                }
            },
            error : function(
                    XMLHttpRequest,
                    textStatus,
                    errorThrown) {
            }
        });
    }

</script>
</body>
</html>