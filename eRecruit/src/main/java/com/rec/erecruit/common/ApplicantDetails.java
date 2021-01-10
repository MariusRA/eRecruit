/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rec.erecruit.common;

/**
 *
 * @author eli10
 */
public class ApplicantDetails implements java.io.Serializable{
    private Integer id;
    private Integer userId;
    private Integer positionId;

    public ApplicantDetails(Integer id, Integer userId, Integer positionId) {
        this.id = id;
        this.userId = userId;
        this.positionId = positionId;
    }
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getPositionId() {
        return positionId;
    }

    public void setPositionId(Integer positionId) {
        this.positionId = positionId;
    }
}
