/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rec.erecruit.ejb;

import com.rec.erecruit.common.PositionDetails;
import com.rec.erecruit.entity.Applicant;
import com.rec.erecruit.entity.Position;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;
import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

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
        LOG.info("createPosition");
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
        LOG.info("copyPositionsToDetails");
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
        LOG.info("findPositionById");
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

    public void createApplicant(Integer userId, Integer positionId) {
        LOG.info("createApplicant");
        Applicant app = new Applicant();
        app.setUserId(userId);
        app.setPositionId(positionId);
        em.persist(app);
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
