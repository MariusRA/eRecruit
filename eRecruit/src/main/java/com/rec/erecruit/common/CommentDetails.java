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
public class CommentDetails {
    private Integer id;
    private String content;
    private Integer createdBy;
    private Integer ownedBy;
    private String date;
    private String username;

    public CommentDetails(Integer id, String content, Integer createdBy, Integer ownedBy, String date, String username) {
        this.id = id;
        this.content = content;
        this.createdBy = createdBy;
        this.ownedBy = ownedBy;
        this.date = date;
        this.username = username;
    }

    

    public Integer getId() {
        return id;
    }

    public String getContent() {
        return content;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    

    public Integer getCreatedBy() {
        return createdBy;
    }

    public Integer getOwnedBy() {
        return ownedBy;
    }

    public String getDate() {
        return date;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setCreatedBy(Integer createdBy) {
        this.createdBy = createdBy;
    }

    public void setOwnedBy(Integer ownedBy) {
        this.ownedBy = ownedBy;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    
}
