/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package za.ac.tut.ejb.bl;

import java.util.Properties;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import za.ac.tut.entities.PasswordResetService;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import za.ac.tut.util.EmailUtility;

/**
 *
 * @author Evan
 */
@Stateless
public class PasswordResetServiceFacade extends AbstractFacade<PasswordResetService> implements PasswordResetServiceFacadeLocal {

    @PersistenceContext(unitName = "BMSEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PasswordResetServiceFacade() {
        super(PasswordResetService.class);
    }
    
    @Override
    public void sendMail(String recipient,String emailAddress) {
        String token = UUID.randomUUID().toString(); // assume token generation here
        String resetLink = "http://localhost:8080/YourApp/resetPassword.jsp?token=" + token;

        String subject = "Reset Your Password";
        String body = "Dear user,\n\nPlease reset your password using the link below:\n" + resetLink + "\n\nIf you did not request this, ignore this email.";
        String password = "lvpd vobd ujuk esbb";
        try {
            EmailUtility.sendEmail(recipient, subject, body,emailAddress,password);
        } catch (MessagingException e) {
            Logger.getLogger(PasswordResetServiceFacade.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    @Override
    public PasswordResetService findByToken(String token) {
        try {
            return em.createQuery("SELECT p FROM PasswordResetService p WHERE p.token = :token", PasswordResetService.class)
                     .setParameter("token", token)
                     .getSingleResult();
        } catch (Exception e) {
            return null; // token not found or query failed
        }
    }
}
