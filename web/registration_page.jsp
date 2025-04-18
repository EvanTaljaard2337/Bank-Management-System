<%-- 
    Document   : registration_page
    Created on : 05 Apr 2025, 18:20:09
    Author     : Evan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
        <h1>Register</h1>
    <c:if test="${not empty errorMessage}">
        <div style ="color: red;">
            ${errorMessage}
        </div>
    </c:if>
    <form action="RegisterServlet" method="POST">
        <input type="text" name="fullName" placeholder="Full Name" required />
        <input type="text" name="id" placeholder="User  ID" required />
        <input type="email" name="email" placeholder="Email" required />
        <input type="password" name="password" placeholder="Password" required />
        <input type="text" name="address" placeholder="Address" required />
        <input type="text" name="phone" placeholder="Phone" required />
        <input type="submit" value="Register" />
    </form>
    </body>
</html>
