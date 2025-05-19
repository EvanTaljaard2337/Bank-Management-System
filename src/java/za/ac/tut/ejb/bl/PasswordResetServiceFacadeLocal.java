/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package za.ac.tut.ejb.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.entities.PasswordResetService;

/**
 *
 * @author Evan
 */
@Local
public interface PasswordResetServiceFacadeLocal {

    void create(PasswordResetService passwordResetService);

    void edit(PasswordResetService passwordResetService);

    void remove(PasswordResetService passwordResetService);

    PasswordResetService find(Object id);

    List<PasswordResetService> findAll();

    List<PasswordResetService> findRange(int[] range);

    int count();
    
    public void sendMail(String recepient,String emailAddress);
    PasswordResetService findByToken(String token); // <-- Add this line
}
