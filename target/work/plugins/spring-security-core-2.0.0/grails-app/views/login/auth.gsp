<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
	<g:javascript library="jquery" />
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<style type='text/css' media='screen'>

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

	.signup-link {
		width: 200px;
		margin-left: 100px;
		margin-top: 30px;
		margin-bottom: -20px;
	}

	.failedLabel {
		margin-top: 30px;
		margin-left: 11px;
		margin-bottom: -30px;
	}
	</style>
</head>

<body>
<div class="container login-form">
	<form  method="POST" id="loginForm" name="ajaxLoginForm">
		<input type="text" class="form-control login-username" placeholder="Nombre de Usuario" name="j_username">
		<input type="password" class="form-control login-password" placeholder="Contraseña" name="j_password" autocomplete="off">
		<button type="submit" onclick="login(); return false;" id="enviar" class="btn btn-primary btn-large login-button">Iniciar sesión</button>
	</form>
	<div class="signup-link">
		<g:link controller="SignUp" action="index">¿No tienes cuenta?</g:link>
	</div>
		<p class="failedLabel" id="login_message"></p>
</div>
<script type='text/javascript'>

function login()
{
	var formdata = $('#loginForm').serialize();
	var dataUrl = "${postUrl}";
	jQuery.ajax({
		type : 'POST',
		url :  dataUrl,
		data : formdata,
		success : function(response,textStatus) {
			if(response.success) {
				var redirectUrl="${createLink(controller:'Home', action: "index") }";
				window.location.assign(redirectUrl);
			}
			else {
				$('#login_message').html("Nombre de usuario y contraseña incorrectos");
				document.getElementById("login_message").style.color = "red";
				shakeForm();
			}
		},
		error : function(
				XMLHttpRequest,
				textStatus,
				errorThrown) {
		}
	});
}
function shakeForm() {
	var l = 10;
	for( var i = 0; i < 10; i++ )
		$( "#login_message" ).animate( {
			'margin-left': "+=" + ( l = -l ) + 'px',
			'margin-right': "-=" + l + 'px'
		}, 50);
}
</script>
</body>
</html>
