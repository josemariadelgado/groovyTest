<%--
  Created by IntelliJ IDEA.
  User: jose
  Date: 7/01/16
  Time: 13:51
--%>

<%@ page import="groovytest.HomeScreenController" contentType="text/html;charset=UTF-8" %>
<%@ page import="groovytest.UserController" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
    <h3> @${HomeScreenController.user.username}</h3>
    <p>${HomeScreenController.user.name} ${HomeScreenController.user.lastName}</p>
    <p>${HomeScreenController.user.phoneNumber}</p>
    <div class="dropdown">
        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Settings
            <span class="caret"></span></button>
        <ul class="dropdown-menu">
            <li><a href="/groovyTest/editprofile">Edit Profile</a></li>
            <li><a href="/groovyTest/User/logout">Log Out</a></li>
        </ul>
    </div>
</div>
</body>
</html>