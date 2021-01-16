/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rec.erecruit.ejb;

import com.rec.erecruit.common.UserDetails;
import com.rec.erecruit.entity.User;
import com.rec.erecruit.entity.UserSettings;
import java.util.ArrayList;
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
 * @author mariu
 */
@Stateless
public class UserSettingsBean {

    private static final Logger LOG = Logger.getLogger(UserSettingsBean.class.getName());

    @PersistenceContext
    private EntityManager em;

    public List<UserSettings> getAllUserSettings() {
        LOG.info("getAllUserDetails");
        try {
            Query query = em.createQuery("SELECT u FROM UserSettings u");
            List<UserSettings> usersSettings = (List<UserSettings>) query.getResultList();
            return usersSettings;
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }
    
    public UserSettings findById(Integer userId) {
        LOG.info("findUserById");
        UserSettings user = em.find(UserSettings.class, userId);
        return user;
    }
    
    

}