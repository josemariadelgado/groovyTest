<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <g:javascript library="jquery" />
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <style type="text/css">

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

    .failedLabel {
        margin-top: 20px;
        margin-left: 11px;
        margin-bottom: -5px;
    }

    </style>
    <script>
        function signUp()
        {
            var formdata = $('#signUpForm').serialize();
            var dataUrl = "${createLink(controller: "SignUp", action: "signUp") }";
            jQuery.ajax({
                type : 'POST',
                url :  dataUrl ,
                data : formdata,
                success : function(response,textStatus) {

                    if(response == "User saved") {
                        var redirectUrl="${createLink(controller: "LogIn", action: "index") }";
                        window.location.assign(redirectUrl);

                    } else if(response == "Empty fields") {
                        $('#failedLabel').html("Debes rellenar todos los campos");
                        document.getElementById("failedLabel").style.color = "red";

                    } else if(response == "User already exists") {
                        $('#failedLabel').html("El nombre de usuario no está disponible");
                        document.getElementById("failedLabel").style.color = "red";
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
</head>
<body>
<div class="container signup-form">
    <form method="POST" id="signUpForm" name="signUpForm">
        <input type="text" class="form-control username-field" name="username" placeholder="Nombre de Usuario *" autocomplete="off">
        <input type="text" class="form-control name-field" name="name" placeholder="Nombre *" autocomplete="off">
        <input type="password" class="form-control password-field" name="password" placeholder="Contraseña *" autocomplete="off">
        <input type="button" class="btn btn-primary signup-button" value="Regístrate" onclick="signUp(); return false;">
    </form>
    <p class="failedLabel" id="failedLabel"></p>
</div>
</body>
</html>