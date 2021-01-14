/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rec.erecruit.ejb;

import com.rec.erecruit.common.ApplicantDetails;
import com.rec.erecruit.common.PositionDetails;
import com.rec.erecruit.entity.Applicant;
import com.rec.erecruit.entity.Position;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;
import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

/**
 *
 * @author popa_
 */
@Stateless
public class PositionBean {
    
    
    
    private static final Logger LOG = Logger.getLogger(PositionBean.class.getName());
    
    @PersistenceContext
    private EntityManager em;

    public void createPosition(String name, Integer numberPeopleWanted, Integer openedBy, String department, String project, String requirements, String responsibilities) {

        Position position = new Position();

        position.setName(name);
        position.setPeopleWanted(numberPeopleWanted);
        position.setOpenedBy(openedBy);
        position.setDepartment(department);
        position.setProject(project);
        position.setRequirements(requirements);
        position.setResponsibilities(responsibilities);
        position.setStatus(true);

        em.persist(position);

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
    
    public List<ApplicantDetails> getAllApplicants() {
        LOG.info("getAllApplicants");
        try {
            TypedQuery<Applicant> typedQuery = em.createQuery("SELECT a FROM Applicant a ", Applicant.class);
            List<Applicant> applicants = (List<Applicant>) typedQuery.getResultList();
            for (Applicant applicant : applicants) {
                System.out.println(applicant.getUserId());
            }

            return copyApplicantsToDetails(applicants);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    public List<PositionDetails> getAllPositions() {
        LOG.info("getAllPositions");
        try {
            Query query = em.createQuery("SELECT u FROM Position u");
            List<Position> positions = (List<Position>) query.getResultList();
            return copyPositionsToDetails(positions);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    private List<PositionDetails> copyPositionsToDetails(List<Position> positions) {
        List<PositionDetails> detailsList = new ArrayList<>();
        for (Position position : positions) {
            PositionDetails positionDetails = new PositionDetails(position.getId(), position.getName(), position.getPeopleWanted(), position.getOpenedBy(), position.getDepartment(), position.getProject(), position.getRequirements(), position.getResponsibilities(), position.isStatus());
            detailsList.add(positionDetails);

        }
        return detailsList;
    }

    public void deletePositionByIds(Collection<Integer> positionIds) {
        LOG.info("deletePositionByIds");
        for (Integer positionId : positionIds) {
            Position position = em.find(Position.class, positionId);
            em.remove(position);
        }

    }

    public PositionDetails findById(Integer posId) {
        Position pos = em.find(Position.class, posId);
        return new PositionDetails(pos.getId(), pos.getName(), pos.getPeopleWanted(), pos.getOpenedBy(), pos.getDepartment(), pos.getProject(), pos.getRequirements(), pos.getResponsibilities(), pos.isStatus());
    }

    public void updatePosition(Integer id, String name, Integer number, String department, String project, String requirements, String responsibilities, boolean status) {
        LOG.info("updatePosition");
        Position pos = em.find(Position.class, id);
        pos.setName(name);
        pos.setPeopleWanted(number);
        pos.setDepartment(department);
        pos.setProject(project);
        pos.setRequirements(requirements);
        pos.setResponsibilities(responsibilities);
        pos.setStatus(status);
        em.persist(pos);
    }
    
    public void createApplicant(Integer userId,Integer positionId){
    LOG.info("createApplicant");
    Applicant app = new Applicant();
    app.setUserId(userId);
    app.setPositionId(positionId);
    em.persist(app);
    }
    
    public List<PositionDetails>[] checkApplied(Integer user_pos){
        LOG.info("checkApplied");
        List<PositionDetails> positionList = getAllPositions();
        List<ApplicantDetails> applicantList = getAllApplicants();
        List<PositionDetails> tempList = new ArrayList();
        for(PositionDetails pos : positionList){
                for(ApplicantDetails app :applicantList){
                    if(pos.getId().equals(app.getPositionId()) && app.getUserId().equals(user_pos)){                     
                        tempList.add(pos);
                    }
            }
        }
        positionList.removeAll(tempList);
        List<PositionDetails>[] nume=new ArrayList[2];
        nume[0]= positionList;
        nume[1]=tempList;
        return nume;
    }
    
   public List<PositionDetails> userPositions(List<PositionDetails> list){
        LOG.info("userPositions");
        List<PositionDetails> positionList = getAllPositions();
        List<PositionDetails> invalidList = list;
        positionList.removeAll(invalidList);      
        return positionList;
        }
        
    public void deleteApplicant(Integer userId,Integer positionId){
        LOG.info("deleteApplicant");
        String todelete="Delete FROM Applicant a where a.positionId="+positionId.toString()+" "+"AND a.userId="+userId.toString();
        System.out.println("PUNE AICI UN PRINT SI VEZI");
        TypedQuery<Applicant> typedQuery=em.createQuery(todelete,Applicant.class);  
        typedQuery.executeUpdate();
    }
}
