<%-- 
    Document   : login
    Created on : Jan 19, 2021, 1:32:32 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Login</h1>
        <h1> <font style="color: red">${requestScope.MESSAGE}</font> </h1>
        <form action="MainController" method="POST">
            <table border="0">
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th><input type="text" name="userID" value="${param.userID}" /></th>
                        <th><font color="red">${userIDError}</font></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="${param.password}" /></td>
                        <td><font color="red">${passwordError}</font></td>
                    </tr>
                </tbody>
            </table>
            <font color="red">${LOGINERROR}</font></br>
            <input type="submit" value="Login" name="btnAction" />
            <input type="submit" name="btnAction" value="View Product" />
            <input type="reset" value="Reset" />
        </form>
    </body>
</html>
