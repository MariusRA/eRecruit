/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rec.erecruit.ejb;

import com.rec.erecruit.common.UserDetails;
import com.rec.erecruit.entity.User;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;
import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

/**
 *
 * @author popa_
 */
@Stateless
public class UserBean {

    private static final Logger LOG = Logger.getLogger(UserBean.class.getName());

    @PersistenceContext
    private EntityManager em;

    public boolean checkDuplicatesDB(String Username) {
        boolean flag = false;

        List<UserDetails> users = getAllUsers();

        for (UserDetails user : users) {
            if (user.getUsername().equals(Username)) {
                flag = true;
            }
        }
        return flag;
    }

    public void createUser(String FirstName, String LastName, String PhoneNo, String MobileNo, String Mail, String JobTitle, String Description, String PasswordSha256, String Roles) {
        User user = new User();

        int length = 1;
        String generatedUsername;

        if (LastName.length() > 5) {
            generatedUsername = LastName.substring(0, 5) + FirstName.substring(0, length);
        } else {
            generatedUsername = LastName + FirstName.substring(0, length);
        }

        while (checkDuplicatesDB(generatedUsername)) {
            length++;

            if (LastName.length() > 5) {
                generatedUsername = LastName.substring(0, 5) + FirstName.substring(0, length);
            } else {
                generatedUsername = LastName + FirstName.substring(0, length);
            }
        }

        user.setLastName(LastName);
        user.setFirstName(FirstName);
        user.setPhoneNumber(PhoneNo);
        user.setMobilePhoneNumber(MobileNo);
        user.setEmail(Mail);
        user.setJobTitle(JobTitle);
        user.setDescription(Description);
        user.setPassword(PasswordSha256);
        user.setUsername(generatedUsername);
        user.setRoles(Roles);

        em.persist(user);
    }

    public List<UserDetails> getAllUsers() {
        LOG.info("getAllUsers");
        try {
            Query query = em.createQuery("SELECT u FROM User u");
            List<User> users = (List<User>) query.getResultList();
            return copyUsersToDetails(users);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    private List<UserDetails> copyUsersToDetails(List<User> users) {
        List<UserDetails> detailsList = new ArrayList<>();
        for (User user : users) {
            UserDetails userDetials = new UserDetails(user.getId(), user.getLastName(), user.getFirstName(), user.getPhoneNumber(), user.getMobilePhoneNumber(), user.getEmail(), user.getJobTitle(), user.getDescription(), user.getUsername(), user.getPassword(), user.getRoles());
            detailsList.add(userDetials);

        }
        return detailsList;
    }

    public void deleteUserByIds(Collection<Integer> userIds) {
        LOG.info("deleteUsersByIds");
        for (Integer userId : userIds) {
            User user = em.find(User.class, userId);
            em.remove(user);
        }

    }

    public UserDetails findById(Integer userId) {
        User user = em.find(User.class, userId);
        return new UserDetails(user.getId(), user.getLastName(), user.getFirstName(), user.getPhoneNumber(), user.getMobilePhoneNumber(), user.getEmail(), user.getJobTitle(), user.getDescription(), user.getUsername(), user.getPassword(), user.getRoles());
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    public void updateUser(Integer id, String firstName, String lastName, String phoneNumber, String mobilePhoneNumber, String email, String jobTitle, String description, String passwordSha256, String roles) {
        LOG.info("updateUser");
        User user = em.find(User.class, id);
        user.setLastName(lastName);
        user.setFirstName(firstName);
        user.setPhoneNumber(phoneNumber);
        user.setMobilePhoneNumber(mobilePhoneNumber);
        user.setEmail(email);
        user.setJobTitle(jobTitle);
        user.setDescription(description);
        user.setPassword(passwordSha256);
        user.setRoles(roles);
        em.persist(user);
    }

    public Integer getIdByUsername(String username) {
        LOG.info("getIdByUsername");
        try {
            //Query query = em.createQuery("SELECT u FROM User u WHERE u.username LIKE ?1").setParameter(1, username);
            
            TypedQuery<User> typedQuery=em.createQuery("SELECT u FROM User u WHERE u.username = :orice", User.class).setParameter("orice", username);   
            List<User> user =  typedQuery.getResultList();
            
            
            return user.get(0).getId();
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }
}
