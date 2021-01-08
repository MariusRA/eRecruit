/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rec.erecruit.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author popa_
 */
@Entity
@Table(name = "POSITIONS")
public class Position implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String name;
    private Integer peopleWanted;
    private Integer openedBy;
    private String department;
    private String project;
    private String requirements;
    private String responsibilities;
    private boolean status;

    public static long getSerialVersionUID() {
        return serialVersionUID;
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

    public void setName(String name) {
        this.name = name;
    }

    public void setPeopleWanted(Integer peopleWanted) {
        this.peopleWanted = peopleWanted;
    }

    public void setOpenedBy(Integer openedBy) {
        this.openedBy = openedBy;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public void setRequirements(String requirements) {
        this.requirements = requirements;
    }

    public void setResponsibilities(String responsibilities) {
        this.responsibilities = responsibilities;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Position)) {
            return false;
        }
        Position other = (Position) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.rec.erecruit.entity.Position[ id=" + id + " ]";
    }

}
