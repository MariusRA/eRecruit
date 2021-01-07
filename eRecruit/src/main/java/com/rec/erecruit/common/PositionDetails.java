/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rec.erecruit.common;

/**
 *
 * @author popa_
 */
public class PositionDetails implements java.io.Serializable {
    
    private Integer id;
    
    private String name;
    private Integer peopleWanted;
    private Integer openedBy;
    private String department;
    private String project;
    private String requirements;
    private String responsibilities;
    private boolean status;

    public PositionDetails(Integer id, String name, Integer peopleWanted, Integer openedBy, String department, String project, String requirements, String responsibilities, boolean status) {
        this.id = id;
        this.name = name;
        this.peopleWanted = peopleWanted;
        this.openedBy = openedBy;
        this.department = department;
        this.project = project;
        this.requirements = requirements;
        this.responsibilities = responsibilities;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Integer getPeopleWanted() {
        return peopleWanted;
    }

    public Integer getOpenedBy() {
        return openedBy;
    }

    public String getDepartment() {
        return department;
    }

    public String getProject() {
        return project;
    }

    public String getRequirements() {
        return requirements;
    }

    public String getResponsibilities() {
        return responsibilities;
    }

    public boolean isStatus() {
        return status;
    }
    
    
}
