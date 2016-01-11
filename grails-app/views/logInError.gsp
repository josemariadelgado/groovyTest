<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>Log In</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>




    <style type="text/css">
    * {
        box-sizing: border-box;
    }

    *:focus {
        outline: none;
    }
    body {
        font-family: Arial;
        background-color: #E6E6E6;
        padding: 50px;
    }
    .login {
        margin: 20px auto;
        width: 300px;
    }
    .login-screen {
        background-color: #FFF;
        padding: 20px;
        border-radius: 5px
    }

    .app-title {
        text-align: center;
        color: #777;
        margin-bottom: 30px;
        margin-top: -15px;
    }

    .login-form {
        text-align: center;
    }
    .control-group {
        margin-bottom: 10px;
    }

    input {
        text-align: center;
        background-color: #ECF0F1;
        border: 2px solid transparent;
        border-radius: 3px;
        font-size: 16px;
        font-weight: 200;
        padding: 10px 0;
        width: 250px;
        transition: border .5s;
    }

    input:focus {
        border: 2px solid #3498DB;
        box-shadow: none;
    }

    .btn {
        border: 2px solid transparent;
        background: #3498DB;
        color: #ffffff;
        font-size: 16px;
        line-height: 25px;
        padding: 10px 0;
        text-decoration: none;
        text-shadow: none;
        border-radius: 3px;
        box-shadow: none;
        transition: 0.25s;
        display: block;
        width: 250px;
        margin: 0 auto;
        margin-top: 15px
    ;
    }

    .btn:hover {
        background-color: #2989B4;
    }

    .login-link {
        font-size: 13px;
        color: #444;
        display: block;
        margin-top: 12px;
    }

    .alert-danger {
        margin-top: 20px;
        margin-bottom: -5px;
        line-height: 5px;
    }

    </style>


</head>

<body>

<body>
<div class="login">
    <div class="login-screen">
        <div class="app-title">
            <h1>Login</h1>
        </div>
        <g:form controller="User" action="login">
            <div class="login-form">
                <div class="control-group">
                    <input type="text" class="login-field" value="${params.username}" placeholder="username" name="username">
                </div>

                <div class="control-group">
                    <input type="password" class="login-field" value="" placeholder="password" name="password">
                </div>

                <button type="submit" class="btn btn-primary btn-large btn-block">Login</button>
                <a class="login-link" href="/groovyTest/signup">Don't have an account?</a>
        </g:form>
    </div>
        <div class="alert alert-danger" role="alert">Wrong username or password</div>
    </div>
</div>

</body>

</body>
</html>
