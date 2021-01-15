/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rec.erecruit.ejb;

import com.rec.erecruit.common.ApplicantDetails;
import com.rec.erecruit.common.UserDetails;
import com.rec.erecruit.entity.Applicant;
import com.rec.erecruit.entity.User;
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
public class ApplicantBean {

    private static final Logger LOG = Logger.getLogger(ApplicantBean.class.getName());

    @PersistenceContext
    private EntityManager em;

    public List<ApplicantDetails> getAllApplicants(Integer id) {
        LOG.info("getAllApplicants");
        try {
            TypedQuery<Applicant> typedQuery = em.createQuery("SELECT a FROM Applicant a WHERE a.positionId = :posID", Applicant.class).setParameter("posID", id);
            List<Applicant> applicants = (List<Applicant>) typedQuery.getResultList();
            for (Applicant applicant : applicants) {
                System.out.println(applicant.getUserId());
            }

            return copyApplicantsToDetails(applicants);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    private List<ApplicantDetails> copyApplicantsToDetails(List<Applicant> applicants) {
        LOG.info("copyApplicantsToDetails");
        List<ApplicantDetails> detailsList = new ArrayList<>();
        for (Applicant applicant : applicants) {
            ApplicantDetails applicantDetials = new ApplicantDetails(applicant.getId(), applicant.getUserId(), applicant.getPositionId());
            detailsList.add(applicantDetials);

        }
        return detailsList;
    }

    public UserDetails findById(Integer userId) {
        LOG.info("findById");
        User user = em.find(User.class, userId);
        return new UserDetails(user.getId(), user.getLastName(), user.getFirstName(), user.getPhoneNumber(), user.getMobilePhoneNumber(), user.getEmail(), user.getJobTitle(), user.getDescription(), user.getUsername(), user.getPassword(), user.getRoles());
    }

    public List<UserDetails> applicantsToUsers(List<ApplicantDetails> applicants) {
        LOG.info("applicantsToUsers");
        List<UserDetails> detailsList = new ArrayList<>();

        for (ApplicantDetails applicant : applicants) {
            Integer userId = applicant.getUserId();
            UserDetails userDetails = findById(userId);

            detailsList.add(userDetails);

        }
        return detailsList;
    }

    public void deleteApplicantsByIds(Integer applicantId) {
        LOG.info("deleteApplicantsByIds");
        Applicant applicant = em.find(Applicant.class, applicantId);
        em.remove(applicant);

    }
    
    public void deleteApplicant(Integer userId,Integer positionId){
        LOG.info("deleteApplicant");
        String todelete="Delete FROM Applicant a where a.positionId="+positionId.toString()+" "+"AND a.userId="+userId.toString();
        TypedQuery<Applicant> typedQuery=em.createQuery(todelete,Applicant.class);  
        typedQuery.executeUpdate();
    }

    public Integer findApplicantByUserIdAndPositionId(Integer userId, Integer positionId) {
        LOG.info("findApplicantByUserIdAndPositionId");
        String myQuery = "SELECT a FROM Applicant a WHERE a.positionId = " + positionId.toString() + "AND a.userId = " + userId.toString();
        TypedQuery<Applicant> typedQuery = em.createQuery(myQuery, Applicant.class);
        List<Applicant> applicants = (List<Applicant>) typedQuery.getResultList();

        return applicants.get(0).getId();
    }


}
