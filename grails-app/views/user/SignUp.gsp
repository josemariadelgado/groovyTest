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
        background: #F8F8F8;
    }

    .page-title {
        margin-top: 75px;
        margin-left: 350px;

    }

    .login-form {
        margin-top: 250px;
        margin-left: 40%;
        width: 350px;
        border-spacing: 20px;
        border-radius: 2px;
        background: white;
        border: solid;
        border-width: 1px;
        border-color:#F0F0F0;
        font-family: "Ubuntu";
    }

    .login-form .form-control {
        margin-top: 7px;;
    }

    .login-form .login-button {
        margin-top: 10px;
        width: 100%;
        background: #5882FA;
        border-width: 0px;
        width: 300px;
        margin-left: 10px;
    }

    .login-form .login-button:hover {
        margin-top: 10px;
        width: 100%;
        background: #5858FA;
        border-width: 0px;
        width: 300px;
        margin-left: 10px;
    }

    .login-form .login-button:active {
        margin-top: 10px;
        width: 100%;
        background: #2E64FE;
        border-width: 0px;
        outline: none;
        width: 300px;
        margin-left: 10px;
    }

    .login-form .login-button:focus {

        outline: none;
    }

    .username-field {

    }

    .signup-form {
        margin-top: 100px;
        margin-left: 40%;
        width:350px;
        border-spacing: 10px;
        border-radius: 5px;
        background: #eaeaea;
        border: solid;
    }

    .alert-danger {
        margin-top: 15px;
    }

    .navbar-form {
        margin-right: 50px;
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
        margin-left: 15px;
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

<body>
<div class="login">
    <div class="login-screen">
        <div class="app-title">
            <h1>Sign Up</h1>
            <div class="container signup-form">
                <p><font face="" size="4">Don't have an account? Sign Up</font></p>
                <g:form controller="User" action="signUp">
                    <input type="text" class="form-control username-field" name="username" placeholder="Username" autocomplete="off">
                    <input type="password" class="form-control password-field" name="password" placeholder="Password" autocomplete="off">
                    <input type="text" class="form-control name-field" name="name" placeholder="Name" autocomplete="off">
                    <input type="text" class="form-control lastname-field" name="lastName" placeholder="Last Name" autocomplete="off">
                    <button type="submit" class="btn btn-primary signup-button">Sign Up!</button>
                </g:form>
            </div>
        <g:if test="${groovytest.UserController.registerFailed == 1}">
            <div class="alert alert-danger" role="alert">
                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                Username already exists
            </div>
        </g:if>
        <g:elseif test="${groovytest.UserController.registerFailed == 2}">
            <div class="alert alert-danger" role="alert">
                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                Password fields don't match
            </div>
        </g:elseif>
        <g:elseif test="${groovytest.UserController.registerFailed == 0}">
        </g:elseif>
    </div>
</div>
</body>
</body>
</html>