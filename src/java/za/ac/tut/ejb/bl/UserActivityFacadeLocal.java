/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package za.ac.tut.ejb.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.entities.UserActivity;

/**
 *
 * @author Evan
 */
@Local
public interface UserActivityFacadeLocal {

    void create(UserActivity userActivity);

    void edit(UserActivity userActivity);

    void remove(UserActivity userActivity);

    UserActivity find(Object id);

    List<UserActivity> findAll();

    List<UserActivity> findRange(int[] range);

    int count();
    
}
