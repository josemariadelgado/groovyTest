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
    <title>@${searchedUser.username}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <style type="text/css">

    .search-field {
        border-width: 1px;
        border-color: #eeeeee;
        border-radius: 2px;
        margin-top: 0;
    }

    </style>

    <script>
        function followUser() {
            var formdata = $('#follow').serialize();
            var dataUrl = "${createLink(controller: "FollowUser", action: "followUser") }";
            jQuery.ajax({
                type : 'POST',
                url :  dataUrl ,
                data : formdata,
                success : function(response,textStatus) {

                    if(response == "Success") {
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

        function unfollowUser() {
            var formdata = $('#unfollow').serialize();
            var dataUrl = "${createLink(controller: "FollowUser", action: "unfollowUser") }";
            jQuery.ajax({
                type : 'POST',
                url :  dataUrl ,
                data : formdata,
                success : function(response,textStatus) {

                    if(response == "Success") {
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
                <li><a href="/groovyTest/HomeScreen/index">Inicio<span class="sr-only">(current)</span></a></li>
            </ul>
            <g:form controller="User" action="searchUser" class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" name="search" class="form-control search-field" placeholder="Buscar">
                </div>
                <button type="submit" class="btn btn-default">Buscar</button>
            </g:form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/groovyTest/Profile/index">Mi perfil</a></li>
                <li><a href="/groovyTest/User/logout">Cerrar sesión</a> </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container">
    <h2> @${searchedUser.username}</h2>
    <p>${searchedUser.name}</p>
    <g:if test="${following}" >
        <form method="POST" type="submit" id="unfollow">
         <button type="submit" onclick="unfollowUser(); return false;" onmouseover="this.innerHTML = 'Dejar de seguir'" onmouseout="this.innerHTML = 'Siguiendo'"
                 class="btn btn-default btn-large unfollow-button">Siguiendo</button>
        </form>
    </g:if>
    <g:else>
        <form method="POST" type="submit" id="follow">
            <button class="btn btn-primary btn-large" onclick="followUser(); return false;" type="submit">Seguir</button>
        </form>
    </g:else>
</div>
</body>
</html>