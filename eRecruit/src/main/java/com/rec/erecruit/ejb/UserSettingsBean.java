/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rec.erecruit.ejb;

import com.rec.erecruit.common.UserSettingsDetails;
import com.rec.erecruit.entity.Comment;
import com.rec.erecruit.entity.UserSettings;
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

    
    public boolean checkIdInDb(Integer id){
        String query="SELECT u FROM UserSettings u WHERE u.userId= "+id;
        TypedQuery<UserSettings> typedQuery=em.createQuery(query,UserSettings.class);  
        List<UserSettings> users = (List<UserSettings>) typedQuery.getResultList();
        System.out.println("AICI E SIZEUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUL: "+users.size());
        if(users.size()>0){
            return true;
        }
        else{
            return false;
        }
    }
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

    public void createUserSettings(String address,String Relocation,String linkCV,String interviewDate,String comments,Integer id) {
        LOG.info("createUserSettings");
        
        UserSettings us=new UserSettings();
        us.setAddress(address);
        if(Relocation=="1"){
            us.setRelocation(true);
        }
        else if(Relocation=="0"){
            us.setRelocation(false);
        }
        
        us.setLinkCV(linkCV);
        us.setInterviewDate(interviewDate);
        us.setComments(comments);
        us.setUserId(id);
        
        em.persist(us);
        
        
    }

}
