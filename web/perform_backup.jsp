<%-- 
    Document   : perform_backup
    Created on : 29 Apr 2025, 1:47:48 PM
    Author     : thand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perform Backup Page</title>
    </head>
    <body>
        <h1>Perform backup</h1>
        <p>
            By performing the backup the database will be exported/copied to a backup file. Click below to backup.
        </p>
        <form action="BackupServlet.do" method="POST">
            <table>
                <tr>
                    <td>Backup: </td>
                    <td><input type="submit" value="BACKUP"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
