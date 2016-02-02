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
    <title>Inicio @${user.username}</title>
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
    <script>
        function searchUser()
        {
            var formdata = $('#searchForm').serialize();
            var dataUrl = "${createLink(controller: "SearchUser", action: "searchUser") }";
            jQuery.ajax({
                type : 'POST',
                url :  dataUrl ,
                data : formdata,
                success : function(response,textStatus) {

                    if(response == "Blank field") {
                        $('#failedLabel').html("Escribe un nombre de usuario");
                        document.getElementById("failedLabel").style.color = "red";
                        shakeForm();

                    } else if(response == "Searched yourself") {
                        $('#failedLabel').html("No te puedes buscar a ti mismo");
                        document.getElementById("failedLabel").style.color = "red";
                        shakeForm();

                    } else if(response == "User not found") {
                        $('#failedLabel').html("Usuario no encontrado");
                        document.getElementById("failedLabel").style.color = "red";
                        shakeForm();

                    } else if(response == "User founded") {
                        var redirectUrl="${createLink(controller: "SearchUser", action: "index") }";
                        window.location.assign(redirectUrl);
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
                $( "#failedLabel" ).animate( {
                    'margin-left': "+=" + ( l = -l ) + 'px',
                    'margin-right': "-=" + l + 'px'
                }, 50);
        }
        </script>
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
            <form method="Post" id="searchForm" class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" name="search" class="form-control search-field" placeholder="Buscar">
                </div>
                <button type="submit" onclick="searchUser(); return false;" class="btn btn-default">Buscar</button>
            </form>
        <ul class="nav navbar-nav navbar-left">
            <li><a id="failedLabel"></a></li>
        </ul>
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
</div>
</body>
</html>