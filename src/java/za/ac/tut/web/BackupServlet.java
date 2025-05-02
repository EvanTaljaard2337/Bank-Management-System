package za.ac.tut.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BackupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // NetBeans Derby connection details
        String dbPath = "jdbc:derby://localhost:1527/BankManagementSystemDB";
        String username = "bms"; // Default NetBeans Derby username
        String password = "123"; // Default NetBeans Derby password
        
        String backupFolder = "C:/Users/thand/Documents/Modules/SWP/Project/Backups/backup_" + System.currentTimeMillis();
        String backupStatus = "Backup not started yet.";

        Connection conn = null;
        Statement stmt = null;

        try {
            // Load Derby client driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            // Connect with credentials
            conn = DriverManager.getConnection(dbPath, username, password);
            
            // Verify connection
            stmt = conn.createStatement();
            stmt.execute("SELECT 1 FROM SYSIBM.SYSDUMMY1");

            // Create backup directory if it doesn't exist
            new java.io.File(backupFolder).mkdirs();

            // Run backup
            stmt.executeUpdate("CALL SYSCS_UTIL.SYSCS_BACKUP_DATABASE('" + backupFolder.replace("\\", "\\\\") + "')");
            backupStatus = "Backup successful. Files saved to: " + backupFolder;

        } catch (ClassNotFoundException e) {
            backupStatus = "Derby driver not found. Check your libraries.";
        } catch (SQLException e) {
            backupStatus = "Database error: " + e.getMessage();
        } catch (Exception e) {
            backupStatus = "Unexpected error: " + e.getMessage();
        } finally {
            // Close resources
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            request.setAttribute("backupStatus", backupStatus);
            RequestDispatcher disp = request.getRequestDispatcher("backup_outcome.jsp");
            disp.forward(request, response);
        }
    }
}