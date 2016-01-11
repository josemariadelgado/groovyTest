<%--
  Created by IntelliJ IDEA.
  User: jose
  Date: 7/01/16
  Time: 13:51
--%>

<%@ page import="groovytest.SignUpController" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<h1>You are logged in ass ${session.user}</h1>
<g:link controller="User" action="logout">log out</g:link>

</body>
</html>