<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>


    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>


    <style type="text/css">
    .body {
        background: white;
    }

    .signup-form {
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

    .signup-button {
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

    .form-control {
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

<body>
<div class="login">
    <div class="login-screen">
        <div class="app-title">
            <div class="container signup-form">
                <g:form controller="User" action="signUp">
                    <input type="text" class="form-control username-field" name="username" placeholder="Nombre de Usuario *" autocomplete="off">
                    <input type="password" class="form-control password-field" name="password" placeholder="Contraseña *" autocomplete="off">
                    <input type="text" class="form-control name-field" name="name" placeholder="Nombre *" autocomplete="off">
                    <input type="text" class="form-control lastname-field" name="lastName" placeholder="Apellidos *" autocomplete="off">
                    <input type="text" class="form-control phoneNumber-field" name="phoneNumber" placeholder="Teléfono" autocomplete="off">
                    <input type="text" class="form-control address-field" name="address" placeholder="Dirección" autocomplete="off">
                    <button type="submit" class="btn btn-primary signup-button">Sign Up!</button>
                </g:form>
                <g:if test="${groovytest.UserController.userAlreadyExists == 1}">
                <p class="fail-label">El nombre de usuario ya está siendo usado por otra persona.</p>
                </g:if>
                <g:if test="${groovytest.UserController.userAlreadyExists == 2}">
                    <p class="fail-label">El nombre de usuario, la contraseña, el nombre y los apellidos son campos obligatorios.</p>
                </g:if>
            </div>
    </div>
</div>
</div>
</body>
</html>